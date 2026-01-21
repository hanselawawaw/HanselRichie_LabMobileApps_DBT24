import 'dart:io';
import 'dart:math';

class Account {
  int balance = 0;

  void deposit(int amount) {
    balance += amount;
  }

  void withdraw(int amount) {
    if (balance - amount >= 0) {
      balance -= amount;
    }
  }
}

void main() {
  Account acc = Account();

  acc.deposit(1500);
  acc.withdraw(300);

  print('Final balance: ${acc.balance}');
}
