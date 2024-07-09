import 'package:client/features/flashcard/models/card_model.dart';
import 'package:client/features/flashcard/repositories/flashcard_remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard_viewmodel.g.dart';

@riverpod
class FlashcardViewModel extends _$FlashcardViewModel {
  late FlashcardRemoteRepository _flashcardRemoteRepository;

    List<CardModel> allCards = [];

    List<String> chapters = [];


  @override
  AsyncValue<List<CardModel>>? build() {
    _flashcardRemoteRepository = ref.watch(flashcardRemoteRepositoryProvider);
    return null;
  }

  Future<void> uploadCard({required CardModel card}) async {
    state = const AsyncValue.loading();
    final res = await _flashcardRemoteRepository.create(card: card);
    state = AsyncValue.data(res);
    final val = switch (res) {
      Left(value: final l) => state =
          AsyncValue.error(l.message, StackTrace.current),
      Right(value: final CardModel r) => state = AsyncValue.data(r),
    };
    print(val);
  }

  Future<void> getCards() async {
    final res = await _flashcardRemoteRepository.browse();
    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => _getDataSucceess(r)
    };

  }

  void getChapters() {
    for (CardModel card in allCards) {
      if (!chapters.contains(card.chapter)) {
        chapters.add(card.chapter);
      }
    }
  }
  
  _getDataSucceess(List<CardModel> cards) {
    allCards = cards;
    return state = AsyncValue.data(cards);
  }
}
