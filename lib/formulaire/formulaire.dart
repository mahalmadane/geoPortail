import 'package:flutter/material.dart';

void main() {
  runApp(const Formulaire());
}

class Formulaire extends StatelessWidget {
  const Formulaire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Formulaire")),
        body: const MyForm(), // doit être un widget avec un State associé
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

// ✅ Le State associé
class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController num = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Un peu d'espace
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nom,
              decoration: const InputDecoration(
                labelText: "Nom",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un nom';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un email';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
            ),
            TextFormField(
              style: const TextStyle(fontSize: 20),
              controller: num,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: "Numéro de téléphone",
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un numéro de téléphone';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Valider le formulaire
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Formulaire valide !')),
                      );
                    }
                  },
                  child: const Text('Valider'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Réinitialiser le formulaire
                    _formKey.currentState!.reset();
                  },
                  child: const Text('Réinitialiser'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Nom: ${nom.text}'),
            Text('Email: ${email.text}'),
            Text('Numéro de téléphone: ${num.text}'),
          ],
        ),
      ),
    );
  }
}
