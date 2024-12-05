import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o pacote Supabase para autenticação e banco de dados
import 'login_screen.dart'; // Tela de login
import 'signup_screen.dart'; // Tela de cadastro
import 'home_screen.dart'; // Tela principal (Home)
import 'somos_screen.dart'; // Tela "Quem Somos"

// Função principal que é o ponto de entrada do aplicativo
void main() async {
  // Garante que os widgets do Flutter sejam inicializados antes de executar código assíncrono
  WidgetsFlutterBinding.ensureInitialized();

  // Configuração inicial do Supabase com URL e chave de API
  await Supabase.initialize(
    url: 'https://ymnjjbcnsybktxybcfsv.supabase.co', // URL do projeto Supabase (substituir pela URL do seu projeto)
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InltbmpqYmNuc3lia3R4eWJjZnN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI5MjkzODMsImV4cCI6MjA0ODUwNTM4M30.npiuMlsOX5_pi5O3LGrddifw8mcvKylTB6E5WYVZa8c', // Chave anônima para autenticação (substituir pela chave do seu projeto)
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
      debugShowCheckedModeBanner: false, // Remove o banner de depuração no canto superior direito
      initialRoute: '/', // Define a rota inicial como a tela de login
      theme: ThemeData(
        primarySwatch: Colors.grey, // Define a paleta de cores principal do aplicativo
      ),
      // Mapeamento das rotas do aplicativo
      routes: {
        '/': (context) => const LoginScreen(), // Rota para a tela de login
        '/signup': (context) => const CadastroScreen(), // Rota para a tela de cadastro
        '/home': (context) => const HomeScreen(), // Rota para a tela principal (Home)
        '/somos': (context) => const SomosScreen(), // Rota para a tela "Quem Somos"
      },
      onGenerateRoute: (settings) {
        // Caso a rota não esteja definida, redireciona para a tela de login
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
