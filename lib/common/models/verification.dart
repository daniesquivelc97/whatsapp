import 'dart:convert';

class Verification {
  Verification({
    required this.phoneNumber,
    required this.smsCodeId,
  });

  final String phoneNumber;
  final String smsCodeId;

  factory Verification.fromJson(String str) =>
      Verification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Verification.fromMap(Map<String, dynamic> json) => Verification(
        phoneNumber: json["phoneNumber"],
        smsCodeId: json["smsCodeID"],
      );

  Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber,
        "smsCodeID": smsCodeId,
      };
}
