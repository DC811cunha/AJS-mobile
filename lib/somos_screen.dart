import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/login_screen.dart'; // Importa a tela de login
import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter

// Classe responsável pela tela "Quem Somos". É um StatelessWidget porque não possui estado dinâmico.
class SomosScreen extends StatelessWidget {
  const SomosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura básica da tela utilizando Scaffold
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Define a cor de fundo do AppBar como cinza claro
        elevation: 0, // Remove a sombra padrão do AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Ícone de seta para voltar
          onPressed: () {
            // Ação ao pressionar o botão de voltar: redireciona para a tela principal (HomeScreen)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      // Corpo principal da tela
      body: SingleChildScrollView(
        // Permite que o conteúdo seja rolável caso ultrapasse a altura disponível na tela
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adiciona espaçamento ao redor do conteúdo
          child: Column(
            // Alinha os widgets de forma vertical
            children: [
              // Exibe a logo em formato circular
              Center(
                child: ClipOval(
                  // Torna a imagem circular
                  child: Image.asset(
                    'assets/images/logoNormal.png', // Caminho para a imagem da logo
                    height: 200, // Define a altura da imagem
                    width: 200, // Define a largura da imagem
                    fit: BoxFit.cover, // Ajusta a imagem para preencher o espaço disponível
                  ),
                ),
              ),
              const SizedBox(height: 20), // Adiciona espaçamento vertical após a logo

              // Texto descritivo sobre o skate
              const Text(
                'O skate é mais do que um simples esporte é uma forma de vida. Com sua fusão de arte, '
                'adrenalina e comunidade, ele transcende o asfalto para se tornar uma expressão de liberdade sobre rodas. '
                'Cada manobra é uma dança entre o corpo e a prancha, uma busca incessante pela superação dos próprios limites.\n\n'
                'Nas ruas da cidade ou nas pistas dos parques, o skate é uma paixão que une pessoas de todas as idades e origens. '
                'É um espaço onde a criatividade floresce e as barreiras desaparecem. Aqui, skatistas novatos aprendem com os mais '
                'experientes, compartilhando dicas e truques enquanto se ajudam mutuamente a evoluir.',
                style: TextStyle(
                  fontSize: 16, // Define o tamanho do texto
                  height: 1.5, // Define o espaçamento entre as linhas do texto
                  color: Colors.black, // Define a cor do texto
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
