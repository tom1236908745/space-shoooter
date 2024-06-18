import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shoooter/ViewModel/space_shooter_game.dart';

class Bullet extends SpriteComponent with HasGameReference<SpaceShooterGame> {
  Bullet({
    super.position,
  }) : super(
          size: Vector2(25, 50),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('fire_orange.png');

    add(
      RectangleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * -500;
    if (position.y < -height) {
      removeFromParent();
    }
  }
}
