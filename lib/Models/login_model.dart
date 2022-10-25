class LoginModel {
  int? uid;
  String? userlevel;
  String? name;
  String? mobile;
  String? username;
  String? password;
  String? userType;
  String? assembly;
  String? status;

  LoginModel({
    required this.uid,
    required this.userlevel,
    required this.name,
    required this.mobile,
    required this.username,
    required this.password,
    required this.userType,
    required this.assembly,
    required this.status,
  });

  factory LoginModel.fromMap(Map<String, dynamic> res) {
    return LoginModel(
      uid: res['id'],
      userlevel: res['userlevel'],
      name: res['name'],
      mobile: res['mobile'],
      username: res['u_name'],
      password: res['password'],
      userType: res['user_type'],
      assembly: res['assembly'],
      status: res['status'],
    );
  }

  Map<String, Object?> toMap() => {
        'id': uid,
        'userlevel': userlevel,
        'name': name,
        'mobile': mobile,
        'u_name': username,
        'password': password,
        'user_type': userType,
        'assembly': assembly,
        'status': status,
      };
}
