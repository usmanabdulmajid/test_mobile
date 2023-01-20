class ErrorModel {
  String title;
  String description;
  ErrorModel({
    this.title = '',
    this.description = '',
  });

  bool get isNotEmpty => title.isNotEmpty && description.isNotEmpty;

  void clear() {
    title = '';
    description = '';
  }

  ErrorModel copyWith({
    String? title,
    String? description,
  }) {
    return ErrorModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() => 'ErrorModel(title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorModel &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
