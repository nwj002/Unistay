import 'package:flutter/animation.dart';

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