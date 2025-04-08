import 'package:flutter/material.dart';

import '../../../core/routes.dart';
import '../../../widgets/dashboard_card.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Estoque'),
      ),
      
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                DashboardCard(title: 'Visualizar Dispensa', icon: Icons.preview_rounded, 
                route: AppRoutes.inventoryList),
                DashboardCard(title: 'Cadastrar Produto', icon: Icons.add_circle, route: ''),
              ],
            ),
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Painel Inicial'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_sharp), label: 'Configurações'),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.configuracoes);
          }
        },
      ),
    );
  }
}