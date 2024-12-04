<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o cliente Supabase para autenticação
import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/signup_screen.dart'; // Importa a tela de cadastro (Sign-up)
<<<<<<< HEAD
=======

// Classe principal da tela de login, utilizando StatefulWidget porque há estado dinâmico
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Cria o estado da tela de login
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores de texto para capturar entrada de email e senha
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Função assíncrona para realizar o login
  Future<void> _login() async {
    final email = _emailController.text.trim(); // Obtém o email do campo de entrada
    final password = _passwordController.text.trim(); // Obtém a senha do campo de entrada

    // Verifica se os campos estão preenchidos
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Por favor, preencha todos os campos.'); // Mostra mensagem de erro
      return;
    }

    // Exibe um indicador de carregamento durante o login
    showDialog(
      context: context,
      barrierDismissible: false, // Impede que o usuário feche o diálogo clicando fora dele
      builder: (context) => const Center(child: CircularProgressIndicator()), // Mostra indicador de progresso
    );

    try {
      // Realiza a tentativa de login usando Supabase
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Fecha o indicador de carregamento
      Navigator.of(context).pop();

      // Verifica se o login foi bem-sucedido
      if (response.user != null) {
        // Redireciona para a tela principal (HomeScreen) em caso de sucesso
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Mostra mensagem de erro em caso de falha desconhecida
        _showErrorDialog('Erro desconhecido ao fazer login.');
      }
    } catch (e) {
      // Fecha o indicador de carregamento em caso de erro
      Navigator.of(context).pop();
      // Mostra mensagem de erro detalhada
      _showErrorDialog('Ocorreu um erro: ${e is AuthException ? e.message : e.toString()}');
    }
  }

  // Função para exibir mensagens de erro em um AlertDialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro de login'), // Título do diálogo
        content: Text(message), // Mensagem de erro
        actions: [
          // Botão de OK para fechar o diálogo
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 189, 189, 189), // Cor de fundo da tela
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Define espaçamento lateral
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
            children: [
              // Exibição da logo do aplicativo
<<<<<<< HEAD
=======
=======
import 'package:flutter/material.dart';
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c

// Classe principal da tela de login, utilizando StatefulWidget porque há estado dinâmico
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Cria o estado da tela de login
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores de texto para capturar entrada de email e senha
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Função assíncrona para realizar o login
  Future<void> _login() async {
    final email = _emailController.text.trim(); // Obtém o email do campo de entrada
    final password = _passwordController.text.trim(); // Obtém a senha do campo de entrada

    // Verifica se os campos estão preenchidos
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Por favor, preencha todos os campos.'); // Mostra mensagem de erro
      return;
    }

    // Exibe um indicador de carregamento durante o login
    showDialog(
      context: context,
      barrierDismissible: false, // Impede que o usuário feche o diálogo clicando fora dele
      builder: (context) => const Center(child: CircularProgressIndicator()), // Mostra indicador de progresso
    );

    try {
      // Realiza a tentativa de login usando Supabase
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Fecha o indicador de carregamento
      Navigator.of(context).pop();

      // Verifica se o login foi bem-sucedido
      if (response.user != null) {
        // Redireciona para a tela principal (HomeScreen) em caso de sucesso
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Mostra mensagem de erro em caso de falha desconhecida
        _showErrorDialog('Erro desconhecido ao fazer login.');
      }
    } catch (e) {
      // Fecha o indicador de carregamento em caso de erro
      Navigator.of(context).pop();
      // Mostra mensagem de erro detalhada
      _showErrorDialog('Ocorreu um erro: ${e is AuthException ? e.message : e.toString()}');
    }
  }

  // Função para exibir mensagens de erro em um AlertDialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro de login'), // Título do diálogo
        content: Text(message), // Mensagem de erro
        actions: [
          // Botão de OK para fechar o diálogo
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 189, 189, 189), // Cor de fundo da tela
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Define espaçamento lateral
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
            children: [
<<<<<<< HEAD
              // Exibição da logo do aplicativo
=======
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
              SizedBox(
                height: 150,
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
<<<<<<< HEAD
                      'assets/images/logoNormal.png', // Caminho para a logo
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover, // Ajusta a imagem dentro do espaço definido
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
                      'assets/images/logoNormal.png', // Caminho para a logo
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover, // Ajusta a imagem dentro do espaço definido
<<<<<<< HEAD
=======
=======
                      'assets/images/logoNormal.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
                    ),
                  ),
                ),
              ),
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
              const SizedBox(height: 40), // Espaçamento vertical

              // Campo de entrada para email
              TextField(
                controller: _emailController, // Controlador para capturar o email
                decoration: const InputDecoration(
                  labelText: 'E-MAIL', // Rótulo do campo
                  border: OutlineInputBorder(), // Borda ao redor do campo
<<<<<<< HEAD
=======
                  filled: true,
                  fillColor: Colors.white, // Fundo branco para o campo
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Campo de entrada para senha
              TextField(
                controller: _passwordController, // Controlador para capturar a senha
                obscureText: true, // Oculta o texto digitado (modo senha)
                decoration: const InputDecoration(
                  labelText: 'PASSWORD', // Rótulo do campo
                  border: OutlineInputBorder(), // Borda ao redor do campo
                  filled: true,
                  fillColor: Colors.white, // Fundo branco para o campo
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Botão para realizar o login
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: _login, // Chama a função de login ao pressionar
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor do botão
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Padding interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    ),
                  ),
                  child: const Text(
                    'ENTRAR', // Texto exibido no botão
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Cor do texto
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Link para recuperação de senha
              TextButton(
                onPressed: () {
                  // Implementar lógica de recuperação de senha no futuro
                },
                child: const Text(
                  'Esqueci a senha', // Texto do botão
                  style: TextStyle(color: Colors.black54), // Estilo do texto
                ),
              ),
              const SizedBox(height: 10), // Espaçamento vertical

              // Texto informativo sobre a criação de conta
              const Text("Não tem uma conta no APP? É GRÁTIS"),
              const SizedBox(height: 10), // Espaçamento vertical

              // Botão para redirecionar para a tela de cadastro
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroScreen(), // Redireciona para a tela de cadastro
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Cor do botão
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Padding interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    ),
                  ),
                  child: const Text(
                    'Crie sua conta aqui', // Texto exibido no botão
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Cor do texto
                    ),
=======
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'E-MAIL',
                  border: OutlineInputBorder(),
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
                  filled: true,
                  fillColor: Colors.white, // Fundo branco para o campo
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Campo de entrada para senha
              TextField(
                controller: _passwordController, // Controlador para capturar a senha
                obscureText: true, // Oculta o texto digitado (modo senha)
                decoration: const InputDecoration(
                  labelText: 'PASSWORD', // Rótulo do campo
                  border: OutlineInputBorder(), // Borda ao redor do campo
                  filled: true,
                  fillColor: Colors.white, // Fundo branco para o campo
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Botão para realizar o login
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: _login, // Chama a função de login ao pressionar
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor do botão
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Padding interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    ),
                  ),
                  child: const Text(
                    'ENTRAR', // Texto exibido no botão
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Cor do texto
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Link para recuperação de senha
              TextButton(
                onPressed: () {
                  // Implementar lógica de recuperação de senha no futuro
                },
                child: const Text(
                  'Esqueci a senha', // Texto do botão
                  style: TextStyle(color: Colors.black54), // Estilo do texto
                ),
              ),
              const SizedBox(height: 10), // Espaçamento vertical

              // Texto informativo sobre a criação de conta
              const Text("Não tem uma conta no APP? É GRÁTIS"),
              const SizedBox(height: 10), // Espaçamento vertical

              // Botão para redirecionar para a tela de cadastro
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroScreen(), // Redireciona para a tela de cadastro
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Cor do botão
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Padding interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    ),
                  ),
                  child: const Text(
<<<<<<< HEAD
                    'Crie sua conta aqui', // Texto exibido no botão
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Cor do texto
                    ),
=======
                    'Crie sua conta aqui',
                    style: TextStyle(fontSize: 16, color: Colors.black),
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
