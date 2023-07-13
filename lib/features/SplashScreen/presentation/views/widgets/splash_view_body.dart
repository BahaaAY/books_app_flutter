import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/SplashScreen/presentation/views/widgets/slide_fadein_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>  with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnim;
  late Animation<double> fadeInAnim;
  @override
  void initState() {
    initAnimation();
    super.initState();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 2000),(){
      GoRouter.of(context).pushReplacement(homeRoute);
    });
  }

  void initAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200),);
    slidingAnim = Tween<Offset>(begin: const Offset(0, 2), end:const Offset(0,0) ).animate(animationController);
    fadeInAnim = Tween<double>(begin: 0,end: 1).animate(animationController);
    animationController.forward();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 8,
        ),
        AnimatedBuilder(
          animation: slidingAnim,
          builder: (context, _){
            return SlidingFadeInText(fadeInAnim: fadeInAnim, slidingAnim: slidingAnim);
          },
        ),
      ],
    );
  }
}

