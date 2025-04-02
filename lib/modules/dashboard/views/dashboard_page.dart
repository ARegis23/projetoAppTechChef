import 'package:flutter/material.dart';
import 'package:testeuno/core/theme.dart';

import '../../../core/routes.dart';
//import '../../../core/theme.dart';

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
        title: Text('DashBoard',
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
              physics: NeverScrollableScrollPhysics(), // Impede a rolagem do GridView
              children: [
                _buildDashboardCard(
                  context,
                  title: 'Resumo Geral',
                  icon: Icons.menu_book,
                  route: '',
                ),
                _buildDashboardCard(
                  context,
                  title: 'Menus',
                  icon: Icons.restaurant_menu,
                  route: AppRoutes.menupage,
                ),
                _buildDashboardCard(
                  context,
                  title: 'Estoque',
                  icon: Icons.inventory,
                  route: 'resumo',
                ),
                _buildDashboardCard(
                  context,
                  title: 'Controle Nutricional',
                  icon: Icons.health_and_safety,
                  route: 'resumo',
                ),
                _buildDashboardCard(
                  context,
                  title: 'Compras',
                  icon: Icons.shopping_cart,
                  route: 'resumo',
                ),
                _buildDashboardCard(
                  context,
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

  Widget _buildDashboardCard(BuildContext context, {required String title, required IconData icon, required String route}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: StatefulBuilder(
          builder: (context, setState) {
            return MouseRegion(
              onEnter: (_) => setState(() {}),
              onExit: (_) => setState(() {}),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Theme.of(context).iconTheme.color, size: 40),
                      SizedBox(height: 10),
                      Text(title, 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




/*
produteview.dart


//
// produto_view.dart
//
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/produto_controller.dart';

class ProdutoView extends StatefulWidget {
  const ProdutoView({super.key});

  @override
  State<ProdutoView> createState() => _ProdutoViewState();
}

class _ProdutoViewState extends State<ProdutoView> {
  final ctrl = GetIt.I.get<ProdutoController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BARRA DE TÍTULO
      //
      appBar: AppBar(
        title: Text('Produtos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            onPressed: () {ctrl.alterarVisualizacao(true);},
            icon: Icon(Icons.view_list_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () {ctrl.alterarVisualizacao(false);},
            icon: Icon(Icons.grid_view_outlined, color: Colors.white),
          ),
        ],
      ),
      //
      // CORPO
      //
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ctrl.visualizarList ? visualizarLista() : visualizarGrid(),
      ),
    );
  }

  Widget visualizarLista() {
    return SizedBox(
      child: ListView.builder(
        itemCount: ctrl.produtos.length,
        itemBuilder: (context, index) {
          final item = ctrl.produtos[index];
          return SizedBox(
            width: 150,
            child: Card(
              child: ListTile(
                title: Text(item.nome),
                subtitle: Text('{R\$ ${item.preco.toStringAsFixed(2)}}'),
                trailing: IconButton(
                  onPressed: () {
                    ctrl.removerItem(index);
                  },
                  icon: Icon(Icons.delete_outline),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget visualizarGrid() {
    return GridView.builder(
      itemCount: ctrl.produtos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final item = ctrl.produtos[index];
        return SizedBox(
          width: 150,
          child: Card(
            child: ListTile(
              title: Text(item.nome),
              subtitle: Text('{R\$ ${item.preco.toStringAsFixed(2)}}'),
            ),
          ),
        );
      },
    );
  }
}




-----------------------------------------------------------------------------
produto model


class Produto {
  final String nome;
  final double preco;

  Produto({required this.nome, required this.preco});

}

--------------------------------------------------------------------------


controler.dart


import 'package:flutter/material.dart';

import '../model/produto_model.dart';

class ProdutoController extends ChangeNotifier{

  final List<Produto> _produtos = [
    Produto(nome: 'Notebook', preco: 4800.00),
    Produto(nome: 'Mouse', preco: 90.00),
    Produto(nome: 'Teclado', preco: 220.00),
    Produto(nome: 'Monitor', preco: 800.00),
    Produto(nome: 'Smartphone', preco: 3200.00),
    Produto(nome: 'Cooler', preco: 200.00),
  ];

  bool _visualizarLista = true;

  List<Produto> get produtos => _produtos;
  bool get visualizarList => _visualizarLista;

  void alterarVisualizacao(valor){
    _visualizarLista = valor;
    notifyListeners();
  }

  void removerItem(index){
    _produtos.removeAt(index);
    notifyListeners();
  }
}



--------------------------------------------------

main.dart


import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controller/produto_controller.dart';
import 'view/produto_view.dart';

final g = GetIt.instance;

void main() {
  g.registerSingleton<ProdutoController>(ProdutoController());
  runApp(DevicePreview(builder: (context) => const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      initialRoute: 'listar',
      routes: {
        'listar': (context) => const ProdutoView(),
      },
    );
  }
}
*/