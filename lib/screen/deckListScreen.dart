import 'package:flash_cards/screen/flashCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/Decks/cardStore.dart';
import 'package:flash_cards/Decks/cardDeck.dart';
import 'package:provider/provider.dart';

class DeckListScreen extends StatefulWidget {
  static const String id = 'DeckListScreen';
  @override
  _DeckListScreenState createState() => _DeckListScreenState();
}

class _DeckListScreenState extends State<DeckListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Flash Cards',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Provider.of<CardListStore>(context).deckLength,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                Provider.of<CardListStore>(context).deckList[index].title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onLongPress: () {
                //Navigator.pushNamed(context, FlashCardDeck.id);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlashCardDeck(
                              inde: index,
                            )));
              },
            );
          },
        ),
      ),
    );
  }
}
