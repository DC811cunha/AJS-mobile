import 'package:flutter/material.dart'; // Importa o pacote necessário para criar interfaces no Flutter
import 'package:ajs/home_screen.dart'; // Importa a tela inicial do aplicativo

// Definição da tela de cadastro, utilizando StatelessWidget, pois a tela não depende de estados dinâmicos
class CadastroScreen extends StatelessWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  // O método build é responsável por construir a interface da tela de cadastro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornece a estrutura visual básica da tela
      backgroundColor: const Color.fromARGB(172, 189, 189,
          189), // Define a cor de fundo como cinza claro com transparência
      body: Center(
        // O conteúdo da tela será centralizado
        child: SingleChildScrollView(
          // Permite rolar o conteúdo caso o teclado apareça ou se o espaço não for suficiente
          padding: const EdgeInsets.symmetric(
              horizontal:
                  24.0), // Define o espaçamento horizontal (margens) nas laterais
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centraliza os elementos da coluna verticalmente
            children: [
              // Espaço reservado para a logo circular
              SizedBox(
                height: 150, // Define a altura reservada para a logo
                child: Center(
                  // Centraliza a logo dentro do espaço reservado
                  child: ClipOval(
                    // Deixa a imagem em formato oval
                    child: Image.asset(
                      'assets/images/logoNormal.png', // Caminho para a imagem da logo nos assets
                      height:
                          150, // Define a altura da imagem (igual à largura para manter a forma circular)
                      width: 150, // Define a largura da imagem
                      fit: BoxFit
                          .cover, // Ajusta a imagem para cobrir todo o espaço definido
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40), // Espaçamento após a logo

              // Campo de entrada para o nome completo
              const TextField(
                decoration: InputDecoration(
                  labelText: 'NOME COMPLETO', // Rótulo para o campo de nome
                  border:
                      OutlineInputBorder(), // Define uma borda ao redor do campo
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors.white, // Define a cor de fundo como branco
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o campo de nome e o próximo campo

              // Campo de entrada para o e-mail
              const TextField(
                keyboardType: TextInputType
                    .emailAddress, // Define o teclado adequado para entrada de e-mail
                decoration: InputDecoration(
                  labelText: 'E-MAIL', // Rótulo para o campo de e-mail
                  border:
                      OutlineInputBorder(), // Define uma borda ao redor do campo
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors.white, // Define a cor de fundo como branco
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o campo de e-mail e o próximo campo

              // Campo de entrada para a senha
              const TextField(
                obscureText: true, // O texto será oculto para proteger a senha
                decoration: InputDecoration(
                  labelText: 'SENHA', // Rótulo para o campo de senha
                  border:
                      OutlineInputBorder(), // Define uma borda ao redor do campo
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors.white, // Define a cor de fundo como branco
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o campo de senha e o próximo campo

              // Campo de entrada para confirmar a senha
              const TextField(
                obscureText: true, // O texto será oculto para proteger a senha
                decoration: InputDecoration(
                  labelText:
                      'CONFIRME SUA SENHA', // Rótulo para o campo de confirmação de senha
                  border:
                      OutlineInputBorder(), // Define uma borda ao redor do campo
                  filled: true, // Preenche o fundo do campo
                  fillColor: Colors.white, // Define a cor de fundo como branco
                ),
              ),
              const SizedBox(
                  height:
                      20), // Espaçamento entre o campo de confirmação de senha e o botão de cadastro

              // Botão de cadastrar
              SizedBox(
                width: 250, // Define a largura do botão de cadastro
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen())); // Navega para a tela inicial após o cadastro
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Define a cor do botão como azul
                    padding: const EdgeInsets.symmetric(
                        vertical:
                            12.0), // Define o padding vertical para ajustar a altura do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Define bordas arredondadas para o botão
                    ),
                  ),
                  child: const Text(
                    'CADASTRAR', // Texto que aparece no botão
                    style: TextStyle(
                      fontSize:
                          16, // Define o tamanho da fonte do texto no botão
                      color: Colors.black, // Define a cor do texto como preto
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Espaçamento após o botão de cadastro
            ],
          ),
        ),
      ),
    );
  }
}
