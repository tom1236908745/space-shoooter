import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:space_shoooter/space_shooter/ViewModel/space_shooter_game/space_shooter_game.dart';

class SpaceShooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: SpaceShooterGame());
  }
}
