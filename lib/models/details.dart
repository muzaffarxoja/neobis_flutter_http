import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'details.g.dart';

//command dart run build_runner build
@JsonSerializable()
class User {
  // @JsonKey(userId: 'USERID')

  final String userId;
  final String id;
  final String title;
  final String body;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
