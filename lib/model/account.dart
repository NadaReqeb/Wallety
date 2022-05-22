class AccountUser{
  // String ? aid;
  // String  currency = '' ;

  // num   Current_salary =0;
  num   current_balance=0;
  num   spending=0;
  num   incom=0;
  // DateTime? month_start;
  AccountUser();
  AccountUser.fromMap(Map map) {
    // this.Current_salary = map['Current_salary'];
    this.current_balance = map['current_balance'];
    this.spending = map['spending'];
    this.incom = map['incom'];
    // this.aid = map['current_balance'];
    // this.month_start = map['month_start'];
  }
  toMap() {
    return {
      'current_balance': this.current_balance,
      'spending': this.spending,
      'incom': this.incom,
      // 'aid': this.aid,
      // 'month_start': this.month_start
    };
}
}