import 'package:flutter/material.dart';

import '../../../widgets/dashboard_card.dart';
import '../../../core/routes.dart';

class SnacksPage extends StatelessWidget {
  const SnacksPage({super.key});

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
        title: Text('Lanches',
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
                DashboardCard(title: 'Visualizar Cardápios', icon: Icons.menu_book_outlined, route: ''),
                DashboardCard(title: 'Editar Cardápios', icon: Icons.soup_kitchen_rounded, route: ''),
                DashboardCard(title: 'Adicionar Fichas/Receitas', icon: Icons.fact_check_rounded, route: ''),
                DashboardCard(title: 'Configurar Refeição', icon: Icons.food_bank_rounded, route: ''),
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