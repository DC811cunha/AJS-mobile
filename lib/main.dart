<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
import 'package:flutter/material.dart'; 
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o pacote Supabase para autenticação e banco de dados
import 'login_screen.dart'; // Importa o arquivo contendo a tela de login
import 'signup_screen.dart'; // Importa o arquivo contendo a tela de cadastro
import 'home_screen.dart'; // Importa o arquivo contendo a tela principal (Home)
import 'somos_screen.dart'; // Importa o arquivo contendo a tela "Quem Somos"

// Função principal que é o ponto de entrada do aplicativo
void main() async {
  // Garantir a inicialização do Flutter antes de executar o Supabase
  WidgetsFlutterBinding.ensureInitialized();

  // Configuração inicial do Supabase com URL e Chave de API
  await Supabase.initialize(
    url: 'https://ymnjjbcnsybktxybcfsv.supabase.co', // URL do projeto Supabase
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InltbmpqYmNuc3lia3R4eWJjZnN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI5MjkzODMsImV4cCI6MjA0ODUwNTM4M30.npiuMlsOX5_pi5O3LGrddifw8mcvKylTB6E5WYVZa8c', // Chave anônima para autenticação e acesso ao banco de dados
  );

  // Executa o aplicativo
<<<<<<< HEAD
=======
=======
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'somos_screen.dart';

void main() {
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
  // Método build é responsável por construir a interface do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de depuração no canto superior direito
      initialRoute: '/', // Define a rota inicial como a tela de login ("/")

      // Mapa de rotas que define as telas navegáveis do aplicativo
      routes: {
        '/': (context) => const LoginScreen(), // Rota inicial que leva para a tela de login
        '/signup': (context) => const CadastroScreen(), // Rota para a tela de cadastro
        '/home': (context) => const HomeScreen(), // Rota para a tela principal (Home)
        '/somos': (context) => const SomosScreen(), // Rota para a tela "Quem Somos"
<<<<<<< HEAD
=======
=======
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const CadastroScreen(),
        '/home': (context) => const HomeScreen(),
        '/somos': (context) => const SomosScreen(),
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
      },
    );
  }
}
