class Component {
  const Component({
    required this.name,
    required this.id,
    required this.available,
    required this.totalCount,
    required this.imageURL,
    required this.description,
    required this.datasheetLink,
    required this.position,
  });

  final String name;
  final int id;
  final int available;
  final int totalCount;
  final String imageURL;
  final String description;
  final String datasheetLink;
  final List<int> position;

  factory Component.fromJson(Map<String, dynamic> json, int id) {
    return Component(
      name: json["name"],
      id: id, 
      available: json["available"],
      totalCount: json["totalCount"],
      imageURL: json["imageURL"],
      description: json["description"],
      datasheetLink: json["datasheet"],
      position: List<int>.from(json["position"]),
    );
  }
}
