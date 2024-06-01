
import 'package:flutter/material.dart';
import 'ajouter_livres.dart';
import 'contact_page.dart';
import 'livres_page.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Page d'acceuil ",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),

                  Text(
                    'Ilham OULAKBIR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),

                  Text(
                    'Bibliothèque publique',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Livres"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  BookListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Adhérents"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Ajouter livre"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  AddBookScreen(onBookAdded: (Book ) {  },)),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/image_librery.jpg'),
              const SizedBox(height: 1),
              const Text(
                'Bienvenue à la Bibliothèque publique',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Notre bibliothèque offre une vaste collection de livres, magazines et ressources numériques pour tous les âges. Venez découvrir notre espace convivial et profitez de nos services variés pour enrichir vos connaissances et passer des moments agréables.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
//const Center(
//child: Text(
//"Home Page",
//style: TextStyle(fontSize: 25),
//),
//),