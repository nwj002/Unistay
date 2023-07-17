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
