// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  int? status;
  String? message;
  LoginModel({required this.status, required this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json["message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
