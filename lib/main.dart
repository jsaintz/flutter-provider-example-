import 'package:flutter/material.dart';
import 'package:flutter_provider_example/model/user_model.dart';
import 'package:flutter_provider_example/provider/provider_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        return UserModel(
          name: 'Jonatas Santos',
          imgAvatar:
              'https://www.shutterstock.com/image-photo/fitness-woman-jumping-outdoor-urban-environment-1080117269',
          birthDate: '16/05/1992',
        );
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
        },
        home: Builder(builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: const Text('Provider')),
                  ElevatedButton(onPressed: () {}, child: const Text('Change Notifier'))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
