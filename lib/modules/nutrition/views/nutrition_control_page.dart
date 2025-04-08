import 'package:flutter/material.dart';
import 'package:testeuno/core/theme.dart';

import '../../../widgets/dashboard_card.dart';
import '../../../core/routes.dart';

class NutritionControlPage extends StatelessWidget {
  const NutritionControlPage({super.key});

  // Função para obter o índice atual do BottomNavigationBar
  int _getCurrentIndex(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    if (currentRoute == AppRoutes.home) return 0;
    if (currentRoute == AppRoutes.dashboard) return 1;
    if (currentRoute == AppRoutes.configuracoes) return 2;

    return -1; // Nenhum item será destacado
  }

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
        title: Text('Controle Nutriconal',
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
                DashboardCard(title: 'Carboidratos', icon: Icons.apple_rounded, route: ''),
                DashboardCard(title: 'Proteínas', icon: Icons.apple_rounded, route: ''),
                DashboardCard(title: 'Lípidios', icon: Icons.apple_rounded, route: ''),
                DashboardCard(title: 'Fibras', icon: Icons.apple_rounded, route: ''),
                DashboardCard(title: 'Vitaminas e Minerais', icon: Icons.apple_rounded, route: ''),                                                
                DashboardCard(title: 'Resumo', icon: Icons.apple_rounded, route: ''),
              ],
            ),
          ),
        ),
      ),
      
      // Rodape
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context) == -1 ? 0 : _getCurrentIndex(context),
        selectedItemColor: _getCurrentIndex(context) == -1 ? AppColors.title : null, // Remove destaque
        unselectedItemColor: AppColors.title,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Painel Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: 'Configurações',
          ),
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