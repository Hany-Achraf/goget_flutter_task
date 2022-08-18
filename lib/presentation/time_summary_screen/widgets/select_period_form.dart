import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectPeriodForm extends StatefulWidget {
  final Function setSelectedJobs;
  const SelectPeriodForm({
    Key? key,
    required this.setSelectedJobs,
  }) : super(key: key);

  @override
  State<SelectPeriodForm> createState() => _SelectPeriodFormState();
}

class _SelectPeriodFormState extends State<SelectPeriodForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _startReportingDateController =
      TextEditingController(
          text: DateFormat('dd/MM/yyyy').format(DateTime.now()));

  DateTime _selectedStartingDate = DateTime.now();
  late String _selectedReportingPeriod;

  void _handleShowSummary() {
    if (_formKey.currentState!.validate()) {
      DateTime startReportingDate = _selectedStartingDate;
      DateTime endReportingDate = _selectedReportingPeriod == 'Week'
          ? _selectedStartingDate.add(const Duration(days: 7))
          : _selectedStartingDate.add(const Duration(days: 30));

      widget.setSelectedJobs(
        startReportingDate: startReportingDate,
        endReportingDate: endReportingDate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _startReportingDateController,
              readOnly: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range),
                labelText: 'Start Reporting Date',
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedStartingDate,
                  firstDate: DateTime(DateTime.now().year - 10),
                  lastDate: DateTime.now(),
                ).then((newDate) {
                  setState(() {
                    _selectedStartingDate = newDate!;
                    _startReportingDateController.text =
                        DateFormat('dd/MM/yyyy').format(newDate);
                  });
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid starting date';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              hint: const Text('Select reporting period'),
              items: <String>['Week', 'Month']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReportingPeriod = newValue!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select reporting period';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _handleShowSummary,
                child: const Text('Show Summary'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
