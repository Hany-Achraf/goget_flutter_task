import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goget_flutter_task/data/models/job.dart';
import 'package:goget_flutter_task/business_logic/jobs_provider.dart';
import 'package:goget_flutter_task/presentation/time_summary_screen/widgets/select_period_form.dart';
import 'package:goget_flutter_task/services/bottom_navbar/bottom_navbar.dart';
import 'package:goget_flutter_task/services/bottom_navbar/bottom_navbar_provider.dart';
import 'package:goget_flutter_task/presentation/time_summary_screen/widgets/period_summary.dart';

class TimeSummaryScreen extends StatefulWidget {
  const TimeSummaryScreen({Key? key}) : super(key: key);

  @override
  State<TimeSummaryScreen> createState() => _TimeSummaryScreenState();
}

class _TimeSummaryScreenState extends State<TimeSummaryScreen> {
  List<Job>? _selectedJobs;

  void _setSelectedJobs({
    required DateTime startReportingDate,
    required DateTime endReportingDate,
  }) {
    setState(() {
      _selectedJobs = Provider.of<JobsProvider>(context, listen: false)
          .getJobsByPeriod(
              startReportingDate: startReportingDate,
              endReportingDate: endReportingDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<BottomNavbarProvider>(context, listen: false)
            .changeIndex(index: 0);
        Navigator.popUntil(context, (route) => route.isFirst);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Jobs Summaries'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SelectPeriodForm(setSelectedJobs: _setSelectedJobs),
              _selectedJobs == null
                  ? Container()
                  : _selectedJobs!.isEmpty
                      ? const Center(child: Text('No Jobs!'))
                      : PeriodSummary(jobs: _selectedJobs!),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavbar(),
      ),
    );
  }
}
