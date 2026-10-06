import '../../domain/entities/auth_method.dart';
import '../../domain/entities/auth_user.dart';

/// [AuthUser] plus JSON conversion, used only by the data layer.
class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.method,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        method: AuthMethod.values.byName(json['method'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'method': method.name,
      };
}
