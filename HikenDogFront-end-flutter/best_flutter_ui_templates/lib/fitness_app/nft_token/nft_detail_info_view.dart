import 'package:best_flutter_ui_templates/fitness_app/providers/nft_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../fitness_app_theme.dart';

class NFTDetailInfoView extends StatefulWidget {
  final String? nft_hash;
  NFTDetailInfoView({Key? key, this.nft_hash}) : super(key: key);
  @override
  _NFTDetailInfoViewState createState() => _NFTDetailInfoViewState();
}

class _NFTDetailInfoViewState extends State<NFTDetailInfoView>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    context.read<NFTProvider>().getNFTDetailInfo(widget.nft_hash!);
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
       backgroundColor: Color.fromARGB(255, 246, 242, 250),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                ),
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 120),
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
                                  .watch<NFTProvider>()
                                  .NFTSingle
                                  .nft_main_desc,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  context
                                      .watch<NFTProvider>()
                                      .NFTSingle
                                      .nft_desc1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.pink,
                                  ),
                                ),
                                SizedBox(width: 80),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        context
                                            .watch<NFTProvider>()
                                            .NFTSingle
                                            .hot_rank
                                            .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          letterSpacing: 0.27,
                                          color: FitnessAppTheme.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                        size: 24,
                                      ),
                                    ],
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
                                  getTimeBoxUI(
                                      context
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_token_cost
                                          .toString(),
                                      'Token Cost'),
                                  getTimeBoxUI(
                                      context
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_fragment_require
                                          .toString(),
                                      'Frag Cost'),
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
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_main_desc +
                                      '\n' +
                                      context
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_desc1 +
                                      '\n' +
                                      context
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_desc2 +
                                      '\n\n' +
                                      context
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_address +
                                      '\n' +
                                      context
                                          .watch<NFTProvider>()
                                          .NFTSingle
                                          .nft_type,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 20,
                                    letterSpacing: 0.27,
                                    color: FitnessAppTheme.grey,
                                  ),
                                  maxLines: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
              top: 150,
              right: 26,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: CurvedAnimation(
                    parent: animationController!, curve: Curves.fastOutSlowIn),
                child: AnimatedBuilder(
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
                             
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                splashColor: FitnessAppTheme.nearlyDarkBlue
                                    .withOpacity(0.2),
                                onTap: () {
                            
                                },
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, left: 16, right: 16),
                                      child: Image.asset(
                                          'assets/nft/' + context.watch<NFTProvider>().NFTSingle.nft_uri_path),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 16),
              child: SizedBox(
                width: AppBar().preferredSize.width,
                height: AppBar().preferredSize.height,
                child: Material(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(
                              AppBar().preferredSize.height),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: FitnessAppTheme.nearlyBlack,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'NFT Details',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ))
                      ],
                    )),
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
                      color: FitnessAppTheme.grey.withOpacity(0.6),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
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
                  color: FitnessAppTheme.nearlyBlue,
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
