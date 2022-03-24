import 'package:flutter/material.dart';
import 'package:flutter_provider_example/model/user_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.imgAvatar),
              )
            ],
          ),
        ),
      ),
    );
  }
}
