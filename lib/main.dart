import 'package:counter_task/bloc/events.dart';
import 'package:counter_task/bloc/search_bloc.dart';
import 'package:counter_task/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Form Validation Example'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (value) {
                      context.read<SearchBloc>().add(QueryChanged(value));
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'must not be empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

