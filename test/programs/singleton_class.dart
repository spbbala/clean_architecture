class Sinlgeton{
  Sinlgeton._();
  static final Sinlgeton s = Sinlgeton._();
  factory Sinlgeton() => s;
}

void main(){
  Sinlgeton s = Sinlgeton();
  print(s.hashCode);

  Sinlgeton s2 = Sinlgeton();
  print(s2.hashCode);

  // s.hashCode, s2.hashCode print the same memory address
}