import 'package:flutter/material.dart';
import 'package:flutterform/model/login_model.dart';

import 'fetch_data_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  // GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel requestModel;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    requestModel = LoginRequestModel();
  }

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
                    onSaved: (input) => requestModel.name = input,
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
                    onSaved: (input) => requestModel.email = input,
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
                    onSaved: (input) => requestModel.password = input,
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
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    if (validateAndSave()) {
                      print(requestModel.toJson());
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Text(
                      'FETCHING',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
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
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}
