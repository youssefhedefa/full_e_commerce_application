import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_e_commerce_application/network/local/cache_helper.dart';
import 'package:full_e_commerce_application/views/hello_view.dart';
import 'package:full_e_commerce_application/views/on_boarding/onboarding_cubit.dart';
import 'package:full_e_commerce_application/views/on_boarding/onboarding_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/custom_page_builder.dart';



class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  void skipSubmit(BuildContext context)
  {
    CacheHelper.setStartingScreen(key: 'is on boarding submitted', value: true);
    Navigator.pushReplacementNamed(context, HelloView.id);
  }

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = const Color.fromRGBO(255, 255, 255, 1);
    return BlocProvider(
      create: (context)=>OnBoardingCubit(),
        child: BlocBuilder<OnBoardingCubit,OnBoardingStates>(
          builder: (context,state)
          {
            var cubit = BlocProvider.of<OnBoardingCubit>(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                actions: [
                  TextButton(
                      onPressed: (){
                        skipSubmit(context);
                      },
                      child: const Text(
                          'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(53, 65, 176, 1),
                        ),
                      ),),
                ],
              ),
              body: Container(
                padding: const EdgeInsets.only(left: 24.0,right: 24.0,),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: backGroundColor,
                child: Column(
                  children: [
                    const Expanded(
                      child: CustomPageBuilder(),
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
                              if(cubit.isBoardingLast == true)
                              {
                                skipSubmit(context);
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
