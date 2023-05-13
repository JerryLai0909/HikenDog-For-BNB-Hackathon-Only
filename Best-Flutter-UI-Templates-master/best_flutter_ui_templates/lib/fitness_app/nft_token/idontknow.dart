import 'package:best_flutter_ui_templates/fitness_app/data_models/nft_token_info/nft_info.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:flutter/material.dart';

import '../main_game/category.dart';
import 'nft_detail_info_view.dart';

class Idontknow extends StatefulWidget {
  const Idontknow({Key? key, this.NFTList})
      : super(key: key);

  final NFTList;
  @override
  _IdontknowState createState() => _IdontknowState();
}

class _IdontknowState extends State<Idontknow>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
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
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 100,
        width: double.infinity,
        // background :Colors.transparent,
        decoration: BoxDecoration(color: Colors.transparent),
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: widget.NFTList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      widget.NFTList.length > 10 ? 10 : widget.NFTList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return CategoryView(
                    nftEntity: widget.NFTList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      this.nftEntity,
      this.animationController,
      this.animation})
      : super(key: key);

  final NFTInfo? nftEntity;
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
              child: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/nft/' + nftEntity!.nft_uri_background),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    splashColor:
                        FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                    onTap: () {
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => NFTDetailInfoView(nft_hash : nftEntity!.nft_hash),
                        ),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16),
                          child: Image.asset(
                              'assets/nft/' + nftEntity!.nft_uri_path),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
