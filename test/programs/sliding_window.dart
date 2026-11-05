void main() {
  List<int> arr = [2, 1, 5, 1, 3, 2];

  int k = 3;

  int windowSum = 0;
  int maxSum = 0;

  // Calculate first window
  for (int i = 0; i < k; i++) {
    windowSum += arr[i];

    print("firstLoop ${arr[i]}");
  }

  print("window sum $windowSum");
  maxSum = windowSum;

  // Slide the window

  print("k index array value ${arr[k]}");
  for (int i = k; i < arr.length; i++) {
    print("logic ${arr[i]} minus ${arr[i - k]}");
    windowSum = windowSum + arr[i] - arr[i - k];

    if (windowSum > maxSum) {
      maxSum = windowSum;
    }
  }

  print("Maximum sum: $maxSum");
}
