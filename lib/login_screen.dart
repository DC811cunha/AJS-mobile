import 'package:flutter/material.dart';

// Classe principal da tela de login, utilizando StatelessWidget pois o conteúdo não muda durante a execução
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // Método build é responsável pela construção da interface da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define o Scaffold, que é a estrutura básica de uma tela em Flutter
      backgroundColor: const Color.fromARGB(172, 189, 189, 189), // Cor de fundo do Scaffold, usando um tom de cinza claro com opacidade

      // Corpo principal da tela
      body: Center(
        // Centra o conteúdo principal da tela
        child: SingleChildScrollView(
          // Permite rolar o conteúdo se o teclado aparecer ou se não houver espaço suficiente
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Define o espaçamento horizontal para as margens
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alinha o conteúdo da coluna ao centro verticalmente
            children: [
              // Espaço reservado para a logo redonda do aplicativo
              SizedBox(
                height: 150, // Define a altura do espaço reservado para a logo
                child: Center(
                  // Centraliza a logo dentro do espaço definido
                  child: ClipOval(
                    // Faz com que a imagem tenha um formato oval
                    child: Image.asset(
                      'assets/images/logoNormal.png', // Caminho para a imagem da logo dentro dos assets do projeto
                      height: 150, // Define a altura da imagem para que ocupe todo o espaço disponível
                      width: 150, // Define a largura da imagem para que fique proporcional, garantindo um círculo perfeito
                      fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço sem distorção
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40), // Espaçamento entre a logo e o próximo elemento

              // Campo de entrada para o e-mail do usuário
              const TextField(
                decoration: InputDecoration(
                  labelText: 'E-MAIL', // Texto informativo para o campo de entrada
                  border: OutlineInputBorder(), // Define uma borda ao redor do campo de entrada
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors.white, // Define a cor de fundo do campo como branco
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre o campo de e-mail e o próximo campo

              // Campo de entrada para a senha do usuário
              const TextField(
                obscureText: true, // Oculta o texto digitado para proteger a senha
                decoration: InputDecoration(
                  labelText: 'PASSWORD', // Texto informativo para o campo de entrada
                  border: OutlineInputBorder(), // Define uma borda ao redor do campo de entrada
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors.white, // Define a cor de fundo do campo como branco
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre o campo de senha e o botão de login

              // Botão de login para enviar as informações
              SizedBox(
                width: 250, // Define a largura do botão de login, deixando ele um pouco menor
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home'); // Navega para a tela principal do aplicativo quando o botão é pressionado
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Define a cor do fundo do botão como azul
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Ajusta o espaçamento interno do botão, aumentando a altura do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Define as bordas do botão arredondadas
                    ),
                  ),
                  child: const Text(
                    'ENTRAR', // Texto que aparece no botão
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte do texto no botão
                      color: Colors.black, // Cor do texto no botão definida como preto
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre o botão de login e o link "Esqueci a senha"

              // Botão de texto para "Esqueci a senha"
              TextButton(
                onPressed: () {
                  // Ação para "Esqueci a senha" - pode ser adicionar lógica de recuperação de senha posteriormente
                },
                child: const Text(
                  'Esqueci a senha', // Texto que aparece no botão
                  style: TextStyle(color: Colors.black54), // Define a cor do texto como um tom de cinza claro
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre o link "Esqueci a senha" e o texto informativo

              // Texto informativo sobre criação de conta
              const Text("Não tem uma conta no APP? É GRÁTIS"), // Texto simples informando sobre a criação gratuita de uma conta

              const SizedBox(height: 10), // Espaçamento entre o texto informativo e o botão de criar conta

              // Botão "Crie sua conta aqui" para redirecionar para a tela de cadastro
              SizedBox(
                width: 250, // Define a largura do botão de criar conta
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup'); // Navega para a tela de cadastro quando o botão é pressionado
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Define a cor do fundo do botão como laranja
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Ajusta o espaçamento interno do botão, aumentando a altura do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Define as bordas do botão arredondadas
                    ),
                  ),
                  child: const Text(
                    'Crie sua conta aqui', // Texto que aparece no botão
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte do texto no botão
                      color: Colors.black, // Cor do texto no botão definida como preto
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
