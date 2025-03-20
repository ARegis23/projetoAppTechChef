import 'package:flutter/material.dart';

// Função global para converter HEX em cor
Color hexToColor(String hexCode) {
  return Color(int.parse(hexCode.substring(1, 7), radix: 16) + 0xFF000000);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ProjetoUno - TechChef',
          style: TextStyle(
            color: hexToColor("#eef8ff"),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            )
          ),
          backgroundColor: hexToColor("#414288"),
        ),
        
        backgroundColor: hexToColor("#BABBDE"),// Cor de fundo
       
        body: 
          Center (child:
            Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Icon(
                  Icons.category_rounded, // Ícone do menu
                    color: hexToColor("#EEF8FF"),
                    size: 60,
                ),
                
                SizedBox(height: 10), // Espaço entre o ícone e o texto
               
                //botão de entrar
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: hexToColor("#414288"), // Cor de fundo do botão
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: 
                  Text('Entrar',
                    style: TextStyle(
                      color: hexToColor("#EEF8FF"),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
              ],
            ),
          ),

        //rodapé      
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Sobre',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build_circle_rounded), label: 'Configurações',
            ),
          ],
          
        selectedItemColor: Colors.blue, // Cor do item selecionado
        unselectedItemColor: Colors.grey, // Cor do item não selecionado
        showUnselectedLabels: true, // Exibe o label mesmo se o item não estiver selecionado
        selectedFontSize: 14, // Tamanho da fonte do item selecionado
        unselectedFontSize: 12, // Tamanho da fonte do item não selecionado

          onTap: (int index) {
            // Verifica qual item foi selecionado e navega para a respectiva rota
            if (index == 0) {
              Navigator.pushNamed(context, 'sobre'); // Rota 'sobre'
            } else if (index == 1) {
              Navigator.pushNamed(context, ''); // Rota 'configuracoes'
            }
          },
        ),
      ),
    );
  }
}