import 'package:best_flutter_ui_templates/fitness_app/api/index_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../data_models/mission_info/mission_everything.dart';
import '../fitness_app_theme.dart';
import '../providers/user_provider.dart';
import 'dart:math';

class MissionEverythingItemView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final MissionEverything misEntity;

  const MissionEverythingItemView(
      {Key? key,
      this.animationController,
      this.animation,
      required this.misEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius_paramas = 20.0;
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
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 242, 206, 253),
                      Color.fromARGB(255, 252, 252, 211),
                      Color.fromARGB(255, 216, 219, 255),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  color: FitnessAppTheme.nearlyWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius_paramas),
                      bottomLeft: Radius.circular(radius_paramas),
                      bottomRight: Radius.circular(radius_paramas),
                      topRight: Radius.circular(radius_paramas)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 4),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                          color: HexColor('#87A0E5')
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                'Mission Name',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  letterSpacing: -0.1,
                                                  color: FitnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                  child: Text(
                                                    misEntity.flag_name!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FitnessAppTheme
                                                              .fontName,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: FitnessAppTheme
                                                          .darkerText,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                  child: Text(
                                                    'Enjoy',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FitnessAppTheme
                                                              .fontName,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      letterSpacing: -0.2,
                                                      color: FitnessAppTheme
                                                          .grey
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                          color: HexColor('#F56E98')
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                'Mission marker',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  letterSpacing: -0.1,
                                                  color: FitnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                  child: Text(
                                                    misEntity.mountain_info!
                                                            .mo_name +
                                                        '\n' +
                                                        misEntity.mountain_info!
                                                            .mo_desc1,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FitnessAppTheme
                                                              .fontName,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: FitnessAppTheme
                                                          .darkerText,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, bottom: 3),
                                                  child: Text(
                                                    '',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FitnessAppTheme
                                                              .fontName,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      letterSpacing: -0.2,
                                                      color: FitnessAppTheme
                                                          .grey
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: FitnessAppTheme.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100.0),
                                        ),
                                        border: new Border.all(
                                            width: 4,
                                            color: FitnessAppTheme
                                                .nearlyDarkBlue
                                                .withOpacity(0.2)),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/icon/' +
                                              misEntity.misd_media_path1!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('NFT\nReward'),
                                ],
                              ),
                              SizedBox(width: 40),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Image.asset(
                                  'assets/nft/' +
                                      (new Random().nextInt(20) + 1)
                                          .toString() +
                                      '.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Image.asset(
                                  'assets/nft/' +
                                      (new Random().nextInt(20) + 1)
                                          .toString() +
                                      '.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Image.asset(
                                  'assets/nft/' +
                                      (new Random().nextInt(20) + 1)
                                          .toString() +
                                      '.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Image.asset(
                                  'assets/nft/' +
                                      (new Random().nextInt(20) + 1)
                                          .toString() +
                                      '.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Image.asset(
                                  'assets/nft/' +
                                      (new Random().nextInt(20) + 1)
                                          .toString() +
                                      '.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
