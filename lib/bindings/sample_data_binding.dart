import 'package:arab_therapy_app/data/data_sources/sample_data_remote_data_source.dart';
import 'package:arab_therapy_app/data/repositories/sample_data_repo.dart';
import 'package:arab_therapy_app/domain/repositories/sample_data_repo_abstraction.dart';
import 'package:get/get.dart';

class SampleDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleDataRemoteDataSourceAbstraction>(() => SampleDataRemoteDataSource(networkAdapter: Get.find()));
    Get.lazyPut<SampleDataRepositoryAbstraction>(
        () => SampleDataRepository(remoteDataSource: Get.find(), connectivity: Get.find()));
  }
}
