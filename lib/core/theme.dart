import 'package:flutter/material.dart';

// Função para converter um código HEX em uma cor do Flutter
Color hexToColor(String hexCode) {
  return Color(int.parse(hexCode.substring(1, 7), radix: 16) + 0xFF000000);
}

// 🎨 Definições de Cores Globais
class AppColors {
  static final Color primary = hexToColor("#FF0000"); 
  static final Color secondary = hexToColor("#0A0A0A") ;
  static final Color background = hexToColor("#EEF8FF"); 

  static final Color title = hexToColor("##61B73F"); // Títulos e textos claros
  static final Color text = hexToColor("#0A0A0A"); // Texto padrão
  static final Color accent = hexToColor("#FFD17D"); // Amarelo para destaques
}

// 🔤 Definições de Estilos de Texto Globais
class AppTextStyles {
  static final TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: hexToColor("#61B73F"),
  );

  static final TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static final TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
  );

  static final TextStyle button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: hexToColor("#61B73F"),
  );
}

// 🌈 Definições do Tema Global
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      // Estilização da AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.title,
        iconTheme: IconThemeData(color: hexToColor("#61B73F")),
      ),

      // Estilização dos Botões
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Estilização dos TextFields (Campos de Entrada)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary, width: 2),
        ),
      ),

      // Estilização do BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: hexToColor("#61B73F"),
      ),
    );
  }
}

/*
// Definição da classe AppTheme para armazenar as configurações de tema
class AppTheme {
  // Criando um tema claro (lightTheme)
  static ThemeData lightTheme = ThemeData(
    // Cor principal do aplicativo
    primaryColor: hexToColor("#414288"),

    // Cor de fundo geral do aplicativo
    scaffoldBackgroundColor: hexToColor("#BABBDE"),

    // Configurações da AppBar (barra superior do app)
    appBarTheme: AppBarTheme(
      backgroundColor: hexToColor("#414288"), // Cor de fundo da AppBar
      titleTextStyle: TextStyle(
        color: hexToColor("#eef8ff"), // Cor do texto da AppBar
        fontSize: 24, // Tamanho da fonte
        fontWeight: FontWeight.bold, // Deixando o texto em negrito
      ),
      iconTheme: IconThemeData(
        color: hexToColor("#eef8ff"), // Cor dos ícones da AppBar (incluindo o botão de "back")
      ),
    ),

    // Definições globais de texto para o aplicativo
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: hexToColor("#EEF8FF"), // Cor do texto principal
        fontSize: 18, // Tamanho do texto
      ),
      titleLarge: TextStyle(
        color: hexToColor("#EEF8FF"), // Cor do título principal
        fontSize: 30, // Tamanho do título
        fontWeight: FontWeight.bold, // Deixando o título em negrito
      ),
    ),

    // Definições de tema para botões normais (botões simples)
    buttonTheme: ButtonThemeData(
      buttonColor: hexToColor("#414288"), // Cor de fundo dos botões
      textTheme: ButtonTextTheme.primary, // Define a cor do texto dos botões
    ),

    // Definições para botões elevados (ElevatedButton)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: hexToColor("#414288"), // Cor de fundo do botão
        foregroundColor: hexToColor("#EEF8FF"), // Cor do texto dentro do botão
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Espaçamento interno do botão
        textStyle: TextStyle(
          fontSize: 18, // Tamanho da fonte do botão
          fontWeight: FontWeight.bold, // Deixa o texto em negrito
        ),
      ),
    ),
  );
}
*/
