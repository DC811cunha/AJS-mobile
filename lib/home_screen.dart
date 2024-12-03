import 'package:ajs/login_screen.dart'; // Importa a tela de login
import 'package:ajs/somos_screen.dart'; // Importa a tela "Quem somos"
import 'package:flutter/material.dart'; // Importa widgets e temas do Flutter
import 'package:url_launcher/url_launcher.dart'; // Importa funções para abrir URLs
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase para autenticação

// Classe principal da tela Home, utilizando StatelessWidget porque não há estado dinâmico
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Função assíncrona para abrir o link do Instagram no navegador
  Future<void> _abrirInstagram(BuildContext context) async {
    const String url =
        'https://www.instagram.com/ajoinvilleskate?igsh=MW1kNTFmb2xlcGtteQ=='; // URL do Instagram

    try {
      final uri = Uri.parse(url); // Converte a string para um objeto Uri
      if (await canLaunchUrl(uri)) {
        // Verifica se o URL pode ser aberto
        await launchUrl(uri,
            mode: LaunchMode.externalApplication); // Abre o URL no navegador externo
      } else {
        // Mostra mensagem de erro se não for possível abrir
        _mostrarMensagemErro(
            context, 'Não foi possível abrir o Instagram. Verifique se há um navegador instalado.');
      }
    } catch (e) {
      // Trata exceções e exibe mensagem de erro
      _mostrarMensagemErro(
          context, 'Erro ao tentar abrir o Instagram: ${e.toString()}');
    }
  }

  // Função para exibir mensagem de erro usando um SnackBar
  void _mostrarMensagemErro(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem), // Mensagem exibida
        duration: const Duration(seconds: 3), // Duração do SnackBar
      ),
    );
  }

  // Função para lidar com o logout
  Future<void> _logout(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signOut(); // Realiza o logout no Supabase
      // Redireciona para a tela de login após o logout
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      // Exibe mensagem de erro em caso de falha no logout
      _mostrarMensagemErro(context, 'Erro ao sair: ${e.toString()}');
    }
  }

  // Função para redirecionar com validação do usuário logado
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser; // Obtém o usuário atual

    if (user != null) {
      // Caso o usuário esteja autenticado, permanece na tela atual
      _mostrarMensagemErro(context, 'Você já está logado.');
    } else {
      // Caso contrário, navegue para a tela de login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a estrutura principal da tela
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Cor de fundo do AppBar
        elevation: 0, // Remove a sombra do AppBar
        leading: Builder(
          builder: (context) {
            // Botão de menu hambúrguer para abrir o Drawer
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: Colors.black), // Ícone do menu em preto
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o menu lateral
              },
            );
          },
        ),
        actions: [
          // Ícone de perfil no AppBar
          IconButton(
            icon: const Icon(Icons.person,
                color: Colors.black), // Ícone de perfil em preto
            onPressed: () => _onProfileIconPressed(context), // Validação e navegação condicional
          ),
        ],
      ),
      drawer: Drawer(
        // Define o menu lateral da tela
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Fundo branco com transparência
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0), // Bordas arredondadas no topo direito
              bottomRight: Radius.circular(16.0), // Bordas arredondadas na parte inferior direita
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero, // Remove padding padrão
            children: [
              // Cabeçalho do Drawer com gradiente e logo
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[800]!, // Gradiente cinza escuro
                      Colors.grey[500]! // Gradiente cinza médio
                    ],
                    begin: Alignment.topLeft, // Início do gradiente
                    end: Alignment.bottomRight, // Fim do gradiente
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30, // Define o tamanho da logo
                      backgroundImage:
                          AssetImage('assets/images/logoNormal.png'), // Caminho para a imagem da logo
                    ),
                    const SizedBox(width: 16), // Espaçamento entre logo e texto
                  ],
                ),
              ),
              // Opção do menu: "Quem somos"
              ListTile(
                leading: const Icon(Icons.info,
                    color: Color.fromARGB(172, 189, 189, 189)), // Ícone cinza
                title: const Text(
                  'Quem somos',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SomosScreen())); // Navega para a tela "Quem somos"
                },
              ),
              // Opção do menu: Instagram
              ListTile(
                leading: const Icon(Icons.camera,
                    color: Color.fromARGB(172, 189, 189, 189)), // Ícone cinza
                title: const Text(
                  'Instagram',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Fecha o Drawer
                  _abrirInstagram(context); // Abre o Instagram
                },
              ),
              // Opção do menu: Logout
              ListTile(
                leading: const Icon(Icons.logout,
                    color: Color.fromARGB(172, 189, 189, 189)), // Ícone de logout
                title: const Text(
                  'Sair',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black87), // Estilo do texto
                ),
                onTap: () => _logout(context), // Executa o logout
              ),
            ],
          ),
        ),
      ),
      // Conteúdo principal da tela
      body: Column(
        children: [
          const SizedBox(height: 20), // Espaçamento superior
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espaçamento lateral
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Adiciona borda ao campo de texto
                labelText: 'Pesquise aqui seu evento', // Texto de instrução
                suffixIcon: Icon(Icons.search), // Ícone de busca
              ),
            ),
          ),
          const SizedBox(height: 20), // Espaçamento entre elementos
          // Container para imagem de evento (placeholder)
          Container(
            height: 300, // Altura do container
            width: double.infinity, // Largura total da tela
            color: Colors.grey[300], // Cor de fundo cinza claro
            child: const Center(
              child: Text(
                'Imagem do Evento', // Texto exibido como placeholder
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
