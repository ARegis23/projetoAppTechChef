import 'package:flutter/material.dart';
import 'package:testeuno/core/routes.dart';

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
        title: Text('DASHBOARD',
        ),
      ),
      
      body: 
        Center (child:
          Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Icon(
                Icons.menu_book, // Ícone do menu
                  size: 60,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                  style: 
                  ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: 
                    Text('Resumo Geral',
                      ),
                  ),
                ],
              ),
              
              SizedBox(height: 10), // Espaço entre o ícones
                              
                Icon(
                Icons.menu_book, // Ícone do menu
                  size: 60,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.menupage);
                },
                  style: 
                  ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: 
                    Text('Menus'
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10), // Espaço entre o ícones

                Icon(
                Icons.menu_book, // Ícone do menu
                  size: 60,
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'resumo');
                },
                  style: 
                  ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: 
                    Text('Estoque',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10), // Espaço entre o ícones 
                                
                Icon(
                  Icons.menu_book, // Ícone do menu
                    size: 60,
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'resumo');
                },
                  style: 
                  ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: 
                    Text('Controle Nutricional',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10), // Espaço entre o ícones
                                
                Icon(
                  Icons.menu_book, // Ícone do menu
                    size: 60,
                ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'resumo');
                },
                  style: 
                  ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: 
                    Text('Compras',
                    ),
                  ),
                ],
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