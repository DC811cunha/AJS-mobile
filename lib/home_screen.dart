import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Função para abrir o link do Instagram
  Future<void> _abrirInstagram(BuildContext context) async {
    const String url =
        'https://www.instagram.com/ajoinvilleskate?igsh=MW1kNTFmb2xlcGtteQ==';

    // Verifica se o dispositivo pode abrir o link
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Usa o ScaffoldMessenger associado ao contexto do Scaffold
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Não foi possível abrir o link do Instagram. Verifique se há um navegador disponível.'),
          duration: Duration(seconds: 3), // Duração do Snackbar
        ),
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
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Quem somos'),
              onTap: () {
                // Ação para navegar à página "Quem somos"
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Instagram'),
              onTap: () {
                // Agora estamos usando o contexto correto para o Snackbar
                Navigator.of(context)
                    .pop(); // Fecha o Drawer antes de mostrar o Snackbar
                _abrirInstagram(context); // Passa o contexto do Scaffold
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: const InputDecoration(
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
            color: Colors.grey[300], // Placeholder para a imagem do evento
            child: const Center(
              child: Text(
                'Imagem do Evento',
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
