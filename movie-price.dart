import 'dart:io';
void main() {
  print(" Movie Ticket Booking ");
  stdout.write("Enter the number of person: "); // asking for members
  int n = int.parse(stdin.readLineSync()!); //taking input for members(n)

  double Cost = 0;
  for (int i = 1; i <=n; i++) {
    stdout.write("Enter age of person $i: ");
    int age = int.parse(stdin.readLineSync()!);

    double ticketPrice = 0;
    if (age < 5) {
      ticketPrice = 0;
      print("Person $i: Free ticket for children under 5!");
    } else if (age >= 5 && age <= 12) {
      print("Person $i: Ticket price for middle aged children between 5 to 12 is Rs.100");
      ticketPrice = 100;
    } else if (age >= 13 && age <= 59) {
      print("Person $i: Ticket  price for Teenagers and Adults Rs.200");
      ticketPrice = 200;
    } else {
      print("person $i: Ticket Price for Senior Citizens Rs.150");
      ticketPrice = 150;
    }

    Cost += ticketPrice;
  }// checking the conditionf for all the age groups and providing price accordingly

  stdout.write("Are you a student? (yes/no): ");// giving student discount
  String isStudent = stdin.readLineSync()!.toLowerCase();

  if (isStudent == "yes") {
    double discount = Cost * 0.1; // 10% off
    Cost -= discount;
    print(" Student discount applied: ₹${discount.toStringAsFixed(2)}");
  }

  print("\n Total cost for $n ticket(s): Rs.${Cost.toStringAsFixed(2)}");
  print(" Enjoy your movie!");
}
