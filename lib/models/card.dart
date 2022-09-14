class Card{
  final int id;
  final String cardUrl;
  final String type;
  bool isFlip;

  Card(this.id, this.cardUrl, this.type, this.isFlip);

  @override
  String toString() {
    return 'Card{id: $id, cardUrl: $cardUrl, type: $type, isFlip: $isFlip}';
  }
}