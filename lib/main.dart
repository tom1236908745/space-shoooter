import 'package:flutter/material.dart';
import 'package:space_shoooter/ember_quest_game/View/ember_quest.dart';
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
              _NavigationButton(
                  name: '''Space Shooter 🔥🚀🚀🚀''',
                  navigateFunc: SpaceShooter()),
              _NavigationButton(
                  name: '''Ember Quest 🍎🌿🌋🧌''', navigateFunc: EmberQuest()),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  _NavigationButton({
    required String name,
    required Widget navigateFunc,
  })  : _name = name,
        _navigateFunc = navigateFunc;

  final String _name;
  final Widget _navigateFunc;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _navigateFunc),
          );
        },
        child: Text(_name));
  }
}
