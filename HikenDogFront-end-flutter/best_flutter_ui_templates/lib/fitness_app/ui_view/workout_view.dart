import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import '../fitness_app_theme.dart';

class WorkoutView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const WorkoutView({Key? key, this.animationController, this.animation})
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
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 242, 206, 253),
                    Color.fromARGB(255, 252, 252, 211),
                    Color.fromARGB(255, 216, 219, 255)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.6),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 40, top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Weekly News',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FitnessAppTheme.fontName,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          letterSpacing: 0.0,
                          color: FitnessAppTheme.dark_grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: const Text(
                          'The Mystery Club \nis about to move in',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            letterSpacing: 0.0,
                            color: FitnessAppTheme.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 4),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 4),
                      //         child: Icon(
                      //           Icons.timer,
                      //           color: FitnessAppTheme.grey,
                      //           size: 16,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 4.0),
                      //         child: const Text(
                      //           '12 min',
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontFamily: FitnessAppTheme.fontName,
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 14,
                      //             letterSpacing: 0.0,
                      //             color: FitnessAppTheme.grey,
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: SizedBox(),
                      //       ),
                      //       Container(
                      //         decoration: BoxDecoration(
                      //           color: FitnessAppTheme.nearlyWhite,
                      //           shape: BoxShape.circle,
                      //           boxShadow: <BoxShadow>[
                      //             BoxShadow(
                      //                 color: FitnessAppTheme.nearlyBlack
                      //                     .withOpacity(0.4),
                      //                 offset: Offset(8.0, 8.0),
                      //                 blurRadius: 8.0),
                      //           ],
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(0.0),
                      //           child: Icon(
                      //             Icons.arrow_right,
                      //             color: Color.fromARGB(255, 45, 111, 232),
                      //             size: 44,
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
