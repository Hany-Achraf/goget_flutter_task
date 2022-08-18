import '../models/expense.dart';
import '../models/job.dart';

class JobsRepository {
  final List<Job> _jobs = [];

  // Jobs are hardcoded here, but in real life they should be fetched from API.
  JobsRepository() {
    _jobs.addAll([
      Job(
        id: 0,
        name: 'Fixing the door',
        date: DateTime.parse('2021-05-10'),
        fee: 27.5,
        commission: 10.5,
        expenses: [
          Expense(id: 0, name: 'Transportation', cost: 3.5),
          Expense(id: 1, name: 'Buying tools', cost: 7.5),
        ],
      ),
      Job(
        id: 1,
        name: 'Create a Web Page',
        date: DateTime.parse('2021-05-12'),
        fee: 50,
        commission: 10.25,
        expenses: [
          Expense(id: 0, name: 'Internet subscription', cost: 15),
          Expense(id: 1, name: 'Technical consultation', cost: 12.5),
          Expense(id: 2, name: 'Coffee', cost: 2.25),
        ],
      ),
      Job(
        id: 2,
        name: 'Sell the car',
        date: DateTime.parse('2021-05-20'),
        fee: 350,
        commission: 110,
        expenses: [
          Expense(id: 0, name: 'Preparing car for sell', cost: 60),
          Expense(id: 1, name: 'Ads fee', cost: 35.5),
        ],
      ),
    ]);
  }

  // Get All jobs
  List<Job> get getAllJobs => _jobs;

  // Get a job by Id
  Job getJobById({required int jobId}) =>
      _jobs.firstWhere((job) => job.id == jobId);

  // Get jobs in a range of dates
  List<Job> getJobsByPeriod({
    required DateTime startReportingDate,
    required DateTime endReportingDate,
  }) =>
      _jobs
          .where((job) =>
              job.date.isAtSameMomentAs(startReportingDate) ||
              job.date.isAtSameMomentAs(endReportingDate) ||
              (job.date.isAfter(startReportingDate) &&
                  job.date.isBefore(endReportingDate)))
          .toList();

  void addExpenseToJob({
    required int jobId,
    required String expenseName,
    required double expenseCost,
  }) =>
      _jobs
          .firstWhere((job) => job.id == jobId)
          .addExpense(expenseName: expenseName, expenseCost: expenseCost);

  void editExpenseInJob({
    required int jobId,
    required int expenseId,
    required String newName,
    required double newCost,
  }) =>
      _jobs.firstWhere((job) => job.id == jobId).editExpense(
          expenseId: expenseId, newName: newName, newCost: newCost);

  void deleteExpenseFromJob({
    required int jobId,
    required int expenseId,
  }) =>
      _jobs
          .firstWhere((job) => job.id == jobId)
          .deleteExpense(expenseId: expenseId);
}
