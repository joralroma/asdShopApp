class User {

  final String id;
  final int role;
  final String name;
  final String lastName;
  final String email;
  final String imgProfile;

  User(
    this.id,
    this.role,
    this.name,
    this.lastName,
    this.email,
    this.imgProfile,
  );

  static User fromJson(json) {
    User user = new User(
      json['_id'],
      json['role'],
      json['name'],
      json['lastName'],
      json['email'],
      json['imgProfile'],
    );
    return user;
  }

  // static List<City> fromJsonList(Iterable data) {
  //   List<City> list = [];
  //   for (var e in data) list.add(fromJson(e));
  //   return list;
  // }

}