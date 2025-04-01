import 'package:flutter/material.dart';

import '../modules/auth/views/forgot_password_page.dart';
import '../modules/auth/views/login_page.dart';
import '../modules/auth/views/register_page.dart';
import '../modules/dashboard/views/dashboard_page.dart';
import '../modules/dashboard/views/settings_page.dart';
import '../modules/home/views/about_page.dart';
import '../modules/home/views/home_page.dart';
import '../modules/menus/views/menus_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String configuracoes = '/configuracoes';
  static const String sobre = '/sobre';
  static const String menupage = '/menupage';
  static const String register = '/register';
  static const String forgotpassword = '/forgotpassword';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    dashboard: (context) => DashboardPage(),
    configuracoes: (context) => const SettingsPage(),
    sobre: (context) => const AboutPage(),
    menupage: (context) => const MenusPage(),
    register: (context) => const RegisterPage(), 
    forgotpassword: (context) => const ForgotPasswordPage(), // no momento esta sendo usado uma caixa de dialogo
  };
}