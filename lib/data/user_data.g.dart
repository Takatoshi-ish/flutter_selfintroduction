// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      avaterUrl: json['avaterUrl'] as String,
      name: json['name'] as String,
      comment: json['comment'] as String,
      joinDate: json['joinDate'] as String,
      plan: json['plan'] as String,
      githubUrl: json['githubUrl'] as String,
      residence: json['residence'] as String,
      futPoint: json['futPoint'] as int,
      engineerClass: json['engineerClass'] as String,
      hobby: json['hobby'] as String,
      questionZoom: json['questionZoom'] as int,
      studySession: json['studySession'] as int,
      coworking: json['coworking'] as int,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'avaterUrl': instance.avaterUrl,
      'name': instance.name,
      'comment': instance.comment,
      'joinDate': instance.joinDate,
      'plan': instance.plan,
      'githubUrl': instance.githubUrl,
      'residence': instance.residence,
      'futPoint': instance.futPoint,
      'engineerClass': instance.engineerClass,
      'hobby': instance.hobby,
      'questionZoom': instance.questionZoom,
      'studySession': instance.studySession,
      'coworking': instance.coworking,
    };
