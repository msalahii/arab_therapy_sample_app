import 'package:arab_therapy_app/core/error/failure.dart';
import 'package:arab_therapy_app/data/models/sample_data_model.dart';
import 'package:arab_therapy_app/domain/repositories/sample_data_repo_abstraction.dart';
import 'package:get/get.dart';

enum SampleDataControllerState { initial, loading, fetchSuccess, fetchFailed }

class SampleDataController extends GetxController {
  final SampleDataRepositoryAbstraction _repository;

  SampleDataController({required SampleDataRepositoryAbstraction repository}) : _repository = repository;

  final state = SampleDataControllerState.initial.obs;
  final sampleDataList = RxList<SampleDataModel>();
  final failure = Rx<Failure?>(null);

  @override
  onReady() {
    fetchList();
  }

  fetchList() async {
    if (state.value == SampleDataControllerState.loading) {
      return;
    }

    state.value = SampleDataControllerState.loading;
    final result = await _repository.fetchPhotosList();
    result.fold((failure) {
      this.failure.value = failure;
      state.value = SampleDataControllerState.fetchFailed;
    }, (fetchedList) {
      sampleDataList.value = fetchedList;
      state.value = SampleDataControllerState.fetchSuccess;
    });
  }
}
