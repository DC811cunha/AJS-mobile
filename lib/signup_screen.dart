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
              // Placeholder para a logo (substituir mais tarde)
              SizedBox(
                height: 150, // Espaço reservado para a logo
                child: Center(
                  child: Text(
                    'LOGO AQUI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Campo de nome completo
              const TextField(
                decoration: InputDecoration(
                  labelText: 'NOME COMPLETO',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Campo de email
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'E-MAIL',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Campo de senha
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

              // Campo de confirmação senha
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'CONFIRME SUA SENHA',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),/*----------------------------------------------------------------------------------------*/

              // Botão de cadastrar (um pouco menor)
              SizedBox(
                width: 250, // Diminuindo a largura do botão
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');// Lógica de cadastro
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Ajuste no padding para o botão ficar menor
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CADASTRAR',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Texto preto
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}