import 'package:flutter/material.dart';

class RelaxView extends StatelessWidget {
  final AnimationController animationController;

  const RelaxView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Container(
              constraints: BoxConstraints.expand(width: double.infinity),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _relaxAnimation,
                    child: Text(
                      "Overview",
                      style: TextStyle(
                          fontSize: 48.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SlideTransition(
                    position: _textAnimation,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        "POAP\nNFT\nHiking to Earn",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _imageAnimation,
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 350, maxHeight: 250),
                      child: Image.asset(
                        'assets/icon/icon_dog_2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
