const String tableDestinations = 'destination';

class DestinationFields {
  static final List<String> values = [
    /// Add all fields
    id, typeSource, packetTypeId, typeName, name
  ];

  static const String id = '_id';
  static const String packetTypeId = 'packetTypeId';
  static const String typeName = 'typeName';
  static const String name = 'name';
  static const String typeSource = 'typeSource';
}

class Destination {
  final int? id;
  final int packetTypeId;
  final String typeName;
  final String name;
  final String typeSource;

  Destination({
    this.id,
    required this.packetTypeId,
    required this.typeName,
    required this.name,
    required this.typeSource,
  });

  Destination copy({
    int? id,
    int? packetTypeId,
    String? typeName,
    String? name,
    String? typeSource,
  }) =>
      Destination(
        id: id ?? this.id,
        packetTypeId: packetTypeId ?? this.packetTypeId,
        typeName: typeName ?? this.typeName,
        name: name ?? this.name,
        typeSource: typeSource ?? this.typeSource,
      );

  static Destination fromJson(Map<String, Object?> json) => Destination(
        id: json[DestinationFields.id] as int?,
        packetTypeId: json[DestinationFields.packetTypeId] as int,
        typeName: json[DestinationFields.typeName] as String,
        name: json[DestinationFields.name] as String,
        typeSource: json[DestinationFields.typeSource] as String,
      );

  Map<String, Object?> toJson() => {
        DestinationFields.id: id,
        DestinationFields.packetTypeId: packetTypeId,
        DestinationFields.typeName: typeName,
        DestinationFields.name: name,
        DestinationFields.typeSource: typeSource,
      };
}
