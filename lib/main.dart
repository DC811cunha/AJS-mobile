import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o pacote Supabase para autenticação e banco de dados
import 'login_screen.dart'; // Tela de login
import 'signup_screen.dart'; // Tela de cadastro
import 'home_screen.dart'; // Tela principal (Home)
import 'somos_screen.dart'; // Tela "Quem Somos"

// Função principal que é o ponto de entrada do aplicativo
void main() async {
  // Inicializa widgets do Flutter antes de executar código assíncrono
  WidgetsFlutterBinding.ensureInitialized();

  // Configuração inicial do Supabase com URL e chave de API
  await Supabase.initialize(
    url: 'https://ymnjjbcnsybktxybcfsv.supabase.co', // Substitua pela URL do seu projeto Supabase
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InltbmpqYmNuc3lia3R4eWJjZnN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI5MjkzODMsImV4cCI6MjA0ODUwNTM4M30.npiuMlsOX5_pi5O3LGrddifw8mcvKylTB6E5WYVZa8c', // Substitua pela chave anônima do seu projeto
  );

  // Executa o aplicativo
  runApp(const MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de depuração
      initialRoute: '/', // Define a rota inicial
      theme: ThemeData(
        primarySwatch: Colors.grey, // Define a paleta de cores principal
      ),
      routes: {
        '/': (context) => const LoginScreen(), // Rota para a tela de login
        '/signup': (context) => const CadastroScreen(), // Rota para a tela de cadastro
        '/home': (context) => const HomeScreen(), // Rota para a tela principal (Home)
        '/somos': (context) => const SomosScreen(), // Rota para a tela "Quem Somos"
      },
      onGenerateRoute: (settings) {
        // Trata rotas desconhecidas e redireciona para a tela de login
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
