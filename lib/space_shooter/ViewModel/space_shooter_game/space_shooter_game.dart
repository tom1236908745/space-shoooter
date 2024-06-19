import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:space_shoooter/space_shooter/ViewModel/space_shooter_game/enemy.dart';
import 'package:space_shoooter/space_shooter/ViewModel/space_shooter_game/player.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late Player player;

  @override
  Future<void> onLoad() async {
    final parallax = await loadParallaxComponent([
      ParallaxImageData(('stars.png')),
      ParallaxImageData(('stars.png')),
    ],
        baseVelocity: Vector2(0, -5),
        repeat: ImageRepeat.repeat,
        velocityMultiplierDelta: Vector2(0, 5));

    add(parallax);

    player = Player();
    add(player);

    add(
      SpawnComponent.periodRange(
        factory: (index) {
          return Enemy();
        },
        minPeriod: .3,
        maxPeriod: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -Enemy.enemySize),
      ),
    );
  }

  // ドラッグで動かしたタイミング
  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }

  // ドラッグを開始したタイミング
  @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
  }

  // ドラッグを止めた時
  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
  }
}
