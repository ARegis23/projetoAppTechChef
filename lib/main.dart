import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testeuno/controllers/main_controllers.dart';
import 'package:testeuno/modules/auth/controllers/Auth_controller.dart';
import 'package:testeuno/modules/auth/controllers/login_controller.dart';
import 'package:testeuno/modules/auth/views/login_page.dart';
import 'package:testeuno/modules/dashboard/controllers/dashboard_controllers.dart';
import 'package:testeuno/modules/dashboard/views/dashboard_page.dart';
import 'package:testeuno/modules/dashboard/views/settings_page.dart';
import 'package:testeuno/modules/home/controllers/home_controllers.dart';
import 'package:testeuno/modules/home/views/about_page.dart';
import 'package:testeuno/modules/home/views/home_page.dart';
import 'package:testeuno/modules/inventory/controllers/inventory_controllers.dart';
import 'package:testeuno/modules/menus/controllers/menus_controllers.dart';
import 'package:testeuno/modules/nutrition/controllers/nutrition_controllers.dart';
import 'package:testeuno/modules/shopping/controllers/shopping_controllers.dart';


final g = GetIt.instance;

void main() {

  //Registrar o controlador
  g.registerSingleton<MainControllers>(MainControllers());
  g.registerSingleton<AuthController>(AuthController());
  g.registerSingleton<LoginController>(LoginController());
  g.registerSingleton<DashboardControllers>(DashboardControllers());
  g.registerSingleton<HomeControllers>(HomeControllers());
  g.registerSingleton<InventoryControllers>(InventoryControllers());
  g.registerSingleton<MenusControllers>(MenusControllers());
  g.registerSingleton<NutritionControllers>(NutritionControllers());
  g.registerSingleton<ShoppingControllers>(ShoppingControllers());
  
  //Executar o aplicativo
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegeção',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'dashboard': (context) => const DashboardPage(),
        'configuracoes': (context) => const SettingsPage(),
        'sobre': (context) => const AboutPage(),
        'login': (context) => const LoginPage(),
      }
    );
  }
}
