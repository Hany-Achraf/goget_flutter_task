import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:goget_flutter_task/data/models/job.dart';
import 'package:goget_flutter_task/data/models/expense.dart';
import 'package:goget_flutter_task/business_logic/jobs_provider.dart';

class JobExpensesScreen extends StatelessWidget {
  final int jobId;

  const JobExpensesScreen({Key? key, required this.jobId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Job job = Provider.of<JobsProvider>(context).getJobById(jobId: jobId);

    final List<Expense> expenses = job.expenses;

    return Scaffold(
      appBar: AppBar(
        title: Text('Job "${job.name}" Expenses'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (_, index) {
            final Expense expense = expenses[index];

            return Card(
              elevation: 2.0,
              child: ListTile(
                leading: const Icon(Icons.monetization_on),
                title: Text(expense.name),
                subtitle: Text(expense.cost.toString()),
                trailing: SizedBox(
                  width: 97,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/edit_expense_screen',
                              arguments: {'jobId': job.id, 'expense': expense},
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            Provider.of<JobsProvider>(context, listen: false)
                                .deleteExpenseFromJob(
                              jobId: jobId,
                              expenseId: expense.id,
                            );
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/add_expense_screen',
              arguments: job.id,
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
