import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o cliente Supabase para autenticação
import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/signup_screen.dart'; // Importa a tela de cadastro (Sign-up)

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Adiciona uma chave global para validação de formulário
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return; // Retorna se a validação do formulário falhar
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      Navigator.of(context).pop(); // Fecha o indicador de carregamento

      if (response.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        _showErrorDialog('Erro desconhecido ao fazer login.');
      }
    } catch (e) {
      Navigator.of(context).pop();
      String errorMessage = e is AuthException ? e.message : 'Erro inesperado: ${e.toString()}';

      // Substitui mensagens específicas para português
      if (errorMessage.contains("Invalid login credentials")) {
        errorMessage = "Credenciais de login inválidas. Verifique seu e-mail e senha.";
      }

      _showErrorDialog(errorMessage);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro ao fazer login'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 189, 189, 189),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey, // Adiciona validação ao formulário
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Exibição da logo do aplicativo
                SizedBox(
                  height: 150,
                  child: Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logoNormal.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Campo de entrada para email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-MAIL',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Por favor, insira um e-mail válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de entrada para senha
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'SENHA',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.';
                    }
                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Botão para realizar o login
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Link para recuperação de senha
                TextButton(
                  onPressed: () {
                    // Lógica para recuperação de senha
                  },
                  child: const Text(
                    'Esqueci a senha',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 10),

                const Text("Não tem uma conta no APP? É GRÁTIS"),
                const SizedBox(height: 10),

                // Botão para redirecionar para a tela de cadastro
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CadastroScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Crie sua conta aqui',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
