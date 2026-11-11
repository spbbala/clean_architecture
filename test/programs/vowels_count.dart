void main() {
  String input = "flutter development";
  int count = 0;

  for (int i = 0; i < input.length; i++) {
    if ("aeiou".contains(input[i].toLowerCase())) {
      count++;
    }
  }

  print("Vowel count: $count");
}