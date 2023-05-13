import 'package:best_flutter_ui_templates/fitness_app/main_game/mission_flag_list_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/providers/mission_provider.dart';
import 'package:flutter/material.dart';
import '../api/index_api.dart';
import '../fitness_app_theme.dart';
import 'package:provider/provider.dart';

class MissionDetailScreen extends StatefulWidget {
  String? mission_hash;
  String? game_hash;
  final AnimationController animationController;
  MissionDetailScreen(
      {Key? key,
      this.mission_hash = '',
      this.game_hash = '',
      required this.animationController})
      : super(key: key);

  @override
  _MissionDetailScreenState createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    Map<String, dynamic> paramas = {};
    if (widget.mission_hash != '') {
      paramas['mission_hash'] = widget.mission_hash;
      context.read<MissionProvider>().getMissionDetailByMisOrGameHash(paramas);
    } else if (widget.game_hash != '') {
      paramas['game_hash'] = widget.game_hash;
      context.read<MissionProvider>().getMissionDetailByMisOrGameHash(paramas);
    } else {}
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      color: FitnessAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/nft/' +
                          (context
                              .watch<MissionProvider>()
                              .missionDetail
                              .mission_media_path2!)),
                      fit: BoxFit.cover, // 适应图片宽度或高度，选择适当的拉伸方式
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.nearlyWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                              context
                                  .watch<MissionProvider>()
                                  .missionDetail
                                  .mission_name!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: FitnessAppTheme.darkerText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  context
                                      .watch<MissionProvider>()
                                      .missionDetail
                                      .mission_desc1!,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: FitnessAppTheme.grey,
                                  ),
                                )),
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) =>
                                              MissionFlagListScreen(
                                                  mission_hash: context
                                                      .watch<MissionProvider>()
                                                      .missionDetail
                                                      .mission_hash!,
                                                  animationController:
                                                      animationController!),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'More',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16,
                                            letterSpacing: 0.27,
                                            color: FitnessAppTheme.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  getTimeBoxUI('24', 'Mana Cost'),
                                  getTimeBoxUI('3 NFT ', 'Gain '),
                                  getTimeBoxUI('In Process', 'Status'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(
                                  context
                                      .watch<MissionProvider>()
                                      .missionMainDesc,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                    fontFamily: 'WorkSans',
                                    color: FitnessAppTheme.grey,
                                  ),
                                  maxLines: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // Container(
                                  //   width: 48,
                                  //   height: 48,
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       gradient: LinearGradient(colors: [
                                  //         Color.fromARGB(255, 242, 206, 253),
                                  //         Color.fromARGB(255, 252, 252, 211),
                                  //         Color.fromARGB(255, 216, 219, 255)
                                  //       ]),
                                  //       color: FitnessAppTheme.nearlyWhite,
                                  //       borderRadius: const BorderRadius.all(
                                  //         Radius.circular(16.0),
                                  //       ),
                                  //       border: Border.all(
                                  //           color: FitnessAppTheme.grey
                                  //               .withOpacity(0.2)),
                                  //     ),
                                  //     child: Icon(
                                  //       Icons.deck,
                                  //       color: Colors.black,
                                  //       size: 28,
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   width: 16,
                                  // ),
                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: FitnessAppTheme.nearlyDarkBlue,
                                        gradient: LinearGradient(colors: [
                                          Color.fromARGB(255, 242, 206, 253),
                                          Color.fromARGB(255, 252, 252, 211),
                                          Color.fromARGB(255, 216, 219, 255)
                                        ]),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: FitnessAppTheme
                                                  .nearlyDarkBlue
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Start',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            color: FitnessAppTheme.nearlyBlack,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: CurvedAnimation(
                    parent: animationController!, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FitnessAppTheme.nearlyDarkBlue,
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 242, 206, 253),
                        Color.fromARGB(255, 252, 252, 211),
                        Color.fromARGB(255, 216, 219, 255)
                      ]),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color:
                                FitnessAppTheme.nearlyDarkBlue.withOpacity(0.5),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: FitnessAppTheme.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FitnessAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 242, 206, 253),
            Color.fromARGB(255, 252, 252, 211),
            Color.fromARGB(255, 216, 219, 255)
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: FitnessAppTheme.nearlyBlack,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: FitnessAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
