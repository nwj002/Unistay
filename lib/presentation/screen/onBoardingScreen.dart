import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationInfo {
  final AnimationTrigger trigger;
  final List<AnimationEffect> effects;

  AnimationInfo({required this.trigger, required this.effects});
}
enum AnimationTrigger {
  onPageLoad,
  onTap,
  onHover,
  onActionTrigger,
}
abstract class AnimationEffect {}

class VisibilityEffect extends AnimationEffect {
  final Duration duration;

  VisibilityEffect({required this.duration});
}

class FadeEffect extends AnimationEffect {
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final double begin;
  final double end;

   FadeEffect({
    required this.curve,
    required this.delay,
    required this.duration,
    required this.begin,
    required this.end,
  });
}

class MoveEffect extends AnimationEffect {
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final Offset begin;
  final Offset end;

  MoveEffect({
    required this.curve,
    required this.delay,
    required this.duration,
    required this.begin,
    required this.end,
  });
}


class ScaleEffect extends AnimationEffect {
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final Offset begin;
  final Offset end;

  ScaleEffect({
    required this.curve,
    required this.delay,
    required this.duration,
    required this.begin,
    required this.end,
  });
}

extension AnimationExtensions on Widget {
  Widget animateOnPageLoad(AnimationInfo animationInfo) {
    final visibilityEffect = animationInfo.effects[0] as VisibilityEffect;
    final fadeEffect = animationInfo.effects[1] as FadeEffect;
    final moveEffect = animationInfo.effects[2] as MoveEffect;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: fadeEffect.begin, end: fadeEffect.end),
      duration: fadeEffect.duration,
      curve: fadeEffect.curve,
      builder: (BuildContext context, double value, Widget? child) {
        final opacity = value.clamp(0.0, 1.0);

        return Visibility(
          visible: visibilityEffect.duration > Duration.zero,
          child: Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(
                moveEffect.begin.dx +
                    (moveEffect.end.dx - moveEffect.begin.dx) * opacity,
                moveEffect.begin.dy +
                    (moveEffect.end.dy - moveEffect.begin.dy) * opacity,
              ),
              child: child,
            ),
          ),
        );
      },
      child: this,
    );
  }
}