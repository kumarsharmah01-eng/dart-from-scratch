import 'dart:async';
import 'dart:io';

void main() async {
  print('Enter countdown start number: ');
  int? number = int.parse(stdin.readLineSync()!);

  for (int i = number; i >= 0; i--) {
    print(i);
    await Future.delayed(Duration(seconds: 1)); // wait 1 second
  }

  print('Time\'s up!');
}
