import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/on_boarding/onboarding_cubit.dart';
import '../views/on_boarding/onboarding_states.dart';
import 'custom_panel.dart';

class CustomPageBuilder extends StatelessWidget {
  const CustomPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit,OnBoardingStates>(
      builder: (context,state)
      {
        var cubit = BlocProvider.of<OnBoardingCubit>(context);
        return PageView.builder(
          onPageChanged: (index)
          {
            if(index == cubit.panels.length-1)
            {
              cubit.changeState(true);
            }
            else
            {
              cubit.changeState(false);
            }
          },
          physics: const BouncingScrollPhysics(),
          controller: cubit.pageController,
          itemBuilder: (context, index) {
            return CustomPanel(panel: cubit.panels[index]);
          },
          itemCount: cubit.panels.length,
        );
      },
    );
  }
}
