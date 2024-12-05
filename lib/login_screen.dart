import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o cliente Supabase para autenticação
import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/signup_screen.dart'; // Importa a tela de cadastro (Sign-up)

// Classe que representa a tela de login
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Retorna o estado associado à tela de login
}

// Estado da tela de login
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(); // Controlador para capturar o e-mail
  final _passwordController = TextEditingController(); // Controlador para capturar a senha

  // Chave global para validação do formulário
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false; // Variável para controle da visibilidade da senha

  // Função assíncrona que realiza o login
  Future<void> _login() async {
    // Verifica se o formulário é válido
    if (!_formKey.currentState!.validate()) {
      return; // Retorna caso a validação falhe
    }

    final email = _emailController.text.trim(); // Remove espaços em branco do e-mail
    final password = _passwordController.text.trim(); // Remove espaços em branco da senha

    // Exibe um indicador de carregamento enquanto o login está sendo processado
    showDialog(
      context: context,
      barrierDismissible: false, // Impede que o usuário feche o diálogo tocando fora dele
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Tenta autenticar o usuário com e-mail e senha
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Fecha o indicador de carregamento
      Navigator.of(context).pop();

      if (response.user != null) {
        // Caso o login seja bem-sucedido, redireciona para a tela HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Caso contrário, exibe uma mensagem de erro genérica
        _showErrorDialog('Erro desconhecido ao fazer login.');
      }
    } catch (e) {
      // Fecha o indicador de carregamento em caso de erro
      Navigator.of(context).pop();

      // Define uma mensagem de erro padrão
      String errorMessage = e is AuthException ? e.message : 'Erro inesperado: ${e.toString()}';

      // Substitui mensagens de erro específicas por textos em português
      if (errorMessage.contains("Invalid login credentials")) {
        errorMessage = "Credenciais de login inválidas. Verifique seu e-mail e senha.";
      }

      // Exibe a mensagem de erro
      _showErrorDialog(errorMessage);
    }
  }

  // Função para exibir mensagens de erro em um AlertDialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro ao fazer login'), // Título do diálogo
        content: Text(message), // Mensagem exibida
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Fecha o diálogo ao pressionar "OK"
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 189, 189, 189), // Cor de fundo
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Define o padding horizontal
          child: Form(
            key: _formKey, // Associa o formulário à chave global
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
              children: [
                // Exibição da logo do aplicativo
                SizedBox(
                  height: 150, // Altura do container da logo
                  child: Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logoNormal.png', // Caminho da imagem
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover, // Ajusta a imagem dentro do espaço disponível
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Espaçamento vertical

                // Campo de entrada para o e-mail
                TextFormField(
                  controller: _emailController, // Controlador para capturar o e-mail
                  decoration: const InputDecoration(
                    labelText: 'E-MAIL', // Rótulo do campo
                    border: OutlineInputBorder(), // Adiciona borda ao campo
                    filled: true,
                    fillColor: Colors.white, // Define o fundo como branco
                  ),
                  keyboardType: TextInputType.emailAddress, // Define o teclado para e-mail
                  validator: (value) {
                    // Valida o campo de e-mail
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.'; // Retorna erro caso o campo esteja vazio
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Por favor, insira um e-mail válido.'; // Retorna erro caso o e-mail seja inválido
                    }
                    return null; // Retorna null caso não haja erro
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Campo de entrada para a senha
                TextFormField(
                  controller: _passwordController, // Controlador para capturar a senha
                  obscureText: !_isPasswordVisible, // Alterna a visibilidade da senha
                  decoration: InputDecoration(
                    labelText: 'SENHA', // Rótulo do campo
                    border: const OutlineInputBorder(), // Adiciona borda ao campo
                    filled: true,
                    fillColor: Colors.white, // Define o fundo como branco
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Ícone de visibilidade
                      ),
                      onPressed: () {
                        // Alterna a visibilidade da senha
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    // Valida o campo de senha
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.'; // Retorna erro caso o campo esteja vazio
                    }
                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.'; // Retorna erro caso a senha seja curta
                    }
                    return null; // Retorna null caso não haja erro
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Botão para realizar o login
                SizedBox(
                  width: 250, // Largura do botão
                  child: ElevatedButton(
                    onPressed: _login, // Chama a função _login ao ser pressionado
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
                    // Lógica para recuperação de senha
                  },
                  child: const Text(
                    'Esqueci a senha', // Texto do botão
                    style: TextStyle(color: Colors.black54), // Estilo do texto
                  ),
                ),
                const SizedBox(height: 10), // Espaçamento vertical

                const Text("Não tem uma conta no APP? É GRÁTIS"), // Texto informativo
                const SizedBox(height: 10), // Espaçamento vertical

                // Botão para redirecionar para a tela de cadastro
                SizedBox(
                  width: 250, // Largura do botão
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CadastroScreen()), // Navega para a tela de cadastro
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
