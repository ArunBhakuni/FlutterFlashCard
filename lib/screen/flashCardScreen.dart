import 'package:flash_cards/Decks/cardStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashCardDeck extends StatefulWidget {
  static const String id = 'FlashCardScreen';
  final int inde;
  FlashCardDeck({this.inde = 0});

  @override
  _FlashCardDeckState createState() => _FlashCardDeckState();
}

class _FlashCardDeckState extends State<FlashCardDeck> {
  bool show = false;

  void revealAnswer() {
    setState(() {
      show = true;
    });
  }

  // void newCard() {
  //   setState(() {
  //     show = false;
  //     Provider.of<CardListStore>(context, listen: true).nextCard(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey,
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
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(
                      50.0,
                    ),
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        //backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        revealAnswer();
                      },
                      child: Text(
                        show
                            ? Provider.of<CardListStore>(context)
                                .getSpecifiedCardResponse(widget.inde)
                            : Provider.of<CardListStore>(context)
                                .getSpecifiedCardQuestion(widget.inde),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        //backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          show = false;
                          Provider.of<CardListStore>(context, listen: false)
                              .nextCard(widget.inde);
                        });
                      },
                      child: Text(
                        'Next Question',
                      ),
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
