import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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

              // Campo de e-mail
              const TextField(
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
                  labelText: 'PASSWORD',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Botão de login (um pouco menor)
              SizedBox(
                width: 250, // Diminuindo a largura do botão
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica de login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Ajuste no padding para o botão ficar menor
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ENTRAR',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Texto preto
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Esqueci a senha
              TextButton(
                onPressed: () {
                  // Ação para "Esqueci a senha"
                },
                child: const Text(
                  'Esqueci a senha',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 10),

              // Texto informativo
              const Text("Não tem uma conta no APP? É GRÁTIS"),

              const SizedBox(height: 10),

              // Botão "Crie sua conta aqui" com estilo de caixa laranja (um pouco menor)
              SizedBox(
                width: 250, // Diminuindo a largura do botão
                child: ElevatedButton(
                  onPressed: () {
                    // Ação para "Criar conta"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Ajuste no padding para o botão ficar menor
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Crie sua conta aqui',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Texto preto
                    ),
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


