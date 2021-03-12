import 'dart:convert';

import 'package:flutter_playground/state_management/riverpod/models/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.data});

  UserData data;

  factory User.fromRawJson(String rawJson) =>
      User.fromJson(json.decode(rawJson));

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: UserData.fromJson(json["data"]),
      );
}
