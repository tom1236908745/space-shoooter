import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:space_shoooter/ember_quest_game/ViewModel/ember_quest.dart';

class EmberQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GameWidget<EmberQuestGame>.controlled(
      gameFactory: EmberQuestGame.new,
    );
  }
}
