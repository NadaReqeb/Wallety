class Task {
   int ?id;
  String title='';
  String amount='';
  String data='';
  bool isComplete= false;

  Task({ this.id, required this.title, required this.amount, required this.data, required this.isComplete});
  Task.fromMap(Map map) {
    this.id = map['id'];
    this.title = map['title'];
    this.amount = map['amount'];
    this.data = map['data'];
    this.isComplete = map['isComplete'] == 1 ? true : false;
  }
  toMap() {
    return {
      'name': this.title,
      'amount': this.amount,
      'data': this.data,
      'isComplete': this.isComplete ? 1 : 0};
  }
}