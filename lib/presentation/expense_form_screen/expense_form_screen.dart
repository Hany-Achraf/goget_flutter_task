import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goget_flutter_task/data/models/expense.dart';
import 'package:goget_flutter_task/business_logic/jobs_provider.dart';

class ExpenseFormScreen extends StatefulWidget {
  final int jobId;
  final Expense? expense;

  const ExpenseFormScreen({Key? key, required this.jobId, this.expense})
      : super(key: key);

  @override
  State<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends State<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _expenseNameController;
  late TextEditingController _expenseCostController;

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (widget.expense == null) {
        Provider.of<JobsProvider>(context, listen: false).addExpenseToJob(
          jobId: widget.jobId,
          expenseName: _expenseNameController.text,
          expenseCost: double.parse(_expenseCostController.text),
        );
      } else {
        Provider.of<JobsProvider>(context, listen: false).editExpenseInJob(
          jobId: widget.jobId,
          expenseId: widget.expense!.id,
          newName: _expenseNameController.text,
          newCost: double.parse(_expenseCostController.text),
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting Expense')),
      );

      Timer(const Duration(milliseconds: 1500), () => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    _expenseNameController = TextEditingController(text: widget.expense?.name);
    _expenseCostController =
        TextEditingController(text: widget.expense?.cost.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.expense == null ? 'Add Expense' : 'Edit Expense'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _expenseNameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _expenseCostController,
                  decoration: const InputDecoration(
                    labelText: 'Cost',
                  ),
                  validator: (value) {
                    if (double.tryParse(value!) == null) {
                      return 'Please enter a valid cost';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
