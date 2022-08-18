import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goget_flutter_task/app_router.dart';
import 'package:goget_flutter_task/data/repositories/jobs_repository.dart';
import 'package:goget_flutter_task/business_logic/jobs_provider.dart';
import 'package:goget_flutter_task/services/bottom_navbar/bottom_navbar_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<BottomNavbarProvider>(
            create: (context) => BottomNavbarProvider(),
          ),
          ChangeNotifierProvider<JobsProvider>(
            create: (context) => JobsProvider(JobsRepository()),
          ),
        ],
        child: App(appRouter: AppRouter()),
      ),
    );

class App extends StatelessWidget {
  final AppRouter appRouter;

  const App({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoGetter Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
