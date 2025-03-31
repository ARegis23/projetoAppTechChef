import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testeuno/core/routes.dart';
import 'package:testeuno/modules/auth/controllers/login_controller.dart';

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
    ctrl.addListener(_atualizarEstado);
  }

  @override
  void dispose() {
    ctrl.removeListener(_atualizarEstado);
    super.dispose();
  }

  void _atualizarEstado() {
    setState(() {});
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
        
          // Ícone de voltar
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
            onPressed: () {
            Navigator.pop(context);
            },
          ),

          // Título da página
          title: Text('Login',
          ),
        ),
      
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
                Navigator.pushNamed(context, AppRoutes.dashboard);
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      )
    );
  }
}