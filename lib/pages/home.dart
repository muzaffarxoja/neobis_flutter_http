import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:neobis_project_http/models/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User user;
  late List<User> users;

  @override
  void initState() {
    super.initState();
    getDate();
  }

  //static
  void getDate() async {
    final Response response;

    try {
      response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        users = (json.decode(response.data) as List)
            .map((i) => User.fromJson(i))
            .toList();

        setState(() {
          user = User.fromJson(response.data);
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                    'id is ${users[index].id} userId is ${users[index].userId}  / title is ${users[index].title}'),
                subtitle: Text('body is ${users[index].body}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
