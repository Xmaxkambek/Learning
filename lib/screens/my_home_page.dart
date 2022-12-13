import 'package:flutter/material.dart';
import 'package:learning/widgets/EnterHomePage.dart';
import '../services/service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff181818),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ));
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
        title: const Text('MyApplication'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center( 
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey, indent: 70),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(trailing: Icon(Icons.arrow_circle_down),
                  title: Text(snapshot.data[index]['name']['first']),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[index]['picture']['large'],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EnterPage(user: snapshot.data[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const Center(child: Text('No Internet'));
        },
      ),
    );
  }
}
