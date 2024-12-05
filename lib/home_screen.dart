import 'package:ajs/login_screen.dart'; // Tela de login
import 'package:ajs/somos_screen.dart'; // Tela "Quem Somos"
import 'package:flutter/material.dart'; // Widgets e temas do Flutter
import 'package:url_launcher/url_launcher.dart'; // Abrir URLs externas
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase para autenticação

// Tela principal do aplicativo
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Função para abrir o link do Instagram usando o navegador padrão
  Future<void> _abrirInstagram(BuildContext context) async {
    const String url = 'https://www.instagram.com/ajoinvilleskate?igsh=MW1kNTFmb2xlcGtteQ==';

    try {
      final uri = Uri.parse(url); // Converte a URL para um objeto Uri
      if (await canLaunchUrl(uri)) {
        // Verifica se o link pode ser aberto
        await launchUrl(uri, mode: LaunchMode.externalApplication); // Abre o link no navegador
      } else {
        // Caso não seja possível abrir, exibe mensagem de erro
        _mostrarMensagemErro(context, 'Não foi possível abrir o Instagram. Verifique se há um navegador instalado.');
      }
    } catch (e) {
      // Captura erros e exibe mensagem correspondente
      _mostrarMensagemErro(context, 'Erro ao tentar abrir o Instagram: $e');
    }
  }

  // Exibe mensagens de erro utilizando um Snackbar
  void _mostrarMensagemErro(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem), // Mensagem exibida no Snackbar
        duration: const Duration(seconds: 3), // Duração da exibição
      ),
    );
  }

  // Função para realizar o logout do usuário
  Future<void> _logout(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signOut(); // Desconecta o usuário autenticado
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()), // Redireciona para a tela de login
        (route) => false,
      );
    } catch (e) {
      // Exibe erro caso o logout falhe
      _mostrarMensagemErro(context, 'Erro ao sair: $e');
    }
  }

  // Verifica se o usuário está logado ao clicar no ícone de perfil
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser; // Obtém o usuário atual

    if (user != null) {
      // Caso o usuário esteja autenticado, exibe uma mensagem
      _mostrarMensagemErro(context, 'Você já está logado.');
    } else {
      // Redireciona para a tela de login se não houver usuário autenticado
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar na parte superior da tela
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Cor de fundo da AppBar
        elevation: 0, // Remove a sombra da AppBar
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black), // Ícone do menu lateral
              onPressed: () => Scaffold.of(context).openDrawer(), // Abre o menu lateral
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black), // Ícone de perfil
            onPressed: () => _onProfileIconPressed(context), // Verifica o estado do usuário
          ),
        ],
      ),
      // Menu lateral (Drawer)
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Fundo branco com opacidade
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0), // Bordas arredondadas superiores
              bottomRight: Radius.circular(16.0), // Bordas arredondadas inferiores
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Cabeçalho do Drawer
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[800]!, // Gradiente escuro
                      Colors.grey[500]! // Gradiente claro
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logoNormal.png'), // Logo da aplicação
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              // Opção "Quem somos"
              ListTile(
                leading: const Icon(Icons.info, color: Color.fromARGB(172, 189, 189, 189)), // Ícone de informação
                title: const Text(
                  'Quem somos',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  // Redireciona para a tela "Quem Somos"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SomosScreen()),
                  );
                },
              ),
              // Opção para abrir o Instagram
              ListTile(
                leading: const Icon(Icons.camera, color: Color.fromARGB(172, 189, 189, 189)), // Ícone do Instagram
                title: const Text(
                  'Instagram',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Fecha o Drawer
                  _abrirInstagram(context); // Abre o link do Instagram
                },
              ),
              // Opção para logout
              ListTile(
                leading: const Icon(Icons.logout, color: Color.fromARGB(172, 189, 189, 189)), // Ícone de logout
                title: const Text(
                  'Sair',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () => _logout(context), // Realiza o logout
              ),
            ],
          ),
        ),
      ),
      // Corpo principal da tela
      body: SingleChildScrollView(
        // Permite rolar o conteúdo
        child: Column(
          children: [
            const SizedBox(height: 20), // Espaçamento superior
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Adiciona borda ao campo
                  labelText: 'Pesquise aqui seu evento', // Placeholder do campo
                  suffixIcon: Icon(Icons.search), // Ícone de busca
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento
            // Exibição da primeira imagem
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/imageEvento3.png'),
                  fit: BoxFit.cover, // Ajusta a imagem ao espaço do container
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre imagens
            // Exibição da segunda imagem
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/imageEvento2.png'),
                  fit: BoxFit.cover, // Ajusta a imagem ao espaço do container
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
