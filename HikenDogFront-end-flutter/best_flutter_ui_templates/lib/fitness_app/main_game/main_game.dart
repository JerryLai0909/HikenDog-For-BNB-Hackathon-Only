import 'package:best_flutter_ui_templates/fitness_app/main_game/main_game_detail.dart';
import 'package:best_flutter_ui_templates/fitness_app/main_game/main_game_list_view.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

import '../fitness_app_theme.dart';
import 'category.dart';
import 'main_game_recommand_list_view.dart';

class MainGame extends StatefulWidget {
  const MainGame({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _MainGameState createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
  }

  CategoryType categoryType = CategoryType.MISSION;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getSearchBarUI(),
                      getCategoryUI(),
                      getCategoryUI2(),
                      // getCategoryUI(),
                      // Flexible(
                      //   child: getMainGameList(),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            '任务类型',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: FitnessAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(
                  CategoryType.MISSION, categoryType == CategoryType.MISSION),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(CategoryType.LINE, categoryType == CategoryType.LINE),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.TOKEN, categoryType == CategoryType.TOKEN),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(CategoryType.NFT, categoryType == CategoryType.NFT),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        MainGameRecommandListView(
          categoryList: Category.categoryList,
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getCategoryUI2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            '挑战类型',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: FitnessAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI2(CategoryType.ONE, categoryType == CategoryType.ONE),
              const SizedBox(
                width: 16,
              ),
              getButtonUI2(CategoryType.TWO, categoryType == CategoryType.TWO),
              const SizedBox(
                width: 16,
              ),
              getButtonUI2(
                  CategoryType.THREE, categoryType == CategoryType.THREE),
              const SizedBox(
                width: 16,
              ),
              getButtonUI2(
                  CategoryType.FOUR, categoryType == CategoryType.FOUR),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        MainGameRecommandListView(
          categoryList: Category.categoryList2,
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getMainGameList() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '推荐路线',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: FitnessAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: MainGameInfoListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => MainGameDetail(),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.MISSION == categoryTypeData) {
      txt = '任务型';
    } else if (CategoryType.LINE == categoryTypeData) {
      txt = '线路';
    } else if (CategoryType.TOKEN == categoryTypeData) {
      txt = '代币';
    } else if (CategoryType.NFT == categoryTypeData) {
      txt = 'NFT';
    } else if (CategoryType.ONE == categoryTypeData) {
      txt = '极限';
    } else if (CategoryType.TWO == categoryTypeData) {
      txt = '竞速';
    } else if (CategoryType.THREE == categoryTypeData) {
      txt = '解密';
    } else if (CategoryType.FOUR == categoryTypeData) {
      txt = '日出';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? FitnessAppTheme.nearlyDarkBlue
                : FitnessAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: FitnessAppTheme.nearlyDarkBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? FitnessAppTheme.nearlyWhite
                        : FitnessAppTheme.nearlyDarkBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getButtonUI2(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.MISSION == categoryTypeData) {
      txt = '任务型';
    } else if (CategoryType.LINE == categoryTypeData) {
      txt = '线路';
    } else if (CategoryType.TOKEN == categoryTypeData) {
      txt = '代币';
    } else if (CategoryType.NFT == categoryTypeData) {
      txt = 'NFT';
    } else if (CategoryType.ONE == categoryTypeData) {
      txt = '极限';
    } else if (CategoryType.TWO == categoryTypeData) {
      txt = '竞速';
    } else if (CategoryType.THREE == categoryTypeData) {
      txt = '解密';
    } else if (CategoryType.FOUR == categoryTypeData) {
      txt = '日出';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? FitnessAppTheme.nearlyDarkBlue
                : FitnessAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: FitnessAppTheme.nearlyDarkBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? FitnessAppTheme.nearlyWhite
                        : FitnessAppTheme.nearlyDarkBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: FitnessAppTheme.nearlyDarkBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: '登山路线/NFT/任务/奖励',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'SHAN',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: FitnessAppTheme.grey,
                  ),
                ),
                Text(
                  '游戏和路线',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: FitnessAppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.add,
            size: 40,
          ),
        ],
      ),
    );
  }
}

enum CategoryType { MISSION, LINE, TOKEN, NFT, ONE, TWO, THREE, FOUR }
