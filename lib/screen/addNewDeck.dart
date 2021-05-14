import 'package:flash_cards/Decks/cardStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addCards.dart';

class AddNewDeck extends StatefulWidget {
  static const String id = 'AddNewDeck_Screen';
  @override
  _AddNewDeckState createState() => _AddNewDeckState();
}

class _AddNewDeckState extends State<AddNewDeck> {
  String newDeckTitle;
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
              children: [
                Text(
                  'Input the name for the Deck',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                TextField(
                  onChanged: (newValue) {
                    newDeckTitle = newValue;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    // Provider.of<CardListStore>(context).addDeck(newDeckTitle);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCards(
                                  title: newDeckTitle,
                                )));
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
