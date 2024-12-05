import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/login_screen.dart'; // Importa a tela de login
import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter

// Classe principal da tela "Quem Somos", usando StatelessWidget porque não há estado dinâmico
class SomosScreen extends StatelessWidget {
  const SomosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornece a estrutura básica da tela
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Define a cor de fundo da AppBar como cinza claro
        elevation: 0, // Remove a sombra padrão da AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Ícone de seta para voltar
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()), // Redireciona para a HomeScreen
            );
          },
        ),
      ),
      // Corpo principal da tela
      body: SingleChildScrollView(
        // Permite rolar o conteúdo caso exceda o espaço disponível na tela
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Define espaçamento ao redor do conteúdo
          child: Column(
            children: [
              // Exibição da logo
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logoNormal.png', // Caminho para a imagem
                    height: 200, // Define altura da imagem
                    width: 200, // Define largura da imagem
                    fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento vertical

              // Texto descritivo sobre o skate
              const Text(
                'O skate é mais do que um simples esporte é uma forma de vida. Com sua fusão de arte, '
                'adrenalina e comunidade, ele transcende o asfalto para se tornar uma expressão de liberdade sobre rodas. '
                'Cada manobra é uma dança entre o corpo e a prancha, uma busca incessante pela superação dos próprios limites.\n\n'
                'Nas ruas da cidade ou nas pistas dos parques, o skate é uma paixão que une pessoas de todas as idades e origens. '
                'É um espaço onde a criatividade floresce e as barreiras desaparecem. Aqui, skatistas novatos aprendem com os mais '
                'experientes, compartilhando dicas e truques enquanto se ajudam mutuamente a evoluir.',
                style: TextStyle(
                  fontSize: 16, // Tamanho do texto
                  height: 1.5, // Altura da linha (espaçamento entre linhas)
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
