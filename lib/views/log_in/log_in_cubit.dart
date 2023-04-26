import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:full_e_commerce_application/network/end_points.dart';
import 'package:full_e_commerce_application/network/remote/dio_helper.dart';
import 'package:full_e_commerce_application/views/log_in/log_in_states.dart';

import '../../models/log_in_model.dart';

class LogInViewCubit extends Cubit<LogInViewStates> {
  LogInViewCubit() : super(LogInViewInitialize());
  LogInDataModel? logInDataModel;

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
      print(error);
    });
  }
}