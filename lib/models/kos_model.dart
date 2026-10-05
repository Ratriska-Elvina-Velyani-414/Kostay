class KosModel {
  final String name;
  final String location;
  final String price;
  final int priceValue;
  final double rating;
  final String imageUrl;
  final List<String> facilities;
  final String description;

  const KosModel({
    required this.name,
    required this.location,
    required this.price,
    required this.priceValue,
    required this.rating,
    required this.imageUrl,
    required this.facilities,
    required this.description,
  });
}