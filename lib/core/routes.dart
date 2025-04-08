import 'package:flutter/material.dart';

import '../modules/family/views/register_family_page.dart';
import '../modules/auth/views/forgot_password_page.dart';
import '../modules/auth/views/login_page.dart';
import '../modules/auth/views/register_page.dart';
import '../modules/dashboard/views/dashboard_page.dart';
import '../modules/dashboard/views/settings_page.dart';
import '../modules/home/views/about_page.dart';
import '../modules/home/views/home_page.dart';
import '../modules/home/views/infos_page.dart';
import '../modules/inventory/views/inventory_list_page.dart';
import '../modules/inventory/views/inventory_page.dart';
import '../modules/menus/views/breakfast_page.dart';
import '../modules/menus/views/dinner_page.dart';
import '../modules/menus/views/lunch_page.dart';
import '../modules/menus/views/menus_page.dart';
import '../modules/menus/views/snacks_page.dart';
import '../modules/nutrition/views/nutrition_control_page.dart';


class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String configuracoes = '/configuracoes';
  static const String sobre = '/sobre';
  static const String menupage = '/menupage';
  static const String register = '/register';
  static const String forgotpassword = '/forgotpassword';
  static const String registerFamily = '/registerFamily';
  static const String infos = '/infos';
  static const String inventory = '/inventory';
  static const String inventoryList = '/inventoryList';
  static const String breakfastPage = '/breakfastpage';
  static const String lunchPage = '/lunchpage';
  static const String dinnerPage = '/dinnerpage';
  static const String snacksPage = '/snackspage';
  static const String nutritionControlPage = '/nutritionControlPage';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    dashboard: (context) => DashboardPage(),
    configuracoes: (context) => const SettingsPage(),
    sobre: (context) => const AboutPage(),
    menupage: (context) => const MenusPage(),
    register: (context) => const RegisterPage(),
    registerFamily: (context) => const RegisterFamily(),
    infos: (context) => const InfosPage(),
    inventory: (context) => const InventoryPage(),
    inventoryList: (context) => const InventoryListPage(),  
    breakfastPage: (context) => const BreakfastPage(),
    lunchPage: (context) => const LunchPage(),
    dinnerPage: (context) => const DinnerPage(),
    snacksPage: (context) => const SnacksPage(),
    nutritionControlPage: (context) => const NutritionControlPage(),
    forgotpassword: (context) => const ForgotPasswordPage(), // no momento esta sendo usado uma caixa de dialogo
  };
}