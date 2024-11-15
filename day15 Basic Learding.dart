// Bubble Sort Algorithm
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {

        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

void main() {
  List<int> numbers = [64, 34, 25, 12, 22, 11, 90];
  print("Unsorted List: $numbers");
  List<int> sortedList = bubbleSort(numbers);
  print("Sorted List: $sortedList");
}






// Binary Search Algorithm
int binarySearch(List<int> sortedList, int target) {
  int low = 0;
  int high = sortedList.length - 1;

  while (low <= high) {
    int mid = low + ((high - low) >> 1);

    if (sortedList[mid] == target) {
      return mid; // Target found
    } else if (sortedList[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1; // Target not found
}

void main() {
  List<int> sortedNumbers = [11, 12, 22, 25, 34, 64, 90];
  int target = 34;

  int index = binarySearch(sortedNumbers, target);

  if (index != -1) {
    print("Target $target found at index $index");
  } else {
    print("Target $target not found");
  }
}
