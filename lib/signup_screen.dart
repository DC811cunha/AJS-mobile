<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o pacote Supabase para autenticação e banco de dados
import 'package:ajs/home_screen.dart'; // Importa a tela Home

// Classe principal da tela de cadastro, utilizando StatefulWidget pois há interação dinâmica
class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState(); // Cria o estado para a tela de cadastro
}

class _CadastroScreenState extends State<CadastroScreen> {
  // Controladores para capturar os dados de entrada do usuário
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // Chave para validar o formulário
  final _formKey = GlobalKey<FormState>();

  // Função assíncrona para realizar o cadastro do usuário
  Future<void> _signUp() async {
    // Valida os campos do formulário
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim(); // Captura o e-mail do usuário
      final password = _passwordController.text.trim(); // Captura a senha do usuário
      final name = _nameController.text.trim(); // Captura o nome completo do usuário

      try {
        // Realiza o cadastro no Supabase
        final response = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
          data: {'full_name': name}, // Adiciona o nome completo como dado extra
        );

        if (response.user != null) {
          // Exibe mensagem de sucesso
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cadastro realizado com sucesso!')),
          );

          // Redireciona o usuário para a tela inicial (HomeScreen)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          // Mensagem de erro em caso de resposta inesperada
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro inesperado ao criar a conta.')),
          );
        }
      } catch (e) {
        // Exibe mensagem de erro em caso de falha
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar a conta: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 189, 189, 189), // Define a cor de fundo da tela
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Espaçamento lateral
          child: Form(
            key: _formKey, // Associa o formulário à chave para validação
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
              children: [
                // Exibição da logo
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
<<<<<<< HEAD
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Espaçamento vertical

                // Campo de entrada para o nome completo
                TextFormField(
                  controller: _nameController, // Controlador para capturar o nome
                  decoration: const InputDecoration(
                    labelText: 'NOME COMPLETO', // Rótulo do campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco para o campo
                  ),
                  validator: (value) {
                    // Validação: verifica se o campo não está vazio
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome completo.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Campo de entrada para o e-mail
                TextFormField(
                  controller: _emailController, // Controlador para capturar o e-mail
                  decoration: const InputDecoration(
                    labelText: 'E-MAIL', // Rótulo do campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco para o campo
                  ),
                  keyboardType: TextInputType.emailAddress, // Define o tipo de teclado como de e-mail
                  validator: (value) {
                    // Validação: verifica se o campo não está vazio e se o e-mail é válido
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Insira um e-mail válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Campo de entrada para a senha
                TextFormField(
                  controller: _passwordController, // Controlador para capturar a senha
                  obscureText: true, // Oculta o texto digitado (modo senha)
                  decoration: const InputDecoration(
                    labelText: 'SENHA', // Rótulo do campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco para o campo
                  ),
                  validator: (value) {
                    // Validação: verifica se a senha tem pelo menos 6 caracteres
                    if (value == null || value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Botão para realizar o cadastro
                SizedBox(
                  width: 250, // Largura do botão
                  child: ElevatedButton(
                    onPressed: _signUp, // Chama a função de cadastro ao pressionar o botão
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
                        color: Colors.black, // Cor do texto
                      ),
                    ),
                  ),
                ),
              ],
            ),
=======
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Espaçamento vertical

                // Campo de entrada para o nome completo
                TextFormField(
                  controller: _nameController, // Controlador para capturar o nome
                  decoration: const InputDecoration(
                    labelText: 'NOME COMPLETO', // Rótulo do campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco para o campo
                  ),
                  validator: (value) {
                    // Validação: verifica se o campo não está vazio
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome completo.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Campo de entrada para o e-mail
                TextFormField(
                  controller: _emailController, // Controlador para capturar o e-mail
                  decoration: const InputDecoration(
                    labelText: 'E-MAIL', // Rótulo do campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco para o campo
                  ),
                  keyboardType: TextInputType.emailAddress, // Define o tipo de teclado como de e-mail
                  validator: (value) {
                    // Validação: verifica se o campo não está vazio e se o e-mail é válido
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Insira um e-mail válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Campo de entrada para a senha
                TextFormField(
                  controller: _passwordController, // Controlador para capturar a senha
                  obscureText: true, // Oculta o texto digitado (modo senha)
                  decoration: const InputDecoration(
                    labelText: 'SENHA', // Rótulo do campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                    filled: true,
                    fillColor: Colors.white, // Fundo branco para o campo
                  ),
                  validator: (value) {
                    // Validação: verifica se a senha tem pelo menos 6 caracteres
                    if (value == null || value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), // Espaçamento vertical

                // Botão para realizar o cadastro
                SizedBox(
                  width: 250, // Largura do botão
                  child: ElevatedButton(
                    onPressed: _signUp, // Chama a função de cadastro ao pressionar o botão
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
                        color: Colors.black, // Cor do texto
                      ),
                    ),
                  ),
                ),
              ],
            ),
=======
import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 189, 189, 189),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'NOME COMPLETO',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-MAIL',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'SENHA',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'CONFIRME SUA SENHA',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CADASTRAR',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
          ),
        ),
      ),
    );
  }
}
