
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_model.freezed.dart';
part 'notes_model.g.dart';

@freezed
class Notes with _$Notes{

  @JsonSerializable(explicitToJson: true)

  factory Notes({
    required String id,
    required String userId,
    required DateTime savingTime,
    required String notesTitle,
    required String notes}) = _Notes;

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
}