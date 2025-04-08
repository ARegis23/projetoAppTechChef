import 'package:flutter/material.dart';

import '../../../widgets/dashboard_card.dart';
import '../../../core/routes.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        // Ícone de voltar
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
          onPressed: () {
          Navigator.pop(context);
          },
        ),

        // Título da página
        title: Text('Cardápios',
        ),
      ),
      
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                DashboardCard(title: 'Café da Manhã', icon: Icons.free_breakfast, route: AppRoutes.breakfastPage),
                DashboardCard(title: 'Lanches', icon: Icons.fastfood, route: AppRoutes.snacksPage),
                DashboardCard(title: 'Almoço', icon: Icons.lunch_dining, route: AppRoutes.lunchPage),
                DashboardCard(title: 'Jantar', icon: Icons.dinner_dining, route: AppRoutes.dinnerPage),
              ],
            ),
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Define que o item "Painel Inicial" está selecionado
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