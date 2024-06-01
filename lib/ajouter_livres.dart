import 'package:flutter/material.dart';
import 'book.dart';

class AddBookScreen extends StatefulWidget {
  final Function(Book) onBookAdded;

  const AddBookScreen({Key? key, required this.onBookAdded}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _author;
  late String _description;
  late String _coverUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajouter un livre'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextFormField(
    decoration: InputDecoration(labelText: 'Titre'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez saisir le titre';
    }
    return null;
    },
    onSaved: (value) => _title = value ?? '',
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Auteur'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez saisir l\'auteur';
    }
    return null;
    },
    onSaved: (value) => _author = value ?? '',
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Description'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez saisir la description';
    }
    return null;
    },
    onSaved: (value) => _description = value ?? '',
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'URL de l\'image de couverture'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez saisir l\'URL de l\'image de couverture';
    }
    return null;
    },
    onSaved: (value) => _coverUrl = value ?? '',
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed:() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Book newBook = Book(
          title: _title,
          author: _author,
          coverUrl: _coverUrl,
        );
        widget.onBookAdded(newBook); // Appeler la fonction de rappel pour ajouter le nouveau livre
        Navigator.pop(context); // Retourner à l'écran précédent
      }
    },
      child: Text('Ajouter'),
    ),
    ],
    ),
    ),
        ),
    );
  }
}

