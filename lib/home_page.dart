import 'package:flutter/material.dart';
import 'package:hello_world_flutter/app_controller.dart';
import 'package:hello_world_flutter/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network('https://github.com/jrbytes.png'),
              ),
              accountName: const Text('Itamar Junior'),
              accountEmail: const Text('jr@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('INÍCIO'),
              subtitle: const Text('Tela de início'),
              onTap: () {
                print('Home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('SAIR'),
              subtitle: const Text('Finalizar aplicação'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Página Inicial'),
        actions: [
          CustomSwitch(),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSwitch(),
            Center(
              child: GestureDetector(
                child: Text('Contador: $counter',
                    style: const TextStyle(fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
