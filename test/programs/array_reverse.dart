void main(){

  // array reverse program
  List<int> a = [1,2,3,4,5,88,99];

  List<int> r = [];

  for(int i=0; i< a.length; i++){

    for(int j= i+1; j< a.length; j++){

      if(a[i] < a[j]){
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
      }
    }

  }

  print(a); // result is [99, 88, 5, 4, 3, 2, 1]

}