import 'package:flutter/material.dart'; //Importa o pacote principal do Flutter para construção da interface
import 'package:ajs/home_screen.dart'; // Importa a tela inicial do aplicativo
import 'package:ajs/signup_screen.dart'; // Importa a tela de cadastro

// Tela de login principal, utilizando StatelessWidget pois o conteúdo não é mutável
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // O método build é responsável por construir a interface da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define o Scaffold, estrutura básica para a organização da tela em Flutter
      backgroundColor: const Color.fromARGB(172, 189, 189,
          189), // Define a cor de fundo como cinza claro com opacidade

      // Corpo principal da tela
      body: Center(
        // Centraliza o conteúdo principal da tela
        child: SingleChildScrollView(
          // Permite rolar o conteúdo, útil quando o teclado é exibido ou a tela é pequena
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0), // Define o espaçamento horizontal nas laterais
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Alinha os itens verticalmente ao centro
            children: [
              // Espaço reservado para a exibição da logo redonda
              SizedBox(
                height: 150, // Altura reservada para a logo
                child: Center(
                  // Centraliza a logo dentro do espaço reservado
                  child: ClipOval(
                    // Garante que a imagem da logo seja exibida de forma circular
                    child: Image.asset(
                      'assets/images/logoNormal.png', // Caminho da imagem da logo nos assets
                      height: 150, // Define a altura da imagem da logo
                      width:
                          150, // Define a largura da imagem para manter a proporção circular
                      fit: BoxFit
                          .cover, // Ajusta a imagem para cobrir todo o espaço sem distorção
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 40), // Espaçamento entre a logo e o próximo elemento

              // Campo de entrada para o e-mail do usuário
              const TextField(
                decoration: InputDecoration(
                  labelText:
                      'E-MAIL', // Rótulo que indica que o campo é para o e-mail
                  border:
                      OutlineInputBorder(), // Adiciona uma borda ao redor do campo
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors
                      .white, // Define a cor de fundo do campo como branco
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o campo de e-mail e o campo de senha

              // Campo de entrada para a senha do usuário
              const TextField(
                obscureText:
                    true, // Oculta o texto digitado para proteger a senha
                decoration: InputDecoration(
                  labelText:
                      'PASSWORD', // Rótulo que indica que o campo é para a senha
                  border:
                      OutlineInputBorder(), // Adiciona uma borda ao redor do campo
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors
                      .white, // Define a cor de fundo do campo como branco
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o campo de senha e o botão de login

              // Botão de login para enviar as informações de autenticação
              SizedBox(
                width: 250, // Largura do botão de login
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen())); // Navega para a tela principal ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Define a cor de fundo do botão como azul
                    padding: const EdgeInsets.symmetric(
                        vertical:
                            12.0), // Ajusta o espaçamento interno para dar mais altura ao botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Define as bordas do botão como arredondadas
                    ),
                  ),
                  child: const Text(
                    'ENTRAR', // Texto do botão de login
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte do texto no botão
                      color: Colors
                          .black, // Cor do texto do botão definida como preto
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o botão de login e o link "Esqueci a senha"

              // Link para recuperação de senha
              TextButton(
                onPressed: () {
                  // Ação para recuperação de senha, pode ser adicionada posteriormente
                },
                child: const Text(
                  'Esqueci a senha', // Texto do botão de recuperação de senha
                  style: TextStyle(
                      color: Colors
                          .black54), // Cor do texto em um tom de cinza claro
                ),
              ),
              const SizedBox(
                  height:
                      10), // Espaçamento entre o link "Esqueci a senha" e o texto de criar conta

              // Texto informativo sobre a criação de uma conta
              const Text(
                  "Não tem uma conta no APP? É GRÁTIS"), // Texto informando que a conta pode ser criada gratuitamente

              const SizedBox(
                  height:
                      10), // Espaçamento entre o texto informativo e o botão de criar conta

              // Botão para redirecionar o usuário para a tela de criação de conta
              SizedBox(
                width: 250, // Largura do botão de criar conta
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CadastroScreen())); // Navega para a tela de cadastro ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .orange, // Define a cor do fundo do botão como laranja
                    padding: const EdgeInsets.symmetric(
                        vertical:
                            12.0), // Ajusta o espaçamento interno para aumentar a altura do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Define as bordas do botão como arredondadas
                    ),
                  ),
                  child: const Text(
                    'Crie sua conta aqui', // Texto exibido no botão de criar conta
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte do texto no botão
                      color: Colors
                          .black, // Cor do texto do botão definida como preto
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
