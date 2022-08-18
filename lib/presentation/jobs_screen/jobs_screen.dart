import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/job_card.dart';
import 'package:goget_flutter_task/data/models/job.dart';
import 'package:goget_flutter_task/business_logic/jobs_provider.dart';
import 'package:goget_flutter_task/services/bottom_navbar/bottom_navbar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Job> jobs = Provider.of<JobsProvider>(context).getAllJobs;
    jobs.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs' Earnings"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (_, index) {
              final Job job = jobs[index];

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/job_earnings_details_screen',
                    arguments: job.id,
                  );
                },
                child: JobCard(job: job),
              );
            }),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
