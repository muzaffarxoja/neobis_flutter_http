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
  // late User user;
  List<User> users = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getDate();
  }

  //static
  void getDate() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      users =
          (response.data as List<dynamic>).map((i) => User.fromMap(i)).toList();

      setState(() {
        _isLoading = false;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        'id is ${users[index].id} userId is ${users[index].userId}  / title is ${users[index].title}',
                      ),
                      subtitle: Text('body is ${users[index].body}'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
