import 'package:flutter/material.dart';

import '../../../core/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      
        //pagina inicial nao tem botao de voltar
        /*// Ícone de voltar
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
          onPressed: () {
          Navigator.pop(context);
          },
        ),*/

        // Título da página
        title: Text('HOME',
        ),
      ),
      
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover, // Ajuste da imagem (cobre toda a tela)
              ),
            ),
          ),

          // Conteúdo sobre a imagem de fundo
          Center (child:
            Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                //botão de entrar
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login); // Navega para a rota 'login'
                  },
                  
                  child: 
                    Text('Entrar'),             
                ),
              ],
            ),
          ), 
        ],
      ),
      
      //rodapé      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array), label: 'Sobre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline), label: 'Informações',
          ),
        ],
        
          onTap: (int index) {
          // Verifica qual item foi selecionado e navega para a respectiva rota
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.sobre); // Rota 'sobre'
          } else if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.infos); // Rota 'mais informações'
          }
        },
      ),
    );
  }
}