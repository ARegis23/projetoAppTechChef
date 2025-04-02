import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/routes.dart';
import '../../../core/theme.dart';
import '../controllers/main_controllers.dart';
import '../modules/auth/controllers/Auth_controller.dart';
import '../modules/auth/controllers/login_controller.dart';
import '../modules/dashboard/controllers/dashboard_controllers.dart';
import '../modules/home/controllers/home_controllers.dart';
import '../modules/inventory/controllers/inventory_controllers.dart';
import '../modules/menus/controllers/menus_controllers.dart';
import '../modules/nutrition/controllers/nutrition_controllers.dart';
import '../modules/shopping/controllers/shopping_controllers.dart';
import '../modules/auth/controllers/register_controller.dart';
import '../family/controllers/register_family_controller.dart';

final g = GetIt.instance;

void main() {
  //Registrar o controlador
  g.registerSingleton<MainControllers>(MainControllers());
  g.registerSingleton<AuthController>(AuthController());
  g.registerSingleton<LoginController>(LoginController());
  g.registerSingleton<RegisterController>(RegisterController());
  g.registerSingleton<DashboardControllers>(DashboardControllers());
  g.registerSingleton<HomeControllers>(HomeControllers());
  g.registerSingleton<InventoryControllers>(InventoryControllers());
  g.registerSingleton<MenusControllers>(MenusControllers());
  g.registerSingleton<NutritionControllers>(NutritionControllers());
  g.registerSingleton<ShoppingControllers>(ShoppingControllers());
  g.registerSingleton<RegisterFamilyController>(RegisterFamilyController());

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


