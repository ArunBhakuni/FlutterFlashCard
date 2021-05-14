import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'cardDeck.dart';
import 'dart:collection';

class CardListStore extends ChangeNotifier {
  int index;
  int _number = 0;

  CardListStore({this.index = 0});

  List<DeckList> _deckList = [
    DeckList([
      Deck('Vraiment', 'Really'),
      Deck('Achter', 'To buy'),
      Deck('Aide', 'Help'),
      Deck('C\'etait', 'It was'),
      Deck('Commande', 'Ordered'),
      Deck('Ce Metain', 'This Morning'),
    ], 'French'),
    DeckList([
      Deck('Un', 'One'),
      Deck('Deux', 'Two'),
      Deck('Trois', 'Three'),
      Deck('Quatre', 'Four'),
      Deck('Cinq', 'Five'),
    ], 'French Numbers'),
  ];

  int get deckLength {
    return _deckList.length;
  }

  UnmodifiableListView<DeckList> get deckList {
    return UnmodifiableListView(_deckList);
  }

  String getSpecifiedCardText(int index) {
    return _deckList[index].title;
  }

  String getSpecifiedCardQuestion(int index) {
    return _deckList[index].deck[_number].question;
  }

  String getSpecifiedCardResponse(int index) {
    return _deckList[index].deck[_number].response;
  }

  void nextCard(int index) {
    if (_number < _deckList[index].deck.length - 1) {
      _number++;
      notifyListeners();
    } else {
      _number = 0;
      notifyListeners();
    }
  }

  void addDeck(List<Deck> abc, String newValue) {
    final newDeckList = DeckList(abc, newValue);
    _deckList.add(newDeckList);
    notifyListeners();
  }
}
