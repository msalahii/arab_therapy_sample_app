import 'package:arab_therapy_app/core/error/failure.dart';
import 'package:arab_therapy_app/data/data_sources/sample_data_remote_data_source.dart';
import 'package:arab_therapy_app/data/models/sample_data_model.dart';
import 'package:arab_therapy_app/domain/repositories/sample_data_repo_abstraction.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class SampleDataRepository implements SampleDataRepositoryAbstraction {
  final Connectivity _connectivity;
  final SampleDataRemoteDataSourceAbstraction _remoteDataSource;

  SampleDataRepository(
      {required Connectivity connectivity, required SampleDataRemoteDataSourceAbstraction remoteDataSource})
      : _connectivity = connectivity,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<SampleDataModel>>> fetchPhotosList() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      return await _remoteDataSource.fetchPhotosList();
    } else {
      return Left(InternetFailure());
    }
  }
}
