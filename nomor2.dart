import 'dart:io';
import 'dart:math';

void main() {
  List<String> pilihan = ['scissors', 'rock', 'paper'];
  Random random = Random();

  // pilihan komputer
  String komputer = pilihan[random.nextInt(3)];

  // input user
  stdout.write('Pilih (scissors/rock/paper): ');
  String? user = stdin.readLineSync();

  if (user == null || !pilihan.contains(user)) {
    print('not valid');
    return;
  }

  print('comps memilih: $komputer');

  // bandingkan
  if (user == komputer) {
    print('Hasil: Seri');
  } else if (
      (user == 'scissors' && komputer == 'paper') ||
      (user == 'rock' && komputer == 'scissors') ||
      (user == 'paper' && komputer == 'rock')) {
    print('results: Kamu menang');
  } else {
    print('results: Komputer menang');
  }
}