import 'package:best_flutter_ui_templates/fitness_app/data_models/game_info/game_info.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/main_game/mission_detail_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/providers/game_provider.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../api/index_api.dart';
import '../nft_token/nft_detail_info_view.dart';

class MemoryListView extends StatefulWidget {
  const MemoryListView({
    Key? key,
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
  }) : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _MemoryListViewState createState() => _MemoryListViewState();
}

class _MemoryListViewState extends State<MemoryListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    context.read<GameProvider>().getGameInfoListRequest();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: context.watch<GameProvider>().gameList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      context.watch<GameProvider>().gameList.length > 10
                          ? 10
                          : context.watch<GameProvider>().gameList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return GameInfoView(
                    gameInfoEntity:
                        context.watch<GameProvider>().gameList[index],
                    animation: animation,
                    animationController: animationController!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class GameInfoView extends StatelessWidget {
  const GameInfoView(
      {Key? key, this.gameInfoEntity, this.animationController, this.animation})
      : super(key: key);

  final GameInfo? gameInfoEntity;
  final AnimationController? animationController;
  final Animation<double>? animation;

  List<Color> getColor() {
    final index = gameInfoEntity!.id;
    List<Color> colorList = [];
    if (index % 4 == 1) {
      colorList.add(Color.fromARGB(255, 252, 144, 229));
      colorList.add(Color.fromARGB(255, 190, 223, 70));
    } else if (index % 4 == 2) {
      colorList.add(Color.fromARGB(255, 135, 171, 255));
      colorList.add(Color.fromARGB(255, 255, 179, 247));
    } else if (index % 4 == 3) {
      colorList.add(Color.fromARGB(255, 249, 255, 126));
      colorList.add(Color.fromARGB(255, 125, 238, 255));
    } else {
      colorList.add(Color.fromARGB(255, 255, 182, 239));
      colorList.add(Color.fromARGB(255, 239, 255, 183));
    }
    return colorList;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.white24,
              onTap: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => MissionDetailScreen(
                        game_hash: gameInfoEntity!.game_hash,
                        animationController: animationController!),
                  ),
                );
              },
              child: SizedBox(
                width: 300,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 8, right: 8, bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: getColor()[1].withOpacity(0.6),
                                offset: const Offset(1.1, 4.0),
                                blurRadius: 8.0),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              getColor()[0],
                              getColor()[1],
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(54.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 54, left: 16, right: 16, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                gameInfoEntity!.game_name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.2,
                                  color: FitnessAppTheme.white,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        gameInfoEntity!.game_desc1
                                            .split('*')
                                            .join('\n'),
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          letterSpacing: 0.2,
                                          color: FitnessAppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              gameInfoEntity?.game_desc2 != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          'Total Gain:' +
                                              gameInfoEntity!.game_desc2
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            letterSpacing: 0.2,
                                            color: FitnessAppTheme.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            'NFT',
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              letterSpacing: 0.2,
                                              color: FitnessAppTheme.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: FitnessAppTheme.nearlyWhite,
                                        shape: BoxShape.circle,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: FitnessAppTheme.nearlyBlack
                                                  .withOpacity(0.4),
                                              offset: Offset(8.0, 8.0),
                                              blurRadius: 8.0),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.add,
                                          color: getColor()[1],
                                          size: 24,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.nearlyWhite.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 16,
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                            'assets/icon/' + gameInfoEntity!.game_media_path1),
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
