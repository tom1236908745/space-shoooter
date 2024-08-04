import 'package:flame/components.dart';
import 'package:space_shoooter/ember_quest_game/ViewModel/ember_quest.dart';
import 'package:space_shoooter/ember_quest_game/utils/formatImagePath.dart';

/// 主人公 `ember` くん
class EmberPlayer extends SpriteAnimationComponent
    with HasGameReference<EmberQuestGame> {
  EmberPlayer({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(formatImagePath('ember.png')),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
