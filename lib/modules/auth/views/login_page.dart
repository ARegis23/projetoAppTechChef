import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testeuno/modules/auth/controllers/login_controller.dart';


// Função global para converter HEX em cor
Color hexToColor(String hexCode) {
  return Color(int.parse(hexCode.substring(1, 7), radix: 16) + 0xFF000000);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrl = GetIt.I.get<LoginController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    ctrl.removeListener(() => setState(() {}));
    super.dispose();
  }

/*  void _salvarCadastro() {
    if (ctrl.txtNome.text.isEmpty || ctrl.txtEmail.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos!')),
      );
      return;
    }

    if (!ctrl.aceito) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Você precisa aceitar os termos!')),
      );
      return;
    }

    // Se tudo estiver correto, navega para a tela de exibição
    Navigator.pushNamed(context, 'exibicao');
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
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
      
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: ctrl.txtNome,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: ctrl.txtEmail,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            SwitchListTile(
              title: Text('Aceitar os termos do serviço'),
              value: ctrl.aceito,
              onChanged: (value) {
                ctrl.atualizarAceito(value);
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'dashboard');
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      )
    );
  }
}