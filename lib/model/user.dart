class WUser {
  String ? id;
  String email = '';
  String password = '';
  late String name ;

  WUser();
  WUser.fromMap(Map map) {
    this.email = map['email'];
    this.id = map['id'];
    this.name= map['name'];

  }
  toMap() {
    return {
      'email': this.email,
      'name': this.name
    };
  }
}