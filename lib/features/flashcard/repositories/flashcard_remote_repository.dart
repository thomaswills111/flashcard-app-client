import 'dart:convert';
import 'package:client/core/constants/server_constants.dart';
import 'package:client/core/failure/failure.dart';
import 'package:client/features/flashcard/models/card_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';

part 'flashcard_remote_repository.g.dart';

@riverpod
FlashcardRemoteRepository flashcardRemoteRepository(
    FlashcardRemoteRepositoryRef ref) {
  return FlashcardRemoteRepository();
}

class FlashcardRemoteRepository {

  Future<Either<AppFailure, List<CardModel>>> browse() async {
    try {
      final response = await http.get(
        Uri.parse('${ServerConstant.serverURL}/card/'),
        headers: {'content-Type': 'application/json'},
      );

      final resbodyMap = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode != 201) {
        return Left(
          AppFailure(
            message: resbodyMap['detail'],
          ),
        );
      }

      List<CardModel> cards = [];

      resbodyMap.forEach((card) => cards.add(CardModel.fromMap(card)));

      return Right(cards);
    } catch (e) {
      return Left(
        AppFailure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<AppFailure, CardModel>> create(
      {required CardModel card}) async {
    try {
      final response = await http.post(
        Uri.parse(
          '${ServerConstant.serverURL}/card/create',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "greek": card.greek,
            "english": card.english,
            "example": card.example,
            "chapter": card.chapter,
            "gender": card.gender,
            "word_type": card.wordType,
            "genitive_ending": card.genitiveEnding,
            "prepositional_case": card.prepositionalCase
          },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        return Left(
          AppFailure(message: resBodyMap['detail']),
        );
      }
      return Right(
        CardModel.fromMap(resBodyMap),
      );
    } catch (e) {
      return Left(
        AppFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
