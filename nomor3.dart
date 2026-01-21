import 'dart:io';
import 'dart:math';

void main() {

  var rng = Random();
  int numberToGuess = rng.nextInt(100) + 1;
  int? userGuess;
  int attempts = 0;

  print('halo ini guessing game!');
  print('saya sudah pilih angka random 1-100');

  while (userGuess != numberToGuess) {
    stdout.write('tebak: ');
    String? input = stdin.readLineSync();
    if (input != null) {
      userGuess = int.tryParse(input);
      attempts++;

      if (userGuess == null) {
        print('angka yg bener dong');
      } else if (userGuess < numberToGuess) {
        print('kekecilan.');
      } else if (userGuess > numberToGuess) {
        print('kebesaran.');
      } else {
        print('anjay km bs nebak $numberToGuess di $attempts percobaan.');
      }
    }
  }
}
