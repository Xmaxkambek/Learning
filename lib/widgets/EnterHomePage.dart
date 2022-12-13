import 'package:flutter/material.dart';

class EnterPage extends StatelessWidget {
  final Map user;
  const EnterPage({super.key, required this.user});

  Widget con(double height,Text text,) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: text,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff181818),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(user['picture']['large']),
            con(
               50,
                Text(user['name']['last'] + "  " + user['name']['first'],
                    style: const TextStyle(fontSize: 15))),
            con(50, Text(user['dob']["age"].toString()),),
            con(50, Text(user['location']['country'])),
          ],
        ),
      ),
    );
  }
}
