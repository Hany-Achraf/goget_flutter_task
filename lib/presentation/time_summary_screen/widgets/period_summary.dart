import 'package:flutter/material.dart';
import 'package:goget_flutter_task/data/models/job.dart';

class PeriodSummary extends StatelessWidget {
  final List<Job> jobs;

  const PeriodSummary({Key? key, required this.jobs}) : super(key: key);

  double _getJobsTotalFee() {
    double totalFee = 0;
    for (Job job in jobs) {
      totalFee += job.fee;
    }
    return totalFee;
  }

  double _getJobsTotalCommission() {
    double totalCommission = 0;
    for (Job job in jobs) {
      totalCommission += job.commission;
    }
    return totalCommission;
  }

  double _getJobsTotalCost() {
    double totalCost = 0;
    for (Job job in jobs) {
      totalCost += job.getTotalCost();
    }
    return totalCost;
  }

  double _getJobsTotalNetEarning() {
    double totalNetEarning = 0;
    for (Job job in jobs) {
      totalNetEarning += job.getNetEarning();
    }
    return totalNetEarning;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Row(
              children: [
                const Text(
                  'Total Fee: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text('${_getJobsTotalFee()}'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Row(
              children: [
                const Text(
                  'Total Commission: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text('${_getJobsTotalCommission()}'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Row(
              children: [
                const Text(
                  'Total Cost: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text('${_getJobsTotalCost()}'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Row(
              children: [
                const Text(
                  'Total Net Earning: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text('${_getJobsTotalNetEarning()}'),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final Job job = jobs[index];
              return Card(
                elevation: 2.0,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.task),
                      title: Text(job.name),
                      subtitle: Text(job.date.toIso8601String()),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Total Fee: ${job.fee}'),
                          Text('Commission: ${job.commission}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
