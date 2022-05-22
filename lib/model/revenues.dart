class Revenues {
   String  id ='';
   // late String  idMainCategories;
   // late String id_user ;
   // late String date ;
   late String  amount ;
   late String  description  ;
   late String  title  ;

   Revenues();
   Revenues.fromMap(Map map) {

      this.id  = map['id ='];
      // this.idMainCategories = map['id_category'];
      // this.id_user = map['id_user'];
      // this.date = map['date'];
      this.amount = map['amount'];
      this.description = map['description'];
      this.title = map['title'];


   }
   toMap() {
      return {
         'id =': this.id,
         // 'id_category': this.idMainCategories,
         // 'id_user': this.id_user,
         // 'date': this.date,
         'amount': this.amount,
         'description': this.description,
         'title': this.title,
      };
   }
}