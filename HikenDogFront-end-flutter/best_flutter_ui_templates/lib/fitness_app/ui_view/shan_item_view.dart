import 'package:flutter/material.dart';
import '../fitness_app_theme.dart';

class ShanItemView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final mainText;
  final subText;
  final imageBackground;
  final imageFront;

  const ShanItemView(
      {Key? key,
      this.animationController,
      this.animation,
      this.mainText,
      this.subText,
      this.imageBackground,
      this.imageFront})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 245, 220),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 242, 206, 253),
                                Color.fromARGB(255, 252, 252, 211),
                                Color.fromARGB(255, 216, 219, 255)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: FitnessAppTheme.grey.withOpacity(0.6),
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 100,
                                          right: 16,
                                          top: 16,
                                        ),
                                        child: Text(
                                          mainText,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            letterSpacing: 0.0,
                                            color:
                                                Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 100,
                                      bottom: 12,
                                      top: 4,
                                      right: 16,
                                    ),
                                    child: Text(
                                      subText,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 0.0,
                                        color: FitnessAppTheme.grey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 20,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset(imageFront),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
