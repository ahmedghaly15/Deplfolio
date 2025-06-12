import 'dart:math' show Random;

String generateRandomId() {
  const int idLength = 16;
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(
    idLength,
    (index) => chars[random.nextInt(chars.length)],
  ).join();
}
