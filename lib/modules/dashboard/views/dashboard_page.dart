import 'package:flutter/material.dart';

import '../../../core/routes.dart';
import '../../../core/theme.dart';
import '../../../widgets/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
        title: Text('Painel Inicial',
        ),
      ),
      
      
      body: Center(
        child: SizedBox(
          // Define a altura do Card
          height: MediaQuery.of(context).size.height * 0.7, 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true, // Faz com que o GridView ocupe apenas o espaço necessário
              physics: BouncingScrollPhysics(),
              children: [
                DashboardCard(
                  title: 'Resumo Geral',
                  icon: Icons.menu_book,
                  route: '',
                ),
                DashboardCard(
                  title: 'Menus',
                  icon: Icons.restaurant_menu,
                  route: AppRoutes.menupage,
                ),
                DashboardCard(
                  
                  title: 'Estoque',
                  icon: Icons.inventory,
                  route: AppRoutes.inventory,
                ),
                DashboardCard(
                  title: 'Controle Nutricional',
                  icon: Icons.health_and_safety,
                  route: AppRoutes.nutritionControlPage,
                ),
                DashboardCard(
                  title: 'Compras',
                  icon: Icons.shopping_cart,
                  route: '',
                ),
                DashboardCard(
                  title: 'Família',
                  icon: Icons.family_restroom,
                  route: AppRoutes.registerFamily,
                ),
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
            Navigator.pushReplacementNamed(context, '');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.configuracoes);
          }
        },
      ),
    );
  }
}

// Função para obter o índice atual do BottomNavigationBar
int _getCurrentIndex(BuildContext context) {
  final String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

  if (currentRoute == AppRoutes.home) return 0;
  if (currentRoute == AppRoutes.dashboard) return 1;
  if (currentRoute == AppRoutes.configuracoes) return 2;

  return -1; // Nenhum item será destacado
}



