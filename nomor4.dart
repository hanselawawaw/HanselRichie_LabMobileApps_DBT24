import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('masukan angka: ');
  String? input = stdin.readLineSync();

  if (input == null) {
    print('Input tidak valid');
    return;
  }
  
  int? number = int.tryParse(input);
  if (number != null && isPrime(number)) {
    print('ini adalah prima');
  } else {
    print('bukan prima');
  }
}

bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) return false;
  }
  return true;
}