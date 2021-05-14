import 'package:flutter/material.dart';

class Deck {
  String question;
  String response;

  Deck(String q, String r) {
    question = q;
    response = r;
  }
}

class DeckList {
  String title;
  List<Deck> deck;

  DeckList(List<Deck> d, String cardTitle) {
    deck = d;
    title = cardTitle;
  }
}
