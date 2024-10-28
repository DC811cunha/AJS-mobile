import 'package:ajs/home_screen.dart';
import 'package:ajs/login_screen.dart';
import 'package:flutter/material.dart';

// Classe principal da tela Quem Somos, usando StatelessWidget, pois não há estado dinâmico na tela
class SomosScreen extends StatelessWidget {
  const SomosScreen({Key? key}) : super(key: key);

  // Método build é responsável pela construção da interface da tela
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AJS Skate', // Define o título do aplicativo
      debugShowCheckedModeBanner: false, // Remove o banner de depuração da tela
      theme: ThemeData(
        primarySwatch: Colors
            .grey, // Define o tema principal do aplicativo com uma paleta de cinza
      ),
      home:
          SkateScreen(), // Define a tela inicial do aplicativo como SkateScreen
    );
  }
}

class SkateScreen extends StatelessWidget {
  // Método build é responsável pela construção da interface da tela Skate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold define a estrutura básica da tela com AppBar, corpo (body), etc.
      appBar: AppBar(
        backgroundColor: Colors.grey[
            300], // Define a cor de fundo da AppBar como um tom claro de cinza
        elevation: 0, // Remove a sombra padrão da AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors
                  .black), // Define um ícone de seta para a esquerda (voltar) na cor preta
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()), //-----Alteracao Funcionando redirecionamento-----Redireciona para página Home
            ); // Ao pressionar o botão, navega para a página principal (rota '/home')
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,
                color: Colors.black), // Ícone de perfil na cor preta
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen())); // Navega para a página de login ao pressionar o botão de perfil
            },
          ),
        ],
      ),
      // O corpo principal da tela
      body: SingleChildScrollView(
        // SingleChildScrollView permite que o conteúdo seja rolado caso exceda o espaço da tela
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Define o espaçamento de 16 pixels ao redor do conteúdo da tela
          child: Column(
            // Column organiza os widgets em uma coluna, um em cima do outro
            children: [
              // Exibição da logo circular centralizada
              Center(
                child: ClipOval(
                  // ClipOval transforma o widget filho (imagem) em uma forma oval (circular, se altura = largura)
                  child: Image.asset(
                    'assets/images/logoNormal.png', // Caminho para a imagem da logo dentro dos assets do projeto
                    height: 200, // Define a altura da imagem como 200 pixels
                    width:
                        200, // Define a largura da imagem como 200 pixels (forma circular)
                    fit: BoxFit
                        .cover, // Ajusta a imagem para cobrir o espaço, mantendo suas proporções
                  ),
                ),
              ),
              const SizedBox(
                  height:
                      20), // Adiciona um espaçamento vertical de 20 pixels entre a imagem e o próximo widget

              // Texto descritivo sobre o skate
              const Text(
                'O skate é mais do que um simples esporte é uma forma de vida. Com sua fusão de arte, '
                'adrenalina e comunidade, ele transcende o asfalto para se tornar uma expressão de liberdade sobre rodas. '
                'Cada manobra é uma dança entre o corpo e a prancha, uma busca incessante pela superação dos próprios limites.\n\n'
                'Nas ruas da cidade ou nas pistas dos parques, o skate é uma paixão que une pessoas de todas as idades e origens. '
                'É um espaço onde a criatividade floresce e as barreiras desaparecem. Aqui, skatistas novatos aprendem com os mais '
                'experientes, compartilhando dicas e truques enquanto se ajudam mutuamente a evoluir.',
                style: TextStyle(
                  fontSize: 16, // Define o tamanho da fonte como 16 pixels
                  height:
                      1.5, // Define a altura da linha do texto (espaçamento entre linhas) como 1.5 vezes o tamanho da fonte
                  color: Colors.black, // Define a cor do texto como preta
                ),
                textAlign: TextAlign
                    .center, // Centraliza o texto horizontalmente na tela
              ),
            ],
          ),
        ),
      ),
    );
  }
}
