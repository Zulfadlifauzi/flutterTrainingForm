import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String? stringResponse;
Map? mapResponse;
List? listResponse;
class _HomePageState extends State<HomePage> {
  String url = 'https://reqres.in/api/users?page=2';
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['data'];
      });
    }
  }
  @override
  void initState() {
    apicall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GET Form'),
        ),
        body: ListView.builder(
          itemCount: listResponse == null ? 0 : listResponse!.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Image.network(listResponse![index]['avatar']),
                  Text(listResponse![index]['first_name']),
                  Text(listResponse![index]['last_name']),
                  Text(listResponse![index]['email']),
                ],
              ),
            );
          },
        ));
  }
}
