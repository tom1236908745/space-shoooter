import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shoooter/ViewModel/bullet.dart';
import 'package:space_shoooter/ViewModel/explosion.dart';
import 'package:space_shoooter/ViewModel/space_shooter_game.dart';

class Enemy extends SpriteComponent
    with HasGameReference<SpaceShooterGame>, CollisionCallbacks {
  Enemy({
    super.position,
  }) : super(size: Vector2.all(enemySize), anchor: Anchor.center);

  static const enemySize = 90.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite(
      'enemy3.png',
    );

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 250;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Bullet) {
      removeFromParent();
      other.removeFromParent();
      game.add(Explosion(position: position));
    }
  }
}
