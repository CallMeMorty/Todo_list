class TodoItemModel {
  final String title;
  final String description;
  final bool isChecked;

  TodoItemModel({
    required this.title,
    required this.description,
    required this.isChecked,
  });

  Map<String, String> toMap() => {
        'title': title,
        'description': description,
        'isChecked': isChecked.toString(),
      };

  factory TodoItemModel.fromMap(
    Map<String, String?> map,
  ) =>
      TodoItemModel(
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        isChecked:
            map['isChecked'] != null ? bool.parse(map['isChecked']!) : false,
      );

  TodoItemModel copyWith({
    String? title,
    String? description,
    bool? isChecked,
  }) =>
      TodoItemModel(
        title: title ?? this.title,
        description: description ?? this.description,
        isChecked: isChecked ?? this.isChecked,
      );
}
