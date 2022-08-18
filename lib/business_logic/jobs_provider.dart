import 'package:flutter/material.dart';
import 'package:goget_flutter_task/data/models/job.dart';
import 'package:goget_flutter_task/data/repositories/jobs_repository.dart';

class JobsProvider extends ChangeNotifier {
  final JobsRepository _jobsRepository;

  // Inject the jobs repository into the provider
  JobsProvider(this._jobsRepository);

  // Fetch all the jobs in the repository.
  List<Job> get getAllJobs => _jobsRepository.getAllJobs;

  Job getJobById({required int jobId}) =>
      _jobsRepository.getJobById(jobId: jobId);

  List<Job> getJobsByPeriod({
    required DateTime startReportingDate,
    required DateTime endReportingDate,
  }) =>
      _jobsRepository.getJobsByPeriod(
        startReportingDate: startReportingDate,
        endReportingDate: endReportingDate,
      );

  void addExpenseToJob({
    required int jobId,
    required String expenseName,
    required double expenseCost,
  }) {
    _jobsRepository.addExpenseToJob(
        jobId: jobId, expenseName: expenseName, expenseCost: expenseCost);

    // Update listeners (UI).
    notifyListeners();
  }

  void editExpenseInJob({
    required int jobId,
    required int expenseId,
    required String newName,
    required double newCost,
  }) {
    _jobsRepository.editExpenseInJob(
        jobId: jobId, expenseId: expenseId, newName: newName, newCost: newCost);

    notifyListeners();
  }

  void deleteExpenseFromJob({
    required int jobId,
    required int expenseId,
  }) {
    _jobsRepository.deleteExpenseFromJob(jobId: jobId, expenseId: expenseId);

    notifyListeners();
  }
}
