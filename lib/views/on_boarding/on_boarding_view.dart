import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/views/login_view.dart';
import 'package:full_e_commerce_application/views/on_boarding/onboarding_cubit.dart';
import 'package:full_e_commerce_application/views/on_boarding/onboarding_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/custom_panel.dart';



class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = const Color.fromRGBO(255, 255, 255, 1);
    return BlocProvider(
      create: (context)=>OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit,OnBoardingStates>(
          listener: (context,state){},
          builder: (context,state)
          {
            var cubit = BlocProvider.of<OnBoardingCubit>(context);
            return Scaffold(
              body: Container(
                padding: const EdgeInsets.all(24.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: backGroundColor,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
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
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 26),
                      child: Row(
                        children: [
                          SmoothPageIndicator(
                            effect: const ExpandingDotsEffect(
                              spacing: 4,
                              dotHeight: 16,
                              dotWidth: 18,
                            ),
                            controller: cubit.pageController,
                            count: cubit.panels.length,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              if(cubit.panelIndex == 2)
                              {
                                Navigator.pushNamed(context, LoginView.id);
                              }
                              else
                              {
                                cubit.pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            child: cubit.buttonChanged(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}




