import 'package:flutter/material.dart';

class EnterPage extends StatelessWidget {
  final Map user;
  const EnterPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff181818),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(user['picture']['large']),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user['name']['first'], style: const TextStyle(fontSize: 20)),
               const Text(' '),
                Text(user['name']['last'], style: const TextStyle(fontSize: 20)),
              ],
            ),
            Text(user['dob']["age"].toString(),
                style: const TextStyle(fontSize: 20)),
            Text(user['location']['country']),
          ],
        ),
      ),
    );
  }
}
