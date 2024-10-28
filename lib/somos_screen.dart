import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/login_screen.dart'; // Importa a tela de login
import 'package:flutter/material.dart'; // Importa o pacote Flutter para construção de interfaces

// Classe principal da tela "Quem Somos", usando StatelessWidget, pois a tela não possui estado dinâmico
class SomosScreen extends StatelessWidget {
  const SomosScreen({Key? key}) : super(key: key);

  // Método build é responsável por construir a interface da tela "Quem Somos"
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AJS Skate', // Define o título da aplicação
      debugShowCheckedModeBanner: false, // Remove o banner de depuração
      theme: ThemeData(
        primarySwatch: Colors.grey, // Define uma paleta de cores em tons de cinza
      ),
      home: SkateScreen(), // Define a tela inicial do aplicativo como SkateScreen
    );
  }
}

// Classe que constrói a tela de detalhes sobre o skate
class SkateScreen extends StatelessWidget {
  // Método build é responsável por construir a interface da tela Skate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornece a estrutura básica da tela, incluindo AppBar e corpo
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Cor de fundo da AppBar em cinza claro
        elevation: 0, // Remove a sombra padrão da AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Ícone de voltar na cor preta
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const HomeScreen()), // Redireciona para a tela Home ao pressionar o botão voltar
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black), // Ícone de perfil na cor preta
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen())); // Redireciona para a tela de login ao pressionar o ícone de perfil
            },
          ),
        ],
      ),
      // Corpo principal da tela
      body: SingleChildScrollView(
        // Permite rolar o conteúdo se ele for maior que o espaço disponível
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Define um espaçamento de 16 pixels ao redor do conteúdo
          child: Column(
            // Organiza os widgets verticalmente
            children: [
              // Exibe a logo circular centralizada
              Center(
                child: ClipOval(
                  // Deixa a imagem em formato oval (circular)
                  child: Image.asset(
                    'assets/images/logoNormal.png', // Caminho para a imagem da logo nos assets
                    height: 200, // Define a altura da imagem
                    width: 200, // Define a largura da imagem (mantém a proporção circular)
                    fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço sem distorção
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre a logo e o próximo widget

              // Texto descritivo sobre o skate
              const Text(
                'O skate é mais do que um simples esporte, é uma forma de vida. Com sua fusão de arte, '
                'adrenalina e comunidade, ele transcende o asfalto para se tornar uma expressão de liberdade sobre rodas. '
                'Cada manobra é uma dança entre o corpo e a prancha, uma busca incessante pela superação dos próprios limites.\n\n'
                'Nas ruas da cidade ou nas pistas dos parques, o skate é uma paixão que une pessoas de todas as idades e origens. '
                'É um espaço onde a criatividade floresce e as barreiras desaparecem. Aqui, skatistas novatos aprendem com os mais '
                'experientes, compartilhando dicas e truques enquanto se ajudam mutuamente a evoluir.',
                style: TextStyle(
                  fontSize: 16, // Tamanho da fonte
                  height: 1.5, // Altura da linha (espaçamento entre as linhas)
                  color: Colors.black, // Cor do texto
                ),
                textAlign: TextAlign.center, // Centraliza o texto horizontalmente
              ),
            ],
          ),
        ),
      ),
    );
  }
}
