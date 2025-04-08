import 'package:flutter/material.dart';
import '../../../core/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool allowNotifications = true;
  String selectedCurrency = 'BRL';

  final List<String> currencies = ['BRL', 'USD', 'EUR', 'JPY', 'ARS'];

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
        title: Text('Configurações',
        ),
      ),
      
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Modo escuro
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Modo escuro'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() => isDarkMode = value);
                  // Aqui você pode integrar com seu ThemeController, se tiver
                },
              ),
            ),

            Divider(),

            // Seleção de moeda
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Moeda'),
              trailing: DropdownButton<String>(
                value: selectedCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                    // Aqui você pode salvar essa seleção em settings
                  });
                },
                items: currencies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            Divider(),

            // Permissão de avisos
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text('Permitir avisos'),
              trailing: Switch(
                value: allowNotifications,
                onChanged: (value) {
                  setState(() => allowNotifications = value);
                  // Aqui você pode integrar com sistema de notificações
                },
              ),
            ),
          ],
        ),
      ),

      // Rodapé
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.configuracoes);
          }
        },
      ),
    );
  }
}
