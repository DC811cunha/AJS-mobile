import 'package:ajs/login_screen.dart'; // Tela de login
import 'package:ajs/somos_screen.dart'; // Tela "Quem Somos"
import 'package:flutter/material.dart'; // Widgets e temas do Flutter
import 'package:url_launcher/url_launcher.dart'; // Abrir URLs externas
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase para autenticação

// Tela principal do aplicativo
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Função assíncrona para abrir o link do Instagram
  Future<void> _abrirInstagram(BuildContext context) async {
    const String url = 'https://www.instagram.com/ajoinvilleskate?igsh=MW1kNTFmb2xlcGtteQ==';

    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _mostrarMensagemErro(context, 'Não foi possível abrir o Instagram. Verifique se há um navegador instalado.');
      }
    } catch (e) {
      _mostrarMensagemErro(context, 'Erro ao tentar abrir o Instagram: $e');
    }
  }

  // Exibe mensagens de erro usando Snackbar
  void _mostrarMensagemErro(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Função para logout do usuário
  Future<void> _logout(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signOut(); // Desconecta o usuário
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      _mostrarMensagemErro(context, 'Erro ao sair: $e');
    }
  }

  // Função para validar usuário logado ao clicar no ícone de perfil
  void _onProfileIconPressed(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      _mostrarMensagemErro(context, 'Você já está logado.');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () => _onProfileIconPressed(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[800]!,
                      Colors.grey[500]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logoNormal.png'),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Color.fromARGB(172, 189, 189, 189)),
                title: const Text(
                  'Quem somos',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SomosScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera, color: Color.fromARGB(172, 189, 189, 189)),
                title: const Text(
                  'Instagram',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _abrirInstagram(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Color.fromARGB(172, 189, 189, 189)),
                title: const Text(
                  'Sair',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pesquise aqui seu evento',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/imageEvento3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre as imagens
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/imageEvento2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
