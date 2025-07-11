class Bag<T> {
  late List list; // ["시계" ,1000]

  Bag(List givenList) {
    list = givenList;
  }

  T pick(List<T> items) {
    print(items[1].runtimeType);

    return items[1];
  }
}

void main() {
  var bag = Bag(["시계", 1000]);

  bag.pick(["시계", 1000]);
}
