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
  bool _isChecked = false;
  bool _visible = true;
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
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: "Nom",
                prefixIcon: Icon(Icons.person),
              ),
              onSaved: (newValue) {
                setState(() {
                  nom.text = newValue!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un nom';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              onSaved: (newValue) {
                setState(() {
                  email.text = newValue!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un email';
                }
                if (!value.contains('@')) {
                  return 'Veuillez entrer un email valide';
                }
                if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value)) {
                  return null;
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                labelText: "Mot de passe",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  child: Icon(
                    _visible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                ),
              ),

              obscureText: _visible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(fontSize: 20),
              controller: num,
              keyboardType: TextInputType.phone,
              onSaved: (newValue) {
                setState(() {
                  num.text = newValue!;
                });
              },
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Checker pour valider le formulaire"),
                Checkbox(
                  value: _isChecked,

                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _isChecked
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Valider le formulaire
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Formulaire valide !'),
                            ),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Formulaire réinitialisé !'),
                          ),
                        );
                      },
                      child: const Text('Réinitialiser'),
                    ),
                  ],
                )
                : SizedBox(height: 0),

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
