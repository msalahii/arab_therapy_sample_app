import 'package:arab_therapy_app/core/network/network_adapter.dart';
import 'package:arab_therapy_app/core/network/network_router.dart';
import 'package:arab_therapy_app/data/models/sample_data_model.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/network/response_model.dart';

abstract class SampleDataRemoteDataSourceAbstraction {
  Future<Either<Failure, List<SampleDataModel>>> fetchPhotosList();
}

class SampleDataRemoteDataSource implements SampleDataRemoteDataSourceAbstraction {
  final NetworkAdapterAbstraction _networkAdapter;
  SampleDataRemoteDataSource({required NetworkAdapterAbstraction networkAdapter}) : _networkAdapter = networkAdapter;

  @override
  Future<Either<Failure, List<SampleDataModel>>> fetchPhotosList() async {
    final response = await _networkAdapter.request(NetworkRoute.fetchSampleDataList, RequestType.get, {});
    if (response.responseStatus == ResponseStatus.success) {
      return Right(SampleDataModel.decodeList(response.data));
    } else {
      return Left(response.failure!);
    }
  }
}
