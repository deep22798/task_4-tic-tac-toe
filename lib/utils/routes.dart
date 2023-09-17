import 'package:get/get.dart';
import 'package:task_4/views/game.dart';
import 'package:task_4/views/home.dart';
import 'package:task_4/views/splash.dart';

class Routes{
  static String splash='/';
  static String home='/home';
  static String game='/game';
}

final Pages=[
  GetPage(name: Routes.splash, page: ()=>Splash()),
  GetPage(name: Routes.home, page: ()=>Home()),
  GetPage(name: Routes.game, page: ()=>Game()),
];