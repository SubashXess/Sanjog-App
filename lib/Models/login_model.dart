class LoginModel {
  int? uid;
  String? userlevel;
  String? username;
  String? password;

  LoginModel(
      {required this.uid,
      required this.userlevel,
      required this.username,
      required this.password});

  factory LoginModel.fromMap(Map<String, dynamic> res) {
    return LoginModel(
        uid: res['uid'],
        userlevel: res['userlevel'],
        username: res['u_name'],
        password: res['mobile']);
  }

  Map<String, Object?> toMap() => {
        'uid': uid,
        'userlevel': userlevel,
        'u_name': username,
        'mobile': password,
      };
}
