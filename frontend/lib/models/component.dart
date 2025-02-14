// all-coder
class Component {
  const Component({
    required this.name,
    required this.id,
    required this.available,
    required this.totalCount,
    required this.imageURL,
    required this.description,
    required this.datasheetLink,
    required this.position
  });
  final String name;
  final int id;
  final int available;
  final int totalCount;
  final String imageURL;
  final String description;
  final String datasheetLink;
  final List<int> position;
}
