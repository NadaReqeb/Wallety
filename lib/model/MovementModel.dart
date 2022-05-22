class Movement{

  String MovementClass ='';
  // DateTime? month_start;
  Movement();
  Movement.fromMap(Map map) {
    this.MovementClass = map['MovementClass'];
  }
  toMap() {
    return {
      'MovementClass': this.MovementClass,
    };
  }
}