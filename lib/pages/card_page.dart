import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhw6/models/card.dart' as cd;
import 'package:flutterhw6/pages/card_widget.dart';
import 'package:flutterhw6/pages/question_widget.dart';

class CardPage extends StatefulWidget {
  final int level;
  final int column;

  const CardPage({Key? key, required this.level, required this.column})
      : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final stopwatch = Stopwatch();
  var seconds = 0;
  var correctCards = <cd.Card>[];
  final cards = <cd.Card>[];
  final types = [];
  final chosenTypes = [];
  final chosenCards = <cd.Card>[];
  var lastSelectedType = '';
  late int level;
  var isLocked = false;
  var isVisible = false;
  var isCountdown = false;

  @override
  void initState() {
    cards.addAll([
      cd.Card(1, 'images/clubs/bha.png', 'bha', false),
      cd.Card(2, 'images/clubs/che.png', 'che', false),
      cd.Card(3, 'images/clubs/crp.png', 'crp', false),
      cd.Card(4, 'images/clubs/lc.png', 'lc', false),
      cd.Card(5, 'images/clubs/liv.png', 'liv', false),
      cd.Card(6, 'images/clubs/mc.png', 'mc', false),
      cd.Card(7, 'images/clubs/tot.png', 'tot', false),
      cd.Card(8, 'images/clubs/whu.png', 'whu', false),
      cd.Card(9, 'images/players/lamptey.png', 'bha', false),
      cd.Card(10, 'images/players/mount.png', 'che', false),
      cd.Card(11, 'images/players/zaha.png', 'crp', false),
      cd.Card(12, 'images/players/madison.png', 'lc', false),
      cd.Card(13, 'images/players/vandijk.png', 'liv', false),
      cd.Card(14, 'images/players/haaland.png', 'mc', false),
      cd.Card(15, 'images/players/son.png', 'tot', false),
      cd.Card(16, 'images/players/zouma.png', 'whu', false),
    ]);

    types.addAll(['bha', 'che', 'crp', 'lc', 'liv', 'mc', 'tot', 'whu']);

    if (widget.level < 3) {
      for (int i = 0; i < types.length; i++) {
        var random = types[Random().nextInt(types.length)];

        if (!chosenTypes.contains(random)) {
          chosenTypes.add(random);
        }
        if (chosenTypes.length == widget.level * 2) {
          break;
        }
      }

      for (int i = 0; i < cards.length; i++) {
        if (chosenTypes.contains(cards[i].type)) {
          chosenCards.add(cards[i]);
        }
      }
      chosenCards.shuffle();
      print(chosenCards);
    } else {
      chosenTypes.addAll(types);
      chosenCards.addAll(cards);
      chosenCards.shuffle();
      print(chosenCards);
    }

    Duration elapsed = stopwatch.elapsed;
    Future.delayed(const Duration(seconds: 1));
    assert(stopwatch.elapsed == elapsed);
    stopwatch.start();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    var hM = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Games: ${widget.level.toString()}'),
      ),
      body: Stack(
        children: [

          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                //height: hM,
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: chosenCards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: widget.column),
                    itemBuilder: (context, int index) {
                      final cardDetail = chosenCards[index];
                      //   if (cardDetail.isFlip) {
                      //     return CardWidget(card: chosenCards[index],);
                      //   }
                      // return GestureDetector(
                      //     onTap: ()=>onTapQuestion(chosenCards[index]),
                      //     child: const QuestionWidget());

                      return GestureDetector(
                        onTap: () => onTapQuestion(cardDetail),
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: cardDetail.isFlip
                              ? CardWidget(card: cardDetail)
                              : const QuestionWidget(),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Positioned.fill(
              top: 20,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Visibility(
                    visible: isVisible,
                    // child: const Text('Congratulations!',style: TextStyle(
                    //     color: Colors.blue,
                    //     fontSize: 24,
                    //   ),),
                    child: Text(
                      'Congratulations!\nFinished in $seconds seconds',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    print('reset');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CardPage(
                                level: widget.level, column: widget.column)));
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapQuestion(cd.Card card) {
    print(card.type);
    if (isLocked || card.isFlip) {
      return;
    }

    //solution 1: count the cards has same type
    final cnt = chosenCards
        .where((card) => card.isFlip == false && card.type == lastSelectedType)
        .length;

    //solution 2:
    // final lc = [];
    // for(final card in chosenCards){
    //   if(card.isFlip==false && card.type == lastSelectedType){
    //     lc.add(card);
    //   }
    // }
    //final c = lc.length;

    //
    if (cnt == 0 || card.type == lastSelectedType) {
      card.isFlip = true;
      lastSelectedType = card.type;
      correctCards.add(card);
      if (correctCards.length == chosenCards.length) {
        isVisible = true;
        stopwatch.stop();
        seconds = stopwatch.elapsed.inSeconds;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {});
        });
      }
      print("Corrected: $correctCards");
      print('open');
    } else {
      print('close');
      isLocked = true;
      lastSelectedType = '';
      card.isFlip = true;
      Future.delayed(const Duration(seconds: 2), () {
        for (final card in chosenCards) {
          card.isFlip = false;
        }
        isLocked = false;
        correctCards = [];
        setState(() {});
      });
    }

    setState(() {});
  }
}
