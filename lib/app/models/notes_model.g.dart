// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notes _$$_NotesFromJson(Map<String, dynamic> json) => _$_Notes(
      id: json['id'] as String,
      userId: json['userId'] as String,
      savingTime: DateTime.parse(json['savingTime'] as String),
      notesTitle: json['notesTitle'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$_NotesToJson(_$_Notes instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'savingTime': instance.savingTime.toIso8601String(),
      'notesTitle': instance.notesTitle,
      'notes': instance.notes,
    };
