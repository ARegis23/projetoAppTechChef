import 'package:flutter/material.dart';
import 'package:testeuno/modules/auth/views/login_page.dart';
import 'package:testeuno/modules/dashboard/views/dashboard_page.dart';
import 'package:testeuno/modules/dashboard/views/settings_page.dart';
import 'package:testeuno/modules/home/views/about_page.dart';
import 'package:testeuno/modules/home/views/home_page.dart';
import 'package:testeuno/modules/menus/views/menus_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String configuracoes = '/configuracoes';
  static const String sobre = '/sobre';
  static const String menupage = '/menupage';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    dashboard: (context) => DashboardPage(),
    configuracoes: (context) => const SettingsPage(),
    sobre: (context) => const AboutPage(),
    menupage: (context) => const MenusPage(),

  };
}