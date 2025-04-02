import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routes.dart';

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
        title: Text('Somos Nós',
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            // Primeira linha: Alisson
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Coluna para a foto de Alisson (foto quadrada)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    // Medidas das fotos em formato quadrado
                    width: 150, 
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/alisson.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                
                // Gap entre a foto e o texto
                SizedBox(width: 20),
                
                // Coluna para o texto de Alisson
                Expanded( // Faz o texto ocupar o espaço restante
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Título com o estilo do tema
                      Text(
                        'Alisson Regis',
                        style: Theme.of(context).textTheme.titleLarge, 
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Chef de cozinha e um desenvolvedor apaixonado por tecnologia e soluções criativas.',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10),
                      // Ícones das redes sociais
                      Row(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            onPressed: () {
                              // Lógica para abrir GitHub
                            },
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            onPressed: () {
                              // Lógica para abrir LinkedIn
                            },
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram),
                            onPressed: () {
                              // Lógica para abrir Instagram
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Segunda linha: Daniel
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Coluna para o texto de Daniel
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Título com o estilo do tema
                      Text(
                        'Daniel Ferreira',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 10),
                      // Descrição justificada
                      Text(
                        'Assistente de Infraestrutura de Aplicação. Foco em back-end e integração de sistemas.',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10),
                      // Ícones das redes sociais
                      Row(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            onPressed: () {
                              // Lógica para abrir GitHub
                            },
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            onPressed: () {
                              // Lógica para abrir LinkedIn
                            },
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram),
                            onPressed: () {
                              // Lógica para abrir Instagram
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Gap entre a foto e o texto
                SizedBox(width: 20),
                
                // Coluna para a foto de Daniel
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    // Medidas das fotos em formato quadrado
                    width: 150, 
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/daniel.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Gap entre autores e versao
            SizedBox(height: 20),

            // Informações do aplicativo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //versao conforme subir no github para acompanhar evolucao
                    Text('Versão 1.0.4'),
                    SizedBox(height: 5),
                    Text('© 2025 - Todos os direitos reservados'),
                  ],
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
            icon: Icon(Icons.home_rounded), label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline), label: 'Informações',
          ),
        ],
        
          onTap: (int index) {
          // Verifica qual item foi selecionado e navega para a respectiva rota
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home); // Rota 'sobre'
          } else if (index == 1) {
            Navigator.pushNamed(context, ''); // Rota 'mais informações'
          }
        },
      ),
    );
  }
}