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
        // Use um Container para envolver o Drawer e adicionar estilo
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Cor com transparência
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ), // Bordas arredondadas na direita
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Melhorando o Drawer Header
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey[800]!, Colors.grey[500]!], // Gradiente de cinza escuro a médio
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/images/logoNormal.png'), // Substitua pelo caminho da sua logo
                    ),
                    const SizedBox(width: 16),
                    /*const Text(
                      'Bem-vindo!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                  ],
                ),
              ),
              // ListTile com ícone personalizado e título estilizado
              ListTile(
                leading: const Icon(Icons.info, color: Color.fromARGB(172, 189, 189, 189)),
                title: const Text(
                  'Quem somos',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  // Ação para navegar à página "Quem somos"
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera, color: Color.fromARGB(172, 189, 189, 189)),
                title: const Text(
                  'Instagram',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pop(); // Fecha o Drawer antes de abrir o link
                  _abrirInstagram(context); // Passa o contexto do Scaffold
                },
              ),
              ListTile(
                leading: const Icon(Icons.login, color: Color.fromARGB(172, 189, 189, 189)),
                title: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
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
