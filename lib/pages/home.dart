import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:neobis_project_http/models/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var jsonList;

  late User user;

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
        print(response.data);

        setState(() {
          user = User.fromJson(response.data);
          //jsonList = response.data[''] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getDate() async {
  //    final dio = Dio(BaseOptions(
  //     baseUrl: 'https://jsonplaceholder.typicode.com',
  //     connectTimeout: 5000,
  //     receiveTimeout: 3000,
  //     headers: {'Authorization': 'Bearer 123456'},
  //     contentType: 'application/json',
  //   ));
  // try {
  //     response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
  //     if (response.statusCode == 200) {
  //       print(response.data);

  //       setState(() {
  //         user = User.fromJson(response.data);
  //         //jsonList = response.data[''] as List;
  //       });
  //     } else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          //padding: EdgeInsets.all(8),

          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                    'id is ${user.id} userId is ${user.userId}  / title is ${user.title}'),
                subtitle: Text('body is ${user.body}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
