import 'expense.dart';

class Job {
  final int id;
  final String name;
  final DateTime date;
  final double fee;
  final double commission;
  final List<Expense> expenses;

  Job({
    required this.id,
    required this.name,
    required this.date,
    required this.fee,
    required this.commission,
    required this.expenses,
  });

  void addExpense({required String expenseName, required double expenseCost}) =>
      expenses.add(
          Expense(id: expenses.length, name: expenseName, cost: expenseCost));

  void editExpense({
    required int expenseId,
    required String newName,
    required double newCost,
  }) {
    final targetedExpense =
        expenses.firstWhere((expense) => expense.id == expenseId);
    targetedExpense.name = newName;
    targetedExpense.cost = newCost;
  }

  void deleteExpense({required expenseId}) =>
      expenses.removeWhere((expense) => expense.id == expenseId);

  double getTotalCost() {
    double totalCost = 0;
    for (Expense expense in expenses) {
      totalCost += expense.cost;
    }
    return totalCost;
  }

  double getNetEarning() => fee + commission - getTotalCost();
}
