import 'package:client/core/enums/gender.dart';
import 'package:client/core/enums/prepositional_case.dart';
import 'package:client/core/enums/settings.dart';
import 'package:client/core/enums/word_type.dart';

extension WordTypeToText on WordType {
  String toText() {
    switch (this) {
      case WordType.noun:
        return 'Noun';
      case WordType.prepositionalPhrase:
        return 'Prepositional phrase';
      case WordType.properNoun:
        return 'Proper noun';
      case WordType.verb:
        return 'Verb';
      case WordType.adjective:
        return 'Adjective';
    }
  }
}

extension GenderToArticle on Gender {
  String toArticle() {
    switch (this) {
      case Gender.masculine:
        return 'ὁ';
      case Gender.feminine:
        return 'ἡ';
      case Gender.neuter:
        return 'τό';
    }
  }
}

extension GenderToText on Gender {
  String? toText() {
    switch (this) {
      case Gender.masculine:
        return 'Masculine';
      case Gender.feminine:
        return 'Feminine';
      case Gender.neuter:
        return 'Neuter';
      // default:
      //   return null;
    }
  }
}

extension PrepositionalCaseToTextAbreviated on PrepositionalCase {
  String toTextAbreviated() {
    switch (this) {
      case PrepositionalCase.genitive:
        return 'Gen.';
      case PrepositionalCase.dative:
        return 'Dat.';
      case PrepositionalCase.accusitive:
        return 'Acc.';
    }
  }
}

extension PrepositionalCaseToText on PrepositionalCase {
  String toText() {
    switch (this) {
      case PrepositionalCase.genitive:
        return 'Genitive';
      case PrepositionalCase.dative:
        return 'Dative';
      case PrepositionalCase.accusitive:
        return 'Accusitive';
    }
  }
}


extension SettingsToText on Settings {

  String toText() {
    switch (this) {
      case Settings.englishFirst:
        return 'Show English First';
      case Settings.darkMode:
        return 'Dark Mode';
    }
  }
}