import 'dart:io';
import 'dart:math';

class Ujian {
  int total = 0;
  void tambahNilai(int nilai) {
    total += nilai;
  }
  double rataRata() {
    return total / 3;
  }
}
void main() {
  var ujian = Ujian();

  for (int i = 0; i < 3; i++) {
    stdout.write('nama student: ');
    stdin.readLineSync();

    stdout.write('Input nilai: ');
    int nilai = int.parse(stdin.readLineSync()!);

    ujian.tambahNilai(nilai);
  }

  print('Rata-rata nilai: ${ujian.rataRata()}');
}