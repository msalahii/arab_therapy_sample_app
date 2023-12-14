import 'package:arab_therapy_app/data/models/sample_data_model.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';

abstract class SampleDataRepositoryAbstraction {
  Future<Either<Failure, List<SampleDataModel>>> fetchPhotosList();
}
