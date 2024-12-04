<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 23f521ce005d434e774b12283b0c8d94b6585147
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
import 'package:ajs/home_screen.dart'; // Importa a tela principal (Home)
import 'package:ajs/login_screen.dart'; // Importa a tela de login
import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:supabase_flutter/supabase_flutter.dart'; // Importa o Supabase para autenticação
<<<<<<< HEAD
=======

// Classe principal da tela "Quem Somos", usando StatelessWidget porque não há estado dinâmico
class SomosScreen extends StatelessWidget {
  const SomosScreen({Key? key}) : super(key: key);

  // Método para redirecionar condicionalmente com base no estado do usuário
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser; // Verifica o usuário atual

    if (user != null) {
      // Se o usuário estiver autenticado, redireciona para a HomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Caso contrário, redireciona para a LoginScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AJS Skate', // Define o título do aplicativo
      debugShowCheckedModeBanner: false, // Remove o banner de depuração do canto superior direito
      theme: ThemeData(
        primarySwatch: Colors.grey, // Define o tema principal com uma paleta de cinza
      ),
      home: SkateScreen(), // Define SkateScreen como a tela inicial
    );
  }
}

// Tela principal da página Skate
class SkateScreen extends StatelessWidget {
  // Método para redirecionar condicionalmente com base no estado do usuário
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser; // Verifica o usuário atual

    if (user != null) {
      // Se o usuário estiver autenticado, redireciona para a HomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Caso contrário, redireciona para a LoginScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornece a estrutura básica da tela
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Define a cor de fundo da AppBar como cinza claro
        elevation: 0, // Remove a sombra padrão da AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Ícone de seta para voltar na cor preta
          onPressed: () {
            // Ação ao pressionar o botão
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(), // Redireciona para a tela principal (HomeScreen)
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,
                color: Colors.black), // Ícone de perfil na cor preta
            onPressed: () => _onProfileIconPressed(context), // Navegação condicional com base no usuário
          ),
        ],
      ),
      // Corpo principal da tela
      body: SingleChildScrollView(
        // Permite rolar o conteúdo caso exceda o espaço disponível na tela
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Define espaçamento ao redor do conteúdo
          child: Column(
            // Organiza os widgets verticalmente
            children: [
              // Exibição da logo
              Center(
                child: ClipOval(
                  // Torna a imagem circular
                  child: Image.asset(
                    'assets/images/logoNormal.png', // Caminho para a imagem
                    height: 200, // Define altura da imagem
                    width: 200, // Define largura da imagem
                    fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível
                  ),
                ),
              ),
              const SizedBox(height: 20), // Adiciona espaçamento vertical

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
=======
import 'package:flutter/material.dart';
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c

// Classe principal da tela "Quem Somos", usando StatelessWidget porque não há estado dinâmico
class SomosScreen extends StatelessWidget {
  const SomosScreen({Key? key}) : super(key: key);

  // Método para redirecionar condicionalmente com base no estado do usuário
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser; // Verifica o usuário atual

    if (user != null) {
      // Se o usuário estiver autenticado, redireciona para a HomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Caso contrário, redireciona para a LoginScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AJS Skate', // Define o título do aplicativo
      debugShowCheckedModeBanner: false, // Remove o banner de depuração do canto superior direito
      theme: ThemeData(
        primarySwatch: Colors.grey, // Define o tema principal com uma paleta de cinza
      ),
      home: SkateScreen(), // Define SkateScreen como a tela inicial
    );
  }
}

// Tela principal da página Skate
class SkateScreen extends StatelessWidget {
  // Método para redirecionar condicionalmente com base no estado do usuário
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser; // Verifica o usuário atual

    if (user != null) {
      // Se o usuário estiver autenticado, redireciona para a HomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Caso contrário, redireciona para a LoginScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornece a estrutura básica da tela
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Define a cor de fundo da AppBar como cinza claro
        elevation: 0, // Remove a sombra padrão da AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Ícone de seta para voltar na cor preta
          onPressed: () {
            // Ação ao pressionar o botão
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(), // Redireciona para a tela principal (HomeScreen)
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,
                color: Colors.black), // Ícone de perfil na cor preta
            onPressed: () => _onProfileIconPressed(context), // Navegação condicional com base no usuário
          ),
        ],
      ),
      // Corpo principal da tela
      body: SingleChildScrollView(
        // Permite rolar o conteúdo caso exceda o espaço disponível na tela
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Define espaçamento ao redor do conteúdo
          child: Column(
            // Organiza os widgets verticalmente
            children: [
              // Exibição da logo
              Center(
                child: ClipOval(
                  // Torna a imagem circular
                  child: Image.asset(
                    'assets/images/logoNormal.png', // Caminho para a imagem
                    height: 200, // Define altura da imagem
                    width: 200, // Define largura da imagem
                    fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível
                  ),
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20), // Adiciona espaçamento vertical

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
=======
            ),
            const SizedBox(height: 20),
            const Text(
              'O skate é mais do que um simples esporte, é uma forma de vida. Com sua fusão de arte, '
              'adrenalina e comunidade, ele transcende o asfalto para se tornar uma expressão de liberdade sobre rodas. '
              'Cada manobra é uma dança entre o corpo e a prancha, uma busca incessante pela superação dos próprios limites.\n\n'
              'Nas ruas da cidade ou nas pistas dos parques, o skate é uma paixão que une pessoas de todas as idades e origens. '
              'É um espaço onde a criatividade floresce e as barreiras desaparecem. Aqui, skatistas novatos aprendem com os mais '
              'experientes, compartilhando dicas e truques enquanto se ajudam mutuamente a evoluir.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
>>>>>>> 52288620acbf2d32eca7ecfe52327286122809cc
>>>>>>> 28406ce05fb7dff43a91b1fd6d9d286055fdd58c
        ),
      ),
    );
  }
}
