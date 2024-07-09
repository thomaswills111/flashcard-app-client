// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:client/core/enums/gender.dart';
import 'package:client/core/enums/prepositional_case.dart';
import 'package:client/core/enums/word_type.dart';

class CardModel {

  String? id;
  String greek;
  String? genitiveEnding;
  String? gender;
  String? prepositionalCase;
  String example;
  String wordType;
  String english;
  String chapter;
  DateTime? createdAt;
  DateTime? updatedAt;

  CardModel({
    this.id,
    required this.greek,
    this.genitiveEnding,
    this.gender,
    this.prepositionalCase,
    required this.example,
    required this.wordType,
    required this.english,
    required this.chapter,
    this.createdAt,
    this.updatedAt,
  });


  CardModel copyWith({
    String? id,
    String? greek,
    String? genitiveEnding,
    String? gender,
    String? prepositionalCase,
    String? example,
    String? wordType,
    String? english,
    String? chapter,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CardModel(
      id: id ?? this.id,
      greek: greek ?? this.greek,
      genitiveEnding: genitiveEnding ?? this.genitiveEnding,
      gender: gender ?? this.gender,
      prepositionalCase: prepositionalCase ?? this.prepositionalCase,
      example: example ?? this.example,
      wordType: wordType ?? this.wordType,
      english: english ?? this.english,
      chapter: chapter ?? this.chapter,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'greek': greek,
      'genitiveEnding': genitiveEnding,
      'gender': gender,
      'prepositionalCase': prepositionalCase,
      'example': example,
      'wordType': wordType,
      'english': english,
      'chapter': chapter,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] != null ? map['id'] as String : null,
      greek: map['greek'] as String,
      genitiveEnding: map['genitiveEnding'] != null ? map['genitiveEnding'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      prepositionalCase: map['prepositionalCase'] != null ? map['prepositionalCase'] as String : null,
      example: map['example'] as String,
      wordType: map['word_type'] as String,
      english: map['english'] as String,
      chapter: map['chapter'] as String,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardModel(id: $id, greek: $greek, genitiveEnding: $genitiveEnding, gender: $gender, prepositionalCase: $prepositionalCase, example: $example, wordType: $wordType, english: $english, chapter: $chapter, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.greek == greek &&
      other.genitiveEnding == genitiveEnding &&
      other.gender == gender &&
      other.prepositionalCase == prepositionalCase &&
      other.example == example &&
      other.wordType == wordType &&
      other.english == english &&
      other.chapter == chapter &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      greek.hashCode ^
      genitiveEnding.hashCode ^
      gender.hashCode ^
      prepositionalCase.hashCode ^
      example.hashCode ^
      wordType.hashCode ^
      english.hashCode ^
      chapter.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
