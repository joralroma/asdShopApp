class Category {

  final String id;
  final String name;

  Category(
    this.id,
    this.name,
  );

  static Category fromJson(json) {
    Category category = new Category(
      json['_id'],
      json['name'],
    );
    return category;
  }

  static List<Category> fromJsonList(Iterable data) {
    List<Category> list = [];
    for (var e in data) list.add(fromJson(e));
    return list;
  }

}