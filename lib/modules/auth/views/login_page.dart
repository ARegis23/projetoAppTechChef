import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/routes.dart';
import '../controllers/login_controller.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrl = GetIt.I.get<LoginController>();
  bool primeiroAcesso = true; // Simula se é o primeiro acesso

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

// Função para mostrar o diálogo de recuperação de senha
  void _mostrarDialogoEsqueciSenha(BuildContext context) {
    TextEditingController emailController = TextEditingController(); // Controlador do campo de e-mail

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Recuperar Senha',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Digite seu e-mail para receber um link de redefinição.",
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
              },
              child: Text(
                'Cancelar',
                ),
            ),
            ElevatedButton(

              onPressed: () {
                // Aqui você pode chamar um método para enviar o e-mail de recuperação
                print("E-mail enviado para: ${emailController.text}");
                Navigator.pop(context); // Fecha o diálogo após a ação
              },
              child: Text('Enviar'),
            ),
          ],
        );
      },
    );
  }


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
        title: Text('Entrar',
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: ctrl.txtEmail,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: ctrl.txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            
            // Botão para recuperação de senha
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Chama o método para mostrar o diálogo de recuperação de senha
                  _mostrarDialogoEsqueciSenha(context);
                },
                child: Text('Esqueci minha senha'),
              ),
            ),
            SizedBox(height: 15),
         
            
            // Botão de login
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode validar e fazer o login
                Navigator.pushNamed(context, AppRoutes.dashboard);
              },
              child: Text('Entrar'),
            ),
            
            // Botões de login social
            /*
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Simula login com Google
              },
              icon: Icon(Icons.g_mobiledata),
              label: Text('Entrar com Google'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Simula login com Facebook
              },
              icon: Icon(Icons.facebook),
              label: Text('Entrar com Facebook'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Simula login com Instagram
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Entrar com Instagram'),
            ),
            */
            
            // Termos de servico para primeiro acesso
            SizedBox(height: 15),
            if (primeiroAcesso)
              SwitchListTile(
                title: Text('Aceitar os termos do serviço'),
                value: ctrl.aceito,
                onChanged: (value) {
                  ctrl.atualizarAceito(value);
                },
              ),
            
            // Botão para redirecionar para a tela de cadastro
            SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: Text('Ainda não tem uma conta? Cadastre-se'),
            ),
          ],
        ),
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
            Navigator.pushNamed(context, ''); // Rota 'mais informações'
          }
        },
      ),
    );
  }
}
