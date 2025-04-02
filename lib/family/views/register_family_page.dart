import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart'; // Para formatação da data

import '../../../core/routes.dart';
import '../controllers/register_family_controller.dart';

class RegisterFamily extends StatefulWidget {
  const RegisterFamily({super.key});

  @override
  State<RegisterFamily> createState() => _RegisterFamilyState();
}

class _RegisterFamilyState extends State<RegisterFamily> {
  final ctrl = GetIt.I.get<RegisterFamilyController>();

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
        title: Text('Novo Membro da Família',
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campos de texto para cadastro
              _buildTextField(ctrl.txtNome, 'Nome', Icons.person),
              _buildTextField(ctrl.txtEmail, 'E-mail', Icons.email),
              _buildTextField(ctrl.txtSenha, 'Senha', Icons.lock, obscureText: true),
              _buildTextField(ctrl.txtConfirmarSenha, 'Confirmar Senha', Icons.lock, obscureText: true),
              _buildDatePicker(context),
              _buildTextField(ctrl.txtTelefone, 'Telefone', Icons.phone),
              _buildTextField(ctrl.txtEndereco, 'Endereço', Icons.home),
              _buildTextField(ctrl.txtAltura, 'Altura (cm)', Icons.height),
              _buildTextField(ctrl.txtPeso, 'Peso (kg)', Icons.fitness_center),
              SizedBox(height: 15),
              
              // Campo para aceitar os termos de serviço
              SwitchListTile(
                title: Text('Aceito os termos de serviço',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: ctrl.aceitouTermos,
                onChanged: (value) => setState(() => ctrl.atualizarAceitouTermos(value)),
              ),
              
              // Botão de cadastro
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ctrl.aceitouTermos ? _cadastrar : null,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir os campos de texto com icones
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  // Método para construir o campo de data de nascimento
  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            ctrl.txtDataNascimento.text = DateFormat('dd/MM/yyyy').format(pickedDate);
          });
        }
      },
      child: AbsorbPointer(
        child: _buildTextField(ctrl.txtDataNascimento, 'Data de Nascimento', Icons.cake),
      ),
    );
  }

  void _cadastrar() {
    // Implementar lógica de cadastro
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }
}
