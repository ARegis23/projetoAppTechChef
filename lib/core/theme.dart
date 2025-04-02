import 'package:flutter/material.dart';


// 🟢 Função para converter código HEX em cor Flutter
Color hexToColor(String hexCode) {
  return Color(int.parse(hexCode.replaceAll("#", ""), radix: 16) + 0xFF000000);
}

// 🎨 Definições de Cores Globais
class AppColors {
  static final Color primary = hexToColor("#FF0000"); // vermelho
  static final Color secondary = hexToColor("#0A0A0A"); // preto
  static final Color background = hexToColor("#FFEFD8"); // Cor de fundo do aplicativo 
  //PAPAYA WHIP 
  static final Color card = hexToColor("#FFD17D");// Cor de fundo dos cards

  static final Color title = hexToColor("#61B73F"); // Títulos e textos claros 
  //KELLY GREEN
  static final Color text = hexToColor("#0A0A0A"); // Texto padrão
  static final Color accent = hexToColor("#FFD17D"); // Amarelo para destaques
  //JASMINE
   
  static final Color dialogBackground = hexToColor("#FFEFD8"); // Cor de fundo do AlertDialog
  static final Color success = hexToColor("#61B73F"); // Verde para sucessos
  static final Color inputBackground = hexToColor("#FFF8EB"); // Cor de fundo dos campos de entrada

}

// 🔤 Definições de Estilos de Texto Globais
class AppTextStyles {
  static final TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.title,
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
    color: AppColors.title,
  );
}

// 🌈 Definição do Tema Global
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      // 🔹 Estilização da AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.title,
        iconTheme: IconThemeData(color: AppColors.title),
      ),

      // 🔹 Definição do TextTheme
      textTheme: TextTheme(
        titleLarge: AppTextStyles.title,
        /*bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.title, 
        ),*/
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.title, 
        ),
        /*bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.title, 
        ),*/

        labelLarge: AppTextStyles.button,
      ),

      // 🔹 Caixa de Diálogo (AlertDialog)
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.dialogBackground,
        titleTextStyle: AppTextStyles.title,
        contentTextStyle: AppTextStyles.body,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // 🔹 Estilização dos Botões
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.title,
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // 🔹 Estilização do TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.success,
          textStyle: AppTextStyles.body,
        ),
      ),

      // 🔹 Estilização dos Campos de Entrada
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary, width: 2),
        ),
      ),

      // 🔹 Estilização do BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.title,
      ),

      // 🔹 Estilização do Switch
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.selected)
              ? AppColors.success
              : AppColors.inputBackground;
        }),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.selected)
              ? AppColors.accent
              : AppColors.inputBackground;
        }),
      ),

      // 🔹 Estilização do ListTile
      listTileTheme: ListTileThemeData(
        titleTextStyle: AppTextStyles.body,
      ),

      // 🔹 Estilização do Card
      cardTheme: CardTheme(
        color: AppColors.card, // Cor de fundo do card
        elevation: 4, // Sombra
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Borda arredondada
        ),
      ),

      // 🔹 Estilização do IconButton
        iconTheme: IconThemeData(
        color: AppColors.primary, // Define a cor padrão dos ícones
        size: 24, // Tamanho padrão dos ícones
      ),

    );
  }
}

// 🟢 Definições de Cores Globais (ainda para serem definidas)
  //cores ainda para serem definidas
  /*
  static final Color error = hexToColor("#FF0000"); // Cor de erro (vermelho)
  static final Color success = hexToColor("#00FF00"); // Cor de sucesso (verde)
  static final Color warning = hexToColor("#FFA500"); // Cor de aviso (laranja)
  static final Color info = hexToColor("#0000FF"); // Cor de informação (azul)
  static final Color disabled = hexToColor("#A9A9A9"); // Cor para elementos desativados (cinza)
  static final Color shadow = hexToColor("#000000"); // Cor da sombra (preto)
  static final Color lightShadow = hexToColor("#000000"); // Cor da sombra clara (preto)
  static final Color darkShadow = hexToColor("#000000"); // Cor da sombra escura (preto)
  static final Color light = hexToColor("#FFEFD8"); // Cor clara (PAPAYA WHIP)
  static final Color dark = hexToColor("#0A0A0A"); // Cor escura (preto)
  static final Color lightBackground = hexToColor("#FFEFD8"); // Cor de fundo clara (PAPAYA WHIP)
  static final Color darkBackground = hexToColor("#0A0A0A"); // Cor de fundo escura (preto)
  static final Color lightCard = hexToColor("#FFEFD8"); // Cor de fundo clara dos cards (PAPAYA WHIP)
  static final Color darkCard = hexToColor("#0A0A0A"); // Cor de fundo escura dos cards (preto)
  static final Color lightText = hexToColor("#FFEFD8"); // Cor do texto claro (PAPAYA WHIP)
  static final Color darkText = hexToColor("#0A0A0A"); // Cor do texto escuro (preto)
  static final Color lightTitle = hexToColor("#FFEFD8"); // Cor do título claro (PAPAYA WHIP)
  static final Color darkTitle = hexToColor("#0A0A0A"); // Cor do título escuro (preto)
  */