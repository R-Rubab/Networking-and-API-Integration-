import '../export_files/export.dart';

class EColors {
  EColors._();

  static const Color pink = Colors.pink;

  // Function to generate a random color
  static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255, // Alpha value (opacity) - 255 means fully opaque
      random.nextInt(256), // Red value (0-255)
      random.nextInt(256), // Green value (0-255)
      random.nextInt(256), // Blue value (0-255)
    );
  }
}
