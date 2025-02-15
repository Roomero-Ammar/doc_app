import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
 // @JsonKey(name: 'error_code') // if the key name is different from the variable name
  final int code;

  ApiErrorModel({
    required this.message,
    required this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

// {
//   "message": "The email has already been taken.",
//   "code": "EMAIL_TAKEN",
// }

// use this command to generate the model >> dart run build_runner build --delete-conflicting-outputs