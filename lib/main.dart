import 'package:flash_cards/screen/deckListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/screen/welcomeScreen.dart';
import 'package:flash_cards/screen/flashCardScreen.dart';
import 'package:flash_cards/screen/addNewDeck.dart';
import 'package:flash_cards/screen/deckListScreen.dart';
import 'package:flash_cards/screen/addCards.dart';
import 'package:provider/provider.dart';
import 'package:flash_cards/Decks/cardStore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardListStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          FlashCardDeck.id: (context) => FlashCardDeck(),
          DeckListScreen.id: (context) => DeckListScreen(),
          AddNewDeck.id: (context) => AddNewDeck(),
          AddCards.id: (context) => AddCards(),
        },
      ),
    );
  }
}
