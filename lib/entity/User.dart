import 'package:flutter_first_app/entity/Address.dart';

/// 1. 导包
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'User.g.dart'; // 2. 引入 generated 生成的代码

/// 3. 添加注解
@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;
  final Address? address;

  User(this.id, this.name, this.email, this.address);

  /// 4. 使用生成的序列化方法
  ///
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
