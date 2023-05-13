import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

import '../data_models/nft_token_info/nft_detail_info.dart';
import '../main_game/category.dart';
import 'nft_detail_info_view.dart';

class NFTRecommandList extends StatefulWidget {
  const NFTRecommandList({Key? key, this.callBack, this.NFTList})
      : super(key: key);

  final Function(String nft_hash)? callBack;
  final NFTList;
  @override
  _NFTRecommandListState createState() => _NFTRecommandListState();
}

class _NFTRecommandListState extends State<NFTRecommandList>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate(
                widget.NFTList.length,
                (int index) {
                  final int count = widget.NFTList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController?.forward();
                  return CategoryView(
                    nftEntity: widget.NFTList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key, this.nftEntity, this.animationController, this.animation})
      : super(key: key);

  final NFTDetailInfo? nftEntity;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: InkWell(
              onTap: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) =>
                        NFTDetailInfoView(nft_hash: nftEntity!.nft_hash),
                  ),
                );
              },
              child: SizedBox(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
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
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color:
                                          FitnessAppTheme.grey.withOpacity(0.3),
                                      offset: Offset(1.1, 1.1),
                                      blurRadius: 3.0),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, left: 8, right: 8),
                                            child: Text(
                                              nftEntity!.nft_main_desc,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.57,
                                                color:
                                                    FitnessAppTheme.darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4,
                                                left: 12,
                                                right: 12,
                                                bottom: 4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  nftEntity!.nft_desc1,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color: FitnessAppTheme.grey,
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        nftEntity!.hot_rank
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 18,
                                                          letterSpacing: 0.27,
                                                          color: FitnessAppTheme
                                                              .grey,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.pink,
                                                        size: 16,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 110,
                                            width: 48,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, left: 8, right: 8),
                                            child: Text(
                                              nftEntity!.nft_desc2,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                letterSpacing: 0.57,
                                                color:
                                                    FitnessAppTheme.darkerText,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                        animation: animationController!,
                        builder: (BuildContext context, Widget? child) {
                          return FadeTransition(
                            opacity: animation!,
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  0.0, 50 * (1.0 - animation!.value), 0.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                margin:
                                    const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    onTap: () {
                                      Navigator.push<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) =>
                                              NFTDetailInfoView(
                                                  nft_hash:
                                                      nftEntity!.nft_hash),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                          ),
                                          child: Image.asset('assets/nft/' +
                                              nftEntity!.nft_uri_path),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
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
