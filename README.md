# testeuno
Estruturacao inicial do projeto de desenvolvimento de aplicativo para trabalho de conclusao do curso de Analise e Desenvolvimento de Sistemas.
Projeto Idealizado e Desenvolvido pelos alunos:
Alisson Regis (Técnologo Alimentar)
Daniel Ferreira

# sugestao de paginas e sua documentacao inicial
Home/
|- Sobre (informações gerais sobre o aplicativo e desenvolvedores)
|- Login (acesso de usuários cadastrados ou novos)
|	|- Cadastro de Usuário (Criar conta no aplicativo)
|	|- Esqueceu a Senha (Recuperação de senha para usuários cadastrados)
|	|- Dashboard (Área Principal do Usuário AUTENTICADO)
|	|	|- Configurações (Gerenciar preferências do usuário e do app)
|	|	|- Resumo Geral (Visão Geral dos dados do usuário, como alimentação e estoque)
|	|	|- Menus (Planejamento e Organização de Refeições Diárias)
|	|	| 	|- Café da manhã
|	|	| 	|	|- Fichas Técnicas/Preparação
| 	|	|	|- Lanches
|	|	|	|	|- Fichas Técnicas/Preparação
|	|	|	|- Almoço
|	|	| 	|	|- Fichas Técnicas/Preparação
|	|	|	|- Jantar
|	|	|	|	|- Fichas Técnicas/Preparação
|	|	|	|- Receituário das Fichas Técnicas (Banco de receitas organizados por categorias)
|	|	|- Estoque (Gerenciamento de Ingredientes e Produtos disponíveis)
|	|	| 	|- Visualizar Estoque (Lista de Itens disponíveis)
|	|	|	|	|- Ficha do Produto (Detalhes sobre cada item no estoque: validade, quantidade, etc.)
|	|	|- Controle Nutricional (Monitoramento de nutrientes e categorias alimentares)
|	|	| 	|- Grupos Alimentares (organização conforme nova "piramide alimentar"; proteínas, carboidratos, gorduras. Quantidade de grupos de acordo.)
|	|	|- Compras (Gerenciamento de itens a serem adquiridos)
|	|	| 	|- Alimentos/Produtos (gerenciar produtos para compra)
|	|	|	|	|- Adicionar Alimento/Produto (inserir um novo item à lista  de compras vigente)
|	|	|	|	|- Adicionar Ficha Nutricional Alimento/Produto (Registrar os valores nutricionais de cada alimento)
|	|	| 	|- Listas de Compras (Visualizar compras feitas anteriormente)
|	|	|	|	|- Ver Listas Realizadas/Compradas 
|	|	|	|- Sugestões de Listas de Compras (Recomendações de compras baseadas no estoque atual)
|	|	|	|	|- Ver Listas Sugeridas com Base no Estoque (Gerar listas de compras automáticas conforme necessidade)


# sugestao de arquivamento para o app
lib/
│-- main.dart
│-- app.dart
│
├── core/                  # 📌 Configurações globais e utilitários
│   ├── theme.dart         # Definições de tema
│   ├── routes.dart        # Gerenciamento de rotas
│   ├── constants.dart     # Variáveis globais
│
├── modules/               # 📌 Cada funcionalidade principal do app
│   │
│   ├── home/              # 🏠 Tela inicial e informações gerais
│   │   ├── views/
│   │   │   ├── home_page.dart
│   │   │   ├── about_page.dart
│   │   ├── widgets/       # Componentes reutilizáveis da Home
│   │   ├── controllers/   # Lógica da Home (caso precise)
│   │
│   ├── auth/              # 🔐 Login, cadastro e recuperação de senha
│   │   ├── views/
│   │   │   ├── login_page.dart
│   │   │   ├── register_page.dart
│   │   │   ├── forgot_password_page.dart
│   │   ├── controllers/
│   │   ├── services/      # Comunicação com backend, se houver
│   │
│   ├── dashboard/         # 📊 Área principal do usuário autenticado
│   │   ├── views/
│   │   │   ├── dashboard_page.dart
│   │   │   ├── settings_page.dart
│   │   │   ├── summary_page.dart
│   │   ├── widgets/
│   │   ├── controllers/
│   │
│   ├── menus/             # 🍽️ Gerenciamento de refeições e receitas
│   │   ├── views/
│   │   │   ├── menus_page.dart
│   │   │   ├── breakfast_page.dart
│   │   │   ├── breakfast_details_page.dart
│   │   │   ├── snacks_page.dart
│   │   │   ├── snacks_details_page.dart
│   │   │   ├── lunch_page.dart
│   │   │   ├── lunch_details_page.dart
│   │   │   ├── dinner_page.dart
│   │   │   ├── dinner_details_page.dart
│   │   │   ├── recipe_book_page.dart
│   │   ├── controllers/
│   │   ├── widgets/
│   │
│   ├── inventory/         # 📦 Gestão de estoque
│   │   ├── views/
│   │   │   ├── inventory_page.dart
│   │   │   ├── inventory_list_page.dart
│   │   │   ├── product_details_page.dart
│   │   ├── controllers/
│   │   ├── widgets/
│   │
│   ├── nutrition/         # 🥗 Controle nutricional
│   │   ├── views/
│   │   │   ├── nutrition_control_page.dart
│   │   │   ├── food_group1_page.dart
│   │   │   ├── food_group2_page.dart
│   │   ├── controllers/
│   │   ├── widgets/
│   │
│   ├── shopping/          # 🛒 Controle de compras
│   │   ├── views/
│   │   │   ├── shopping_page.dart
│   │   │   ├── products_page.dart
│   │   │   ├── add_product_page.dart
│   │   │   ├── add_nutrition_info_page.dart
│   │   │   ├── shopping_list_page.dart
│   │   │   ├── past_shopping_lists_page.dart
│   │   │   ├── suggested_lists_page.dart
│   │   │   ├── suggested_lists_view_page.dart
│   │   ├── controllers/
│   │   ├── widgets/
│   │
├── widgets/               # 📦 Componentes globais reutilizáveis
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   ├── card_item.dart
│
├── services/              # 🌐 Comunicação com APIs e Banco de Dados
│   ├── api_service.dart
│   ├── auth_service.dart
│   ├── database_service.dart
│
├── models/                # 🗃️ Modelos de dados usados no app
│   ├── user_model.dart
│   ├── product_model.dart
│   ├── recipe_model.dart
│
├── providers/             # 🔄 Gerenciamento de estado (ex: Provider, Riverpod, etc.)
│   ├── user_provider.dart
│   ├── inventory_provider.dart
│
└── utils/                 # 🛠️ Funções utilitárias
    ├── validators.dart
    ├── formatters.dart
    ├── date_utils.dart


