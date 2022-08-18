import 'package:flutter/material.dart';
import 'package:goget_flutter_task/data/models/job.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: Text(job.name),
            subtitle: Text(job.date.toIso8601String()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Total Fee: ${job.fee}'),
                  Text('Commission: ${job.commission}'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/job_expenses_screen',
                      arguments: job.id,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text('Expenses'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
