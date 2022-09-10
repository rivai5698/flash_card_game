import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhw6/models/card.dart' as cd;

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  //final card = [];
  final cards = <cd.Card>[];
  late int level;
  @override
  void initState() {
     cards.addAll([cd.Card(1,'images/clubs/che.png','chelsea')]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Games: {}'),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: GridView.builder(
          itemCount: cards.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2

        ), itemBuilder: (context,int index){
            return cardsBox(cards[index].cardUrl);
        }),
      ),
    );
  }
  
  Widget questionBox(){
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child:  const Icon(CupertinoIcons.question,color: Colors.white,),
    );
  }
  
  Widget cardsBox(String imgUrl){
   return GestureDetector(
     onTap: (){},
     child: Container(
       color: Colors.red,
       height: 50,
       width: 50,
       child: Image.asset(imgUrl,width: 25,height: 25,fit: BoxFit.contain,),
     ),
   );
  }
}
