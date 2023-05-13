import 'package:best_flutter_ui_templates/fitness_app/nft_token/nft_category_list_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/nft_token/nft_recommand_list.dart';
import 'package:best_flutter_ui_templates/fitness_app/providers/nft_provider.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../fitness_app_theme.dart';
import 'nft_detail_info_view.dart';

class NftTokenMain extends StatefulWidget {
  const NftTokenMain({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _NftTokenMainState createState() => _NftTokenMainState();
}

class _NftTokenMainState extends State<NftTokenMain> {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  String nft_type = 'PROOF_BASED';

  @override
  void initState() {
    super.initState();
    context.read<NFTProvider>().getNFTListByType(nft_type);
    context.read<NFTProvider>().getNFTRecommandList();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 242, 250),
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
                      Flexible(
                        child: gerRecommandNFTView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100)
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
            'TYPES',
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
              getButtonUI('PROOF_BASED', nft_type == 'PROOF_BASED'),
              const SizedBox(
                width: 16,
              ),
              getButtonUI('EQUITY_BASED', nft_type == 'EQUITY_BASED'),
              const SizedBox(
                width: 16,
              ),
              getButtonUI('YIELD_BASED', nft_type == 'YIELD_BASED'),
              const SizedBox(
                width: 16,
              ),
              getButtonUI('FRAGMENT_BASED', nft_type == 'FRAGMENT_BASED'),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        NFTCategoryListView(
          NFTList: context.watch<NFTProvider>().NFTList,
        ),
      ],
    );
  }

  Widget gerRecommandNFTView() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Rare NFT Marketplace',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: FitnessAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: NFTRecommandList(
              NFTList: context.watch<NFTProvider>().NFTDetailList,
            ),
          )
        ],
      ),
    );
  }

  Widget getButtonUI(String type, bool isSelected) {
    String txt = '';
    if (type == 'PROOF_BASED') {
      txt = 'PROOF';
    } else if (type == 'EQUITY_BASED') {
      txt = 'EQUITY';
    } else if (type == 'YIELD_BASED') {
      txt = 'YIELD';
    } else if (type == 'FRAGMENT_BASED') {
      txt = 'FRAG..';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
           
            color: isSelected
                ? FitnessAppTheme.nearlyBlack
                : FitnessAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: FitnessAppTheme.nearlyBlack)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                nft_type = type;
                context.read<NFTProvider>().getNFTListByType(nft_type);
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
                        : FitnessAppTheme.nearlyBlack,
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
      padding: const EdgeInsets.only(top: 8.0, left: 18),
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
                            color: Colors.yellow,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search For NFTs',
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
                  'HikenDog',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: FitnessAppTheme.grey,
                  ),
                ),
                Text(
                  'NFT Ecosystem',
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
        ],
      ),
    );
  }
}
