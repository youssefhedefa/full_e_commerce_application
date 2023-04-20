import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:full_e_commerce_application/views/on_boarding/onboarding_states.dart';
import 'package:full_e_commerce_application/widgets/get_started_button.dart';
import 'package:full_e_commerce_application/widgets/next_button.dart';
import '../../models/boarding_model.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>
{
  OnBoardingCubit() : super(OnBoardingInitialize());

  List<OnBoardingModel> panels = [
    OnBoardingModel(
      'assets/images/first panel.png',
      'Browse thousands of product in one place',
      'Browse by items, brands or by your favourite eshop',
    ),
    OnBoardingModel(
      'assets/images/second panel.png',
      'Choose your favourite payment method',
      'Choose mobile online money, visa or cash on delivery',
    ),
    OnBoardingModel(
      'assets/images/third panel.png',
      'confirm your order and await delivery',
      'choose from a wide range or deliver options eshop pickup point',
    ),
  ];
  int panelIndex = 0;
  PageController pageController = PageController();

  void changeIndex(int index)
  {
    panelIndex = index;
  }

  bool isBoardingLast = false;
  void changeState(bool state)
  {
    isBoardingLast = state;
  }

  Widget buttonChanged()
  {
    if(isBoardingLast == true)
    {
      emit(OnBoardingGetStarted());
      return const GetStartedButton();
    }
    else
    {
      emit(OnBoardingNext());
      return const NextButton();
    }
  }


}