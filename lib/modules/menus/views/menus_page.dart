import 'package:flutter/material.dart';
import 'package:testeuno/core/routes.dart';

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
        title: Text('MENUS',
        ),
      ),

      body: 
        Center (child:
          Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: 
                Text('Café da Manhã',
                  ),
              ),
            
              SizedBox(height: 10),

              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: 
                Text('Lanches',
                  ),
              ),              

              SizedBox(height: 10),

              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: 
                Text('Almoço',
                  ),
              ),              

              SizedBox(height: 10),

              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: 
                Text('Jantar',
                  ),
              ),
            ],
          ),
        ),

      //rodapé      
      bottomNavigationBar: BottomNavigationBar(
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

        // Configurações do BottomNavigationBar
        onTap: (int index) {
          // Verifica qual item foi selecionado e navega para a respectiva rota
          if (index == 0) {
            Navigator.pushReplacementNamed(context, AppRoutes.home); // Rota 'home'
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard); // Rota 'dashboard'
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.configuracoes); // Rota 'configuracoes'
          }
        }
      ),
    );
  }
}