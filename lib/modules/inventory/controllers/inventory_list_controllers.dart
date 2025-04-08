import 'package:flutter/material.dart';

//logica de edicao mascara enquanto nao temos o codigo
class InventoryItem {
  final String nome;
  final String categoria;

  InventoryItem({required this.nome, required this.categoria});
}

class InventoryListControllers extends ChangeNotifier {
  final List<InventoryItem> _itens = [
    InventoryItem(nome: 'Arroz', categoria: 'Grãos'),
    InventoryItem(nome: 'Feijão', categoria: 'Grãos'),
    InventoryItem(nome: 'Frango', categoria: 'Proteína'),
    InventoryItem(nome: 'Alface', categoria: 'Verdura'),
    InventoryItem(nome: 'Banana', categoria: 'Fruta'),
    InventoryItem(nome: 'Leite sem lactose', categoria: 'Laticínio'),
  ];

  bool _visualizarLista = true;

  List<InventoryItem> get itens => _itens;
  bool get visualizarList => _visualizarLista;

  void alterarVisualizacao(bool valor) {
    _visualizarLista = valor;
    notifyListeners();
  }

  void removerItem(int index) {
    _itens.removeAt(index);
    notifyListeners();
  }
 
  void editarItem(int index, BuildContext context) {
  final item = _itens[index];

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Editar Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${item.nome}'),
            SizedBox(height: 8),
            Text('Categoria: ${item.categoria}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }


}
