import 'package:flutter/material.dart';
import 'package:flutter_provider_example/controller/provider_controller.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      context.read<ProviderController>().changeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Notifier')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ProviderController>(builder: (_, controller, __) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(controller.imgAvatar),
                  minRadius: 80,
                );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ProviderController>(builder: (_, controller, __) {
                    return Text(controller.name);
                  }),
                  Consumer<ProviderController>(builder: (_, controller, __) {
                    return Text('(${controller.birthDate})');
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
