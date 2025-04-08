import 'package:flutter/material.dart';

import '../../../core/routes.dart';
import '../../../core/theme.dart';

class InfosPage extends StatelessWidget {
  const InfosPage({super.key});

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
        title: Text('Sobre o Aplicativo'),
        ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '📌 Objetivo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              
              SizedBox(height: 10),
              Text(
                'Este aplicativo foi desenvolvido para ajudar você a planejar refeições, gerenciar seu estoque de alimentos, acompanhar valores nutricionais e organizar suas compras de maneira prática e eficiente.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              
              SizedBox(height: 20),
              Text(
                '🚀 Principais Recursos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              
              SizedBox(height: 10),
              _buildFeatureItem(context, '📖 Planejamento de Refeições',
                  'Organize seu cardápio diário, acesse fichas técnicas e utilize um banco de receitas.'),
              _buildFeatureItem(context, '📦 Gestão de Estoque',
                  'Registre os alimentos disponíveis e evite desperdícios.'),
              _buildFeatureItem(context, '🥗 Controle Nutricional',
                  'Acompanhe nutrientes e organize os alimentos por grupos nutricionais.'),
              _buildFeatureItem(context, '🛒 Organização de Compras',
                  'Crie listas de compras baseadas no estoque e no cardápio planejado.'),
              _buildFeatureItem(context, '👨‍👩‍👧 Modo Familiar',
                  'Cadastre os membros da família para ajustar quantidades e porções.'),
              
              SizedBox(height: 20),
              Text(
                '🎓 Desenvolvido por:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text('📌 Alisson Regis (Tecnólogo Alimentar)',
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('📌 Daniel Ferreira (Assistente de Infraestruturas)',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),

      //rodape
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array),
            label: 'Sobre',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.sobre);
          }
        },
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: 18,
            ),
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
