import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o pacote Supabase para autenticação e banco de dados
import 'package:ajs/home_screen.dart'; // Importa a tela Home
import 'package:ajs/login_screen.dart'; // Importa a tela de login

// Tela de Cadastro do Usuário
class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  // Controladores para capturar os valores dos campos de entrada
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // Chave global para validar o formulário
  final _formKey = GlobalKey<FormState>();

  // Variáveis para controlar a visibilidade das senhas
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Função para cadastrar o usuário no Supabase
  Future<void> _signUp() async {
    // Verifica se o formulário está válido
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim(); // Captura o e-mail
      final password = _passwordController.text.trim(); // Captura a senha
      final name = _nameController.text.trim(); // Captura o nome completo

      try {
        // Tenta cadastrar o usuário no Supabase
        final response = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
          data: {'full_name': name}, // Adiciona o nome completo como dado extra
        );

        if (response.user != null) {
          // Exibe mensagem de sucesso se o cadastro for concluído
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cadastro realizado com sucesso!')),
          );

          // Redireciona o usuário para a tela principal (Home)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          // Exibe mensagem de erro genérico em caso de falha inesperada
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro inesperado ao criar a conta.')),
          );
        }
      } catch (e) {
        // Trata erros durante o cadastro
        String errorMessage = 'Erro ao criar a conta.';
        if (e is AuthException) {
          if (e.message.contains('already registered')) {
            // Mensagem específica para e-mail já cadastrado
            errorMessage = 'Este e-mail já está cadastrado. Por favor, use outro e-mail.';
          } else {
            errorMessage = e.message; // Outras mensagens do Supabase
          }
        }
        // Exibe mensagem de erro para o usuário
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color.fromARGB(172, 189, 189, 189); // Cor de fundo da tela

    return Scaffold(
      backgroundColor: backgroundColor, // Define a cor de fundo
      appBar: AppBar(
        backgroundColor: backgroundColor, // Garante que o AppBar tenha a mesma cor do fundo
        elevation: 0, // Remove a sombra padrão do AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Ícone de voltar
          onPressed: () {
            // Volta para a tela de login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Adiciona espaçamento lateral
          child: Form(
            key: _formKey, // Associa o formulário à chave de validação
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
              children: [
                // Exibição da logo do aplicativo
                SizedBox(
                  height: 150,
                  child: Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logoNormal.png', // Caminho para a imagem da logo
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover, // Ajusta a imagem dentro de um formato oval
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Espaçamento vertical

                // Campo de entrada para Nome Completo
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'NOME COMPLETO', // Rótulo do campo
                    border: OutlineInputBorder(), // Adiciona borda ao campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco do campo
                  ),
                  validator: (value) {
                    // Valida se o nome completo foi preenchido
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome completo.';
                    }
                    if (value.split(' ').length < 2) {
                      return 'Por favor, insira seu nome completo.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de entrada para Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-MAIL', // Rótulo do campo
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress, // Define o teclado como tipo e-mail
                  validator: (value) {
                    // Valida se o e-mail foi preenchido e se é válido
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Insira um e-mail válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de entrada para Senha
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible, // Controla a visibilidade do texto
                  decoration: InputDecoration(
                    labelText: 'SENHA',
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Ícones de visibilidade
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
                    // Valida se a senha atende aos requisitos
                    if (value == null || value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de entrada para Confirmar Senha
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible, // Controla a visibilidade do texto
                  decoration: InputDecoration(
                    labelText: 'CONFIRMAR SENHA',
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off, // Ícones de visibilidade
                      ),
                      onPressed: () {
                        // Alterna a visibilidade da senha de confirmação
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    // Valida se as senhas coincidem
                    if (value != _passwordController.text) {
                      return 'As senhas não coincidem.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Botão de Cadastro
                SizedBox(
                  width: 250, // Largura do botão
                  child: ElevatedButton(
                    onPressed: _signUp, // Chama a função de cadastro ao clicar
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Cor do botão
                      padding: const EdgeInsets.symmetric(vertical: 12.0), // Padding interno do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                      ),
                    ),
                    child: const Text(
                      'CADASTRAR', // Texto exibido no botão
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
