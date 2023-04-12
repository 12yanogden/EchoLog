import 'dart:ui';

class Emotion {
  int id;
  String emoji;
  String name;
  Color color;
  bool isActive;

  Emotion(this.id, this.emoji, this.color, this.name, this.isActive);

  void setIsActive(bool isActive) {
    this.isActive = isActive;
  }

  int getId() {
    return id;
  }

  String getEmoji() {
    return emoji;
  }

  String getName() {
    return name;
  }

  Color getColor() {
    return color;
  }

  bool isActivated() {
    return isActive;
  }
}
