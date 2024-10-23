import 'package:flutter/material.dart'; // Importa o pacote principal do Flutter para construção da interface
import 'login_screen.dart'; // Importa o arquivo da tela de login
import 'signup_screen.dart'; // Importa o arquivo da tela de cadastro
import 'home_screen.dart'; // Importa o arquivo da tela principal (Home)
import 'somos_screen.dart'; // Importa o arquivo da tela de Quem Somos

// Função principal que é o ponto de entrada do aplicativo
void main() {
  // runApp inicia o aplicativo chamando a classe MyApp
  runApp(const MyApp());
}

// Classe principal do aplicativo que herda de StatelessWidget, pois a estrutura principal não tem estado dinâmico
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Método build é responsável por construir a interface da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp é o widget principal do aplicativo, que cuida da navegação e temas
      debugShowCheckedModeBanner:
          false, // Remove o banner de debug no canto superior direito
      initialRoute: '/', // Define a rota inicial como a tela de login ("/")

      // Define as rotas que podem ser navegadas no aplicativo
      routes: {
        '/': (context) => const LoginScreen(), // Rota inicial que leva para a tela de login
        '/signup': (context) => const CadastroScreen(), // Rota para a tela de cadastro
        '/home': (context) => const HomeScreen(), // Rota para a tela principal (Home)
        '/somos': (context) => const SomosScreen(), // Rota para a tela Quem somos
      },
    );
  }
}
