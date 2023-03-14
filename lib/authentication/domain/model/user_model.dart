class User {
  List<String> appointments;
  String id;
  String name;
  String email;
  bool confirmed;
  String type;
  String userName;
  int v;

  User(
    this.appointments,
    this.id,
    this.name,
    this.email,
    this.confirmed,
    this.type,
    this.userName,
    this.v,
  );
}

class Data {
  User? user;

  Data(this.user);
}

class UserData {
  String token;
  Data? data;

  UserData(this.token, this.data);
}