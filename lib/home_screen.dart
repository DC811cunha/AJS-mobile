import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();  // Abre o Drawer quando o ícone de menu é pressionado
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/');// Ação para o ícone de usuário
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Quem somos'),
              onTap: () {
                // Ação para navegar à página "Quem somos"
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Instagram'),
              onTap: () {
                // Ação para navegar ao Instagram
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/');// Ação para navegar à página de login
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pesquise aqui seu evento',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[300], // Placeholder para a imagem do evento
            child: Center(
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