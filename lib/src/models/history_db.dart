const String tableHistoryHistorys = 'history';

class HistoryFields {
  static final List<String> values = [
    /// Add all fields
    id, typeName, name
  ];

  static const String id = '_id';
  static const String typeName = 'typeName';
  static const String name = 'name';
}

class History {
  final int? id;
  final String typeName;
  final String name;

  History({
    this.id,
    required this.typeName,
    required this.name,
  });

  History copy({
    int? id,
    String? typeName,
    String? name,
  }) =>
      History(
        id: id ?? this.id,
        typeName: typeName ?? this.typeName,
        name: name ?? this.name,
      );

  static History fromJson(Map<String, Object?> json) => History(
        id: json[HistoryFields.id] as int?,
        typeName: json[HistoryFields.typeName] as String,
        name: json[HistoryFields.name] as String,
      );

  Map<String, Object?> toJson() => {
        HistoryFields.id: id,
        HistoryFields.typeName: typeName,
        HistoryFields.name: name,
      };
}
