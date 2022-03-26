import 'package:flutter/material.dart';
import 'package:flutter_provider_example/controller/provider_controller.dart';
import 'package:flutter_provider_example/model/user/user_model.dart';
import 'package:flutter_provider_example/pages/change_notifier/change_notifier_page.dart';
import 'package:flutter_provider_example/pages/provider/provider_page.dart';
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
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: 'Jonatas Santos',
              imgAvatar: 'https://i.redd.it/59msr0yi6ag41.jpg',
              birthDate: '16/05/1992',
            );
          },
        ),
        ChangeNotifierProvider(create: (_) => ProviderController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/changeNotifierPage': (_) => const ChangeNotifierPage(),
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
                    child: const Text('Provider'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/changeNotifierPage');
                    },
                    child: const Text('Change Notifier'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
