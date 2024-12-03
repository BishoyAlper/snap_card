class OrderModel{
  final String id;
  final bool isActive;
  final double price;
  final String company;
  final String buyer;
  final String status;
  final DateTime registered;

  const OrderModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.buyer,
    required this.status,
    required this.registered });

  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
        id: json['id'],
        isActive: json["isActive"],
        price: double.parse(json['price'].replaceAll(RegExp(r'[^\d.]'), '')),
        company: json["company"],
        buyer: json["buyer"],
        status: json["status"],
        registered: DateTime.parse(json['registered']),
    );
  }

}