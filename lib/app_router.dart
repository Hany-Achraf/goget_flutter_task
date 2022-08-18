import 'package:flutter/material.dart';
import 'package:goget_flutter_task/presentation/jobs_screen/jobs_screen.dart';
import 'package:goget_flutter_task/presentation/expense_form_screen/expense_form_screen.dart';
import 'package:goget_flutter_task/presentation/job_earnings_details_screen/job_earnings_details_screen.dart';
import 'package:goget_flutter_task/presentation/job_expenses_screen/job_expenses_screen.dart';
import 'package:goget_flutter_task/presentation/time_summary_screen/time_summary_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home/Jobs screen
      case '/':
        return MaterialPageRoute(
          builder: (_) => const JobsScreen(),
        );

      case '/job_expenses_screen':
        final int jobId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => JobExpensesScreen(jobId: jobId),
        );

      case '/job_earnings_details_screen':
        final int jobId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => JobEarningsDetailsScreen(jobId: jobId),
        );

      case '/add_expense_screen':
        final int jobId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => ExpenseFormScreen(jobId: jobId),
        );

      case '/edit_expense_screen':
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => ExpenseFormScreen(
            jobId: args['jobId'],
            expense: args['expense'],
          ),
        );

      case '/time_summary_screen':
        return MaterialPageRoute(
          builder: (_) => const TimeSummaryScreen(),
        );
    }
  }
}
