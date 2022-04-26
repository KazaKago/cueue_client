import 'dart:ui';

extension ColorExtension on Color {
  Color whiter(double percent) {
    final fixedRed = red + ((255 - red) * percent).toInt();
    final fixedGreen = green + ((255 - green) * percent).toInt();
    final fixedBlue = blue + ((255 - blue) * percent).toInt();
    return Color.fromARGB(alpha, fixedRed, fixedGreen, fixedBlue);
  }

  Color blacker(double percent) {
    final fixedRed = red - (red * percent).toInt();
    final fixedGreen = green - (green * percent).toInt();
    final fixedBlue = blue - (blue * percent).toInt();
    return Color.fromARGB(alpha, fixedRed, fixedGreen, fixedBlue);
  }
}
