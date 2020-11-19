class AmendData {
  final String title;
  final String type;
  final int amount;
  final String description;
  final String link;

  AmendData(this.title, this.type, this.amount, this.description, this.link);

  AmendData.fromJson(Map<String, dynamic> json)
      : title = json['name'],
        link = json['link'],
        description = json['description'],
        type = json['type'],
        amount = json['baseUSDAmount'];
}
