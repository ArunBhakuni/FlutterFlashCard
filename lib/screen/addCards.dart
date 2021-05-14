import 'package:flash_cards/Decks/cardStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flash_cards/Decks/cardDeck.dart';

class AddCards extends StatefulWidget {
  static const String id = 'AddCardScreen';
  final String title;
  AddCards({this.title});

  @override
  _AddCardsState createState() => _AddCardsState();
}

class _AddCardsState extends State<AddCards> {
  String cardFront;
  String cardBack;
  final cardFrontController = TextEditingController();
  final cardBackController = TextEditingController();

  List<Deck> listOfCards = [];

  @override
  void dispose() {
    // TODO: implement dispose
    cardFrontController.dispose();
    cardBackController.dispose();
    super.dispose();
  }

  void clearText() {
    cardFrontController.clear();
    cardBackController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cards for Deck: ${widget.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Front',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: cardFrontController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: cardBackController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                    onPressed: () {
                      listOfCards.add(Deck(
                          cardFrontController.text, cardBackController.text));
                      clearText();
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<CardListStore>(context, listen: false)
                          .addDeck(listOfCards, widget.title);
                      //add alert card added
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
