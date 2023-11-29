import 'test.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.model.freezed.dart';
part 'package.model.g.dart';

@Freezed()
class PackageModel with _$PackageModel {

  factory PackageModel({
    required int id,
    required String name,
    required List<TestModel> tests,
    required int durationInHours,
    required int price,
    @Default(0) int? discountedPrice,
    @Default(false) bool? hasDiscount,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}
