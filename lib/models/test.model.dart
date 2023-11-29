import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.model.freezed.dart';
part 'test.model.g.dart';

@Freezed()
class TestModel with _$TestModel {
  const factory TestModel({
    required int id,
    required String name,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
