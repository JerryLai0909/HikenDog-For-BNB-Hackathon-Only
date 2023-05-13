import 'package:best_flutter_ui_templates/introduction_animation/components/care_view.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/center_next_button.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/mood_diary_vew.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/relax_view.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/splash_view.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/top_back_skip_view.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/welcome_view.dart';
import 'package:flutter/material.dart';

import '../fitness_app/fitness_app_home_screen.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
        backgroundColor: Color(0xffF7EBE1),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 242, 206, 253),
                Color.fromARGB(255, 252, 252, 211),
                Color.fromARGB(255, 216, 219, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topRight: Radius.circular(8.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: ClipRect(
            child: Stack(
              children: [
                SplashView(
                  animationController: _animationController!,
                ),
                RelaxView(
                  animationController: _animationController!,
                ),
                CareView(
                  animationController: _animationController!,
                ),
                MoodDiaryVew(
                  animationController: _animationController!,
                ),
                WelcomeView(
                  animationController: _animationController!,
                ),
                TopBackSkipView(
                  onBackClick: _onBackClick,
                  onSkipClick: _onSkipClick,
                  animationController: _animationController!,
                ),
                CenterNextButton(
                  animationController: _animationController!,
                  onNextClick: _onNextClick,
                ),
              ],
            ),
          ),
        ));
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    // Navigator.pop(context);
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            FitnessAppHomeScreen(),
      ),
    );
  }
}
