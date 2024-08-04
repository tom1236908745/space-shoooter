import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:space_shoooter/ember_quest_game/actor/ember.dart';
import 'package:space_shoooter/ember_quest_game/utils/formatImagePath.dart';

class EmberQuestGame extends FlameGame {
  late EmberPlayer _ember;

  EmberQuestGame();

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      formatImagePath('block.png'),
      formatImagePath('ember.png'),
      formatImagePath('ground.png'),
      formatImagePath('heart_half.png'),
      formatImagePath('heart.png'),
      formatImagePath('star.png'),
      formatImagePath('water_enemy.png'),
    ]);

    // カメラの位置を画面左上に固定
    camera.viewfinder.anchor = Anchor.topLeft;

    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_ember);
  }
}
