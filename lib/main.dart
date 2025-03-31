import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:testeuno/core/routes.dart';
import 'package:testeuno/core/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:testeuno/controllers/main_controllers.dart';
import 'package:testeuno/modules/auth/controllers/Auth_controller.dart';
import 'package:testeuno/modules/auth/controllers/login_controller.dart';
import 'package:testeuno/modules/dashboard/controllers/dashboard_controllers.dart';
import 'package:testeuno/modules/home/controllers/home_controllers.dart';
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
      builder: (context) => MainApp(),
    ), 
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechChef',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes, // Aplica as rotas
    );
  }
}


