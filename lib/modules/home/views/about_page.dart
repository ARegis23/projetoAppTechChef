import 'package:flutter/material.dart';
import 'package:testeuno/core/routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
        title: Text('SOMOS NÓS',
        ),
      ),

      body: 
        Center (child:
          Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Text('Desenvolvido por:', // Texto
              ),
              
              SizedBox(height: 20), // Espaço entre o ícones

              Icon(
                Icons.people, // Autor
                  size: 60,
              ),
              
              SizedBox(height: 05), // Espaço entre o ícones

              Text('Alisson Regis', // Texto
                ),

              SizedBox(height: 10), // Espaço entre o ícones
                              
                Icon(
                Icons.people, // Autor
                  size: 60,
              ),

              SizedBox(height: 05), // Espaço entre o ícones

              Text('Daniel Ferreira', // Texto
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