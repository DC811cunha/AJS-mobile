import 'package:flutter/material.dart'; // Importa o pacote principal do Flutter para construção da interface
import 'login_screen.dart'; // Importa a tela de login
import 'signup_screen.dart'; // Importa a tela de cadastro
import 'home_screen.dart'; // Importa a tela principal (Home)
import 'somos_screen.dart'; // Importa a tela de "Quem Somos"

// Função principal que serve como ponto de entrada do aplicativo
void main() {
  // runApp inicializa o aplicativo chamando a classe MyApp
  runApp(const MyApp());
}

// Classe principal do aplicativo que herda de StatelessWidget, pois não possui estado dinâmico
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // O método build é responsável por construir a interface principal da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp é o widget raiz do aplicativo, responsável pela navegação e temas
      debugShowCheckedModeBanner: false, // Remove o banner de debug no canto superior direito
      initialRoute: '/', // Define a rota inicial como a tela de login ('/')

      // Mapa de rotas navegáveis dentro do aplicativo
      routes: {
        '/': (context) => const LoginScreen(), // Rota inicial que leva para a tela de login
        '/signup': (context) => const CadastroScreen(), // Rota para a tela de cadastro
        '/home': (context) => const HomeScreen(), // Rota para a tela principal (Home)
        '/somos': (context) => const SomosScreen(), // Rota para a tela "Quem Somos"
      },
    );
  }
}
