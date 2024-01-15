import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note_model.freezed.dart';

part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String id,
    required String title,
    required String content,
    required int hexColor,
    required int dateTime
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, Object?> json) => _$NoteModelFromJson(json);
}