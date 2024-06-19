import 'package:flutter/material.dart';
import 'package:space_shoooter/space_shooter/View/space_shooter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game with Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('''Let's play Game!!!'''),
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              _NavigationButton(),
              _NavigationButton(),
              _NavigationButton(),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpaceShooter()),
          );
        },
        child: Text('Space Shooter 🔥🚀🚀🚀'));
  }
}
