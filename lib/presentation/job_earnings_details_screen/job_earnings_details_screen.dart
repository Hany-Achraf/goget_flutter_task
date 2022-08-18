import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goget_flutter_task/presentation/job_earnings_details_screen/widgets/job_detail_row.dart';
import 'package:goget_flutter_task/data/models/job.dart';
import 'package:goget_flutter_task/business_logic/jobs_provider.dart';

class JobEarningsDetailsScreen extends StatelessWidget {
  final int jobId;

  const JobEarningsDetailsScreen({
    Key? key,
    required this.jobId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Job job = Provider.of<JobsProvider>(context).getJobById(jobId: jobId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Earnings Details'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              JobDetailRow(title: 'Job Name: ', value: job.name),
              JobDetailRow(title: 'Date & Time: ', value: '${job.date}'),
              JobDetailRow(title: 'Fee: ', value: '${job.fee}'),
              JobDetailRow(title: 'Commission: ', value: '${job.commission}'),
              JobDetailRow(title: 'Cost: ', value: '${job.getTotalCost()}'),
              JobDetailRow(
                  title: 'Net Earning: ', value: '${job.getNetEarning()}'),
            ],
          ),
        ),
      ),
    );
  }
}
