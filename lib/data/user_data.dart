import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String avaterUrl,
    required String name,
    required String comment,
    required String joinDate,
    required String plan,
    required String githubUrl,
    required String residence,
    required int futPoint,
    required String engineerClass,
    required String hobby,
    required int questionZoom,
    required int studySession,
    required int coworking,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
