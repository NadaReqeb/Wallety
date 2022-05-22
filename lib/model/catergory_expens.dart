class CategoryExpense {
  String  id ='';
  late String name ;

  CategoryExpense();
  CategoryExpense.fromMap(Map map) {

    this.id = map['id'];
    this.name= map['name'];

  }
  toMap() {
    return {
      'name': this.name,
      'id': this.id
    };
  }
}