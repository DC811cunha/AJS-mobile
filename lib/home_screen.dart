import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Classe principal da tela Home, usando StatelessWidget pois não há estado dinâmico na tela
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Função assíncrona para abrir o link do Instagram no navegador
  Future<void> _abrirInstagram(BuildContext context) async {
    const String url =
        'https://www.instagram.com/ajoinvilleskate?igsh=MW1kNTFmb2xlcGtteQ=='; // URL do Instagram

    // Verifica se o link pode ser aberto por algum navegador disponível no dispositivo
    if (await canLaunch(url)) {
      await launch(url); // Abre o link no navegador
    } else {
      // Exibe um Snackbar se não for possível abrir o link
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Não foi possível abrir o link do Instagram. Verifique se há um navegador disponível.'),
          duration: Duration(seconds: 3), // O Snackbar dura 3 segundos
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura principal da tela Home
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Define a cor de fundo do AppBar
        elevation: 0, // Remove a sombra do AppBar
        leading: Builder(
          builder: (context) {
            // Botão de menu hambúrguer no AppBar para abrir o Drawer
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black), // Ícone de menu em preto
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o Drawer lateral
              },
            );
          },
        ),
        actions: [
          // Ícone de perfil no AppBar para navegação para a tela de login
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black), // Ícone de perfil em preto
            onPressed: () {
              Navigator.pushNamed(context, '/'); // Navega para a página de login
            },
          ),
        ],
      ),
      // Define o Drawer (menu lateral) da tela
      drawer: Drawer(
        // Envolve o Drawer em um Container para personalizar o estilo
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Define uma cor branca com transparência para o Drawer
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ), // Define bordas arredondadas no lado direito do Drawer
          ),
          // Lista de opções no Drawer
          child: ListView(
            padding: EdgeInsets.zero, // Remove qualquer padding adicional na lista
            children: [
              // Cabeçalho do Drawer com logo e possível mensagem de boas-vindas
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey[800]!, Colors.grey[500]!], // Define um gradiente de cinza escuro para cinza médio
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    // Logo circular dentro do Drawer Header
                    CircleAvatar(
                      radius: 30, // Tamanho da logo
                      backgroundImage: AssetImage('assets/images/logoNormal.png'), // Caminho para a logo
                    ),
                    const SizedBox(width: 16), // Espaçamento entre a logo e o possível texto
                    // Espaço para uma mensagem de boas-vindas (comentado no momento)
                  ],
                ),
              ),
              // ListTile que representa uma opção no menu "Quem somos"
              ListTile(
                leading: const Icon(Icons.info, color: Color.fromARGB(172, 189, 189, 189)), // Ícone cinza
                title: const Text(
                  'Quem somos', // Texto do item do menu
                  style: TextStyle(fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  // Ação a ser executada ao clicar no item "Quem somos"
                },
              ),
              // ListTile que representa uma opção para acessar o Instagram
              ListTile(
                leading: const Icon(Icons.camera, color: Color.fromARGB(172, 189, 189, 189)), // Ícone cinza
                title: const Text(
                  'Instagram', // Texto do item do menu
                  style: TextStyle(fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Fecha o Drawer
                  _abrirInstagram(context); // Abre o Instagram chamando a função _abrirInstagram
                },
              ),
              // ListTile que representa uma opção para acessar a página de login
              ListTile(
                leading: const Icon(Icons.login, color: Color.fromARGB(172, 189, 189, 189)), // Ícone cinza
                title: const Text(
                  'Login', // Texto do item do menu
                  style: TextStyle(fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/'); // Navega para a página de login
                },
              ),
            ],
          ),
        ),
      ),
      // Corpo principal da tela (conteúdo da Home)
      body: Column(
        children: [
          const SizedBox(height: 20), // Espaçamento no topo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Define o espaçamento horizontal para o campo de busca
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(), // Adiciona uma borda ao redor do campo de texto
                labelText: 'Pesquise aqui seu evento', // Rótulo do campo de busca
                suffixIcon: Icon(Icons.search), // Ícone de busca no lado direito do campo
              ),
            ),
          ),
          const SizedBox(height: 20), // Espaçamento entre o campo de busca e o conteúdo a seguir
          // Placeholder para a exibição de imagem de um evento
          Container(
            height: 300, // Altura do espaço reservado para a imagem do evento
            width: double.infinity, // Define a largura do container como o tamanho total da tela
            color: Colors.grey[300], // Define uma cor de fundo cinza claro para o placeholder
            child: const Center(
              child: Text(
                'Imagem do Evento', // Texto temporário que representa onde a imagem será exibida
                style: TextStyle(
                  color: Colors.black, // Cor do texto
                  fontSize: 18, // Tamanho da fonte do texto
                  fontWeight: FontWeight.bold, // Define o texto em negrito
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
