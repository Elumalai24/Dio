import 'package:flutter/material.dart';
import 'Service/api_service.dart';
import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersList(),
    );
  }
}

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  ApiService usersApi = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio ApiCall"),
      ),
      body: FutureBuilder<List<Users>>(
          future: usersApi.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Users> users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child:
                              Center(child: Text(users[index].id.toString()))),
                      title: Text(users[index].title.toString()));
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
