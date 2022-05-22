class CategoryRevenues {
  String  id ='';
  late String name ;

  CategoryRevenues();
  CategoryRevenues.fromMap(Map map) {

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