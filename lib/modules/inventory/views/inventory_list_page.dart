import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/inventory_list_controllers.dart';

class InventoryListPage extends StatefulWidget {
  const InventoryListPage({super.key});

  @override
  State<InventoryListPage> createState() => _InventoryListPageState();
}

class _InventoryListPageState extends State<InventoryListPage> {
  final ctrl = GetIt.I.get<InventoryListControllers>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            onPressed: () => ctrl.alterarVisualizacao(true),
            icon: Icon(Icons.view_list, color: Colors.white),
          ),
          IconButton(
            onPressed: () => ctrl.alterarVisualizacao(false),
            icon: Icon(Icons.grid_view, color: Colors.white),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ctrl.visualizarList ? _visualizarLista() : _visualizarGrid(),
      ),
    );
  }

  Widget _visualizarLista() {
    return ListView.builder(
      itemCount: ctrl.itens.length,
      itemBuilder: (context, index) {
        final item = ctrl.itens[index];
        return Card(
          child: ListTile(
            title: Text(item.nome),
            subtitle: Text(item.categoria),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit_note_outlined),
                  onPressed: () => ctrl.editarItem(index, context),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () => ctrl.removerItem(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _visualizarGrid() {
    return GridView.builder(
      itemCount: ctrl.itens.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final item = ctrl.itens[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.nome, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(item.categoria),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit_note_outlined),
                    onPressed: () => ctrl.editarItem(index, context),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () => ctrl.removerItem(index),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
