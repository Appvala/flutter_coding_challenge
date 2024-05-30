import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/dropdown_bloc.dart';
import 'presentation/screens/dropdown_screen.dart';
import 'data/services/api_service.dart';
import 'presentation/screens/summary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dropdown App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) => DropdownBloc(apiService: apiService),
        child: const DropdownScreen(),
      ),
      routes: {
        SummaryScreen.routeName: (context) => const SummaryScreen(),
      },
    );
  }
}
