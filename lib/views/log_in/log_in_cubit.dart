import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/network/end_points.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';
import 'package:full_e_commerce_application/views/log_in/log_in_states.dart';
import 'package:full_e_commerce_application/widgets/CustomButton.dart';

import '../../models/log_in_model.dart';

class LogInViewCubit extends Cubit<LogInViewStates> {
  LogInViewCubit() : super(LogInViewInitialize());

  LogInDataModel? logInDataModel;
  TextEditingController eMail = TextEditingController();
  TextEditingController password = TextEditingController();


  bool logInLoading = false;
  var formKey = GlobalKey<FormState>();


  Widget changeLogInButton(double screenHeight,double screenWidth)
  {
    if(logInLoading == true)
    {
      return const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(53, 65, 176, 0.9),
        ),
      );
    }
    else
    {
      return CustomButton(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        label: 'L O G I N',
        onPressed: ()
        {
          if(formKey.currentState!.validate())
          {
            debugPrint(eMail.text);
            debugPrint(password.text);
            userLogIn(
              eMail: eMail.text,
              password: password.text,
            );
          }
        },
      );
    }
  }


  void userLogIn({
    required String eMail,
    required String password,
  }) {
    emit(LogInViewLoading());
    debugPrint('$login , ${eMail.toString()} , ${password.toString()} ');
    DioHelper.postData(
      url: login,
      body: {
        'email': eMail.toString(),
        'password': password.toString(),
      },
    ).then((value) {
      emit(LogInViewSuccess());
      print(value.data);
      logInDataModel = LogInDataModel.fromJson(value.data);
      print(logInDataModel!.data!.token);

    }).catchError((error) {
      emit(LogInViewFailure(error.toString()));
      print(error.toString());
    });
  }



}
