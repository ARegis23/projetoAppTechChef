import 'package:flutter/material.dart';

import '../../../core/routes.dart';

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