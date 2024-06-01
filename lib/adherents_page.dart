import 'package:flutter/material.dart';
import 'Adherent.dart';
import 'AdherentDetailScreen.dart'; // Importez l'écran d'affichage détaillé des adhérents

class AdList extends StatefulWidget {
  @override
  _AdListState createState() => _AdListState();
}

class _AdListState extends State<AdList> {
  final List<Adherent> ads = [
    Adherent(firstName: "Ilham", lastName: "OULAKBIR", age: 21),
    Adherent(firstName: "Ihsane", lastName: "OULAKBIR", age: 21),
  ];

  List<Adherent> filteredAds = []; // Liste des adhérents filtrés
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAds = ads; // Initialisez la liste filtrée avec tous les adhérents au début
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des adhérents'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Rechercher par nom',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                filterAds(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredAds.length,
              itemBuilder: (context, index) {
                final ad = filteredAds[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdherentDetailScreen(Adherent.dart), // Passer l'adhérent sélectionné à l'écran détaillé
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: Text(
                        ad.firstName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(ad.lastName),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour filtrer les adhérents en fonction de la recherche
  void filterAds(String query) {
    setState(() {
      filteredAds = ads.where((ad) => ad.firstName.toLowerCase().contains(query.toLowerCase()) || ad.lastName.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
}

class AdherentDetailScreen {
}
