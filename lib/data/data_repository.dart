import 'package:alemeno_intern/models/package.model.dart';
import 'api_client.dart';

class DataRepository {
  final ApiClient apiClient;

  DataRepository(this.apiClient);

  Future<List<PackageModel>> fetchAllLabTests() async {
    final data = await apiClient.fetchData('labTests');
    final packageJsonList = data['data'] as List<dynamic>;

    List<PackageModel> packages = [];

    for (final package in packageJsonList) {
      packages.add(PackageModel.fromJson(package));
    }

    return packages;
  }

  Future<List<PackageModel>> fetchAllPackages() async {
    final data = await apiClient.fetchData('packages');
    final packageJsonList = data['data'] as List<dynamic>;

    List<PackageModel> packages = [];

    for (final package in packageJsonList) {
      packages.add(PackageModel.fromJson(package));
    }

    return packages;
  }
}
