import 'package:ajs/login_screen.dart'; // Importa a tela de login
import 'package:ajs/somos_screen.dart'; // Importa a tela de "Quem Somos"
import 'package:flutter/material.dart'; //Importa o pacote principal do Flutter para construção da interface
import 'package:url_launcher/url_launcher.dart'; //Importa o pacote principal do Flutter para redirecionamento Instagram

// Classe principal da tela Home, usando StatelessWidget porque a tela não possui estado dinâmico
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Função assíncrona para abrir o link do Instagram no navegador
  Future<void> _abrirInstagram(BuildContext context) async {
    const String url =
        'https://www.instagram.com/ajoinvilleskate?igsh=MW1kNTFmb2xlcGtteQ=='; // URL do Instagram

    // Verifica se o link pode ser aberto em algum navegador disponível no dispositivo
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url)); // Abre o link no navegador padrão
    } else {
      // Exibe um Snackbar se não for possível abrir o link
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Não foi possível abrir o link do Instagram. Verifique se há um navegador disponível.'),
          duration: Duration(seconds: 3), // O Snackbar desaparece após 3 segundos
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
            // Botão de menu hambúrguer no AppBar para abrir o Drawer (menu lateral)
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: Colors.black), // Ícone de menu na cor preta
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o Drawer lateral
              },
            );
          },
        ),
        actions: [
          // Ícone de perfil no AppBar para navegação até a tela de login
          IconButton(
            icon: const Icon(Icons.person,
                color: Colors.black), // Ícone de perfil na cor preta
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen())); // Navega para a página de login
            },
          ),
        ],
      ),
      // Define o Drawer (menu lateral) da tela
      drawer: Drawer(
        // Envolve o Drawer em um Container para personalizar o estilo
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
                0.9), // Define uma cor branca com transparência para o Drawer
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ), // Define bordas arredondadas no lado direito do Drawer
          ),
          // Lista de opções no Drawer
          child: ListView(
            padding: EdgeInsets.zero, // Remove o padding padrão da lista
            children: [
              // Cabeçalho do Drawer com logo e espaço para uma mensagem de boas-vindas
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[800]!,
                      Colors.grey[500]!
                    ], // Define um gradiente de cinza escuro para cinza médio
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    // Logo circular no Drawer Header
                    const CircleAvatar(
                      radius: 30, // Define o tamanho da logo
                      backgroundImage: AssetImage(
                          'assets/images/logoNormal.png'), // Caminho para a logo
                    ),
                    const SizedBox(
                        width: 16), // Espaçamento entre a logo e o texto (comentado)
                  ],
                ),
              ),
              // Item de menu "Quem somos"
              ListTile(
                leading: const Icon(Icons.info,
                    color: Color.fromARGB(172, 189, 189, 189)), // Ícone na cor cinza
                title: const Text(
                  'Quem somos', // Texto do item do menu
                  style: TextStyle(
                      fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SomosScreen())); // Ação ao clicar no item "Quem somos"
                },
              ),
              // Item de menu para acessar o Instagram
              ListTile(
                leading: const Icon(Icons.camera,
                    color: Color.fromARGB(172, 189, 189, 189)), // Ícone na cor cinza
                title: const Text(
                  'Instagram', // Texto do item do menu
                  style: TextStyle(
                      fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Fecha o Drawer
                  _abrirInstagram(
                      context); // Chama a função para abrir o Instagram
                },
              ),
              // Item de menu para acessar a página de login
              ListTile(
                leading: const Icon(Icons.login,
                    color: Color.fromARGB(172, 189, 189, 189)), // Ícone na cor cinza
                title: const Text(
                  'Login', // Texto do item do menu
                  style: TextStyle(
                      fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen())); // Navega para a página de login
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
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Espaçamento horizontal para o campo de busca
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Adiciona uma borda ao redor do campo de busca
                labelText: 'Pesquise aqui seu evento', // Rótulo do campo de busca
                suffixIcon: Icon(Icons.search), // Ícone de busca no lado direito
              ),
            ),
          ),
          const SizedBox(height: 20), // Espaçamento entre o campo de busca e o próximo conteúdo
          // Placeholder para exibição da imagem de um evento
          Container(
            height: 300, // Define a altura do espaço reservado para a imagem do evento
            width: double.infinity, // A largura ocupa todo o espaço disponível na tela
            color: Colors.grey[300], // Cor de fundo cinza claro para o placeholder
            child: Stack(
              children: [
                // Imagem de fundo para representar um evento
                Image.asset(
                  'assets/images/imageEvento2.png', // Caminho da imagem nos assets
                  width: double.infinity, // Largura da imagem
                  height: 300, // Altura da imagem
                  fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço sem distorção
                ),
                // Texto sobre a imagem
                const Center(
                  child: Text(
                    'Imagem do Evento', // Texto temporário que será substituído pela imagem
                    style: TextStyle(
                      color: Colors.black, // Cor do texto
                      fontSize: 18, // Tamanho da fonte do texto
                      fontWeight: FontWeight.bold, // Texto em negrito
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
