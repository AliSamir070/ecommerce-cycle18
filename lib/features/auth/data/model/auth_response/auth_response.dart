import 'package:ecommerce_app/features/auth/data/model/auth_response/user.dart';
import 'package:ecommerce_app/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "statusMsg")
  final String? statusMsg;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "token")
  final String? token;

  AuthResponse({
    this.statusMsg,
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }

// Mapper function to entity
 AuthEntity toEntity(){
    return AuthEntity(token);
 }
}



