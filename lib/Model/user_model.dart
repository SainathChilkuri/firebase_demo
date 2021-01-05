class UserDetails{
  String UID;
  String firstname;
  String lastname;
  String email;
  UserDetails({
    this.UID,
    this.firstname,
    this.lastname,
    this.email,
});
  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map['uid'] = this.UID;
    map['firstname'] = this.firstname;
    map['lastname'] = this.lastname;
    map['email'] = this.email;
    return map;
  }
  UserDetails fromMap(Map<String,dynamic> map){
    return UserDetails(
      UID: map['uid'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email']
    );
  }
}