import 'package:app_agendamento/features/scheduling/data/scheduling_datasource.dart';

import '../../../core/helpers/result.dart';
import '../models/scheduling.dart';

class SchedulingRepository {
  SchedulingRepository(this._datasource);
  final SchedulingDatasource _datasource;

  Future<Result<void, List<Scheduling>>> getUserSchedules() {
      return _datasource.getUserSchedules();
  }
}