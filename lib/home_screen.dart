import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _abrirInstagram(BuildContext context) async {
    const url = 'https://www.instagram.com/ajoinvilleskate';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Não foi possível abrir o link do Instagram. Verifique se há um navegador disponível.'),
          duration: Duration(seconds: 3),
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
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[800]!, Colors.grey[500]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/logoNormal.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black54),
              title: const Text('Quem somos'),
              onTap: () => Navigator.pushNamed(context, '/somos'),
            ),
            ListTile(
              leading: const Icon(Icons.camera, color: Colors.black54),
              title: const Text('Instagram'),
              onTap: () {
                Navigator.of(context).pop();
                _abrirInstagram(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.black54),
              title: const Text('Login'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
          ],
        ),
      ),
      body: Column(
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
            color: Colors.grey[300],
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/imageEvento2.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const Center(
                  child: Text(
                    'Imagem do Evento',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
