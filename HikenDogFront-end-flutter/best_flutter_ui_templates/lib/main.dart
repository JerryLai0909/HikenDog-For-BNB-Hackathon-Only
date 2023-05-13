import 'dart:io';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/providers/game_provider.dart';
import 'package:best_flutter_ui_templates/fitness_app/providers/nft_provider.dart';
import 'package:best_flutter_ui_templates/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'fitness_app/http/service_manager.dart';
import 'fitness_app/providers/mission_provider.dart';
import 'fitness_app/providers/user_provider.dart';
import 'fitness_app/service/custom_service.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  ServiceManager().registeredService(CustomService());
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider<GameProvider>(
            create: (context) => GameProvider(),
          ),
          ChangeNotifierProvider<MissionProvider>(
            create: (context) => MissionProvider(),
          ),
           ChangeNotifierProvider<NFTProvider>(
            create: (context) => NFTProvider(),
          ),
        ],
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'HikenDog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      // home: NavigationHomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroductionAnimationScreen(),
        // '/': (context) => const FitnessAppHomeScreen(),

      },
      // home :MyDiaryScreen()
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
