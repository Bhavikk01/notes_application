// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notes _$NotesFromJson(Map<String, dynamic> json) {
  return _Notes.fromJson(json);
}

/// @nodoc
mixin _$Notes {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get savingTime => throw _privateConstructorUsedError;
  String get notesTitle => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesCopyWith<Notes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesCopyWith<$Res> {
  factory $NotesCopyWith(Notes value, $Res Function(Notes) then) =
      _$NotesCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String userId,
      DateTime savingTime,
      String notesTitle,
      String notes});
}

/// @nodoc
class _$NotesCopyWithImpl<$Res> implements $NotesCopyWith<$Res> {
  _$NotesCopyWithImpl(this._value, this._then);

  final Notes _value;
  // ignore: unused_field
  final $Res Function(Notes) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? savingTime = freezed,
    Object? notesTitle = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      savingTime: savingTime == freezed
          ? _value.savingTime
          : savingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notesTitle: notesTitle == freezed
          ? _value.notesTitle
          : notesTitle // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NotesCopyWith<$Res> implements $NotesCopyWith<$Res> {
  factory _$$_NotesCopyWith(_$_Notes value, $Res Function(_$_Notes) then) =
      __$$_NotesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userId,
      DateTime savingTime,
      String notesTitle,
      String notes});
}

/// @nodoc
class __$$_NotesCopyWithImpl<$Res> extends _$NotesCopyWithImpl<$Res>
    implements _$$_NotesCopyWith<$Res> {
  __$$_NotesCopyWithImpl(_$_Notes _value, $Res Function(_$_Notes) _then)
      : super(_value, (v) => _then(v as _$_Notes));

  @override
  _$_Notes get _value => super._value as _$_Notes;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? savingTime = freezed,
    Object? notesTitle = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$_Notes(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      savingTime: savingTime == freezed
          ? _value.savingTime
          : savingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notesTitle: notesTitle == freezed
          ? _value.notesTitle
          : notesTitle // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Notes implements _Notes {
  _$_Notes(
      {required this.id,
      required this.userId,
      required this.savingTime,
      required this.notesTitle,
      required this.notes});

  factory _$_Notes.fromJson(Map<String, dynamic> json) =>
      _$$_NotesFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime savingTime;
  @override
  final String notesTitle;
  @override
  final String notes;

  @override
  String toString() {
    return 'Notes(id: $id, userId: $userId, savingTime: $savingTime, notesTitle: $notesTitle, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notes &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.savingTime, savingTime) &&
            const DeepCollectionEquality()
                .equals(other.notesTitle, notesTitle) &&
            const DeepCollectionEquality().equals(other.notes, notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(savingTime),
      const DeepCollectionEquality().hash(notesTitle),
      const DeepCollectionEquality().hash(notes));

  @JsonKey(ignore: true)
  @override
  _$$_NotesCopyWith<_$_Notes> get copyWith =>
      __$$_NotesCopyWithImpl<_$_Notes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotesToJson(this);
  }
}

abstract class _Notes implements Notes {
  factory _Notes(
      {required final String id,
      required final String userId,
      required final DateTime savingTime,
      required final String notesTitle,
      required final String notes}) = _$_Notes;

  factory _Notes.fromJson(Map<String, dynamic> json) = _$_Notes.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get savingTime;
  @override
  String get notesTitle;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$_NotesCopyWith<_$_Notes> get copyWith =>
      throw _privateConstructorUsedError;
}
