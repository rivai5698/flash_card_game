import 'package:flutter/material.dart';
import 'package:flutterhw6/models/card.dart' as cd;

class CardWidget extends StatefulWidget {
  final cd.Card card;

  const CardWidget({Key? key, required this.card}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return cardsBox(widget.card);
  }

  Widget cardsBox(cd.Card card) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            card.cardUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
