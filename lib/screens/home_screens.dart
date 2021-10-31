import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterForm"),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Hello there !\n Welcome back',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Masukan Nama Penuh',
                        labelText: 'Name',
                        icon: const Icon(Icons.people),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: _validationName),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'john@mail...eg,.',
                        labelText: 'Email',
                        icon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: _validationEmail),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        icon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: _validationPassword),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Login successfully');
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? _validationName(value) {
  if (value!.isEmpty) {
    return 'Invalid Name';
  }
  return null;
}

String? _validationEmail(value) {
  if (value!.isEmpty) {
    return 'Invalid Email';
  }
  return null;
}

String? _validationPassword(value) {
  if (value.length<6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}
