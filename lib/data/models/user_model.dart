import '../../domain/entities/user.dart';

/// 사용자 모델 (API 응답 파싱용)
class UserModel {
  final int id;
  final String email;
  final bool isActive;
  final bool isSuperuser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.isActive,
    required this.isSuperuser,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      isActive: json['is_active'] as bool,
      isSuperuser: json['is_superuser'] as bool,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'is_active': isActive,
      'is_superuser': isSuperuser,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Domain 엔티티로 변환
  User toEntity() {
    return User(
      id: id,
      email: email,
      isActive: isActive,
      isSuperuser: isSuperuser,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

