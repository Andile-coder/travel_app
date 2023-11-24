import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/navpages/home_page.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitsLogic extends StatefulWidget {
  const AppCubitsLogic({Key? key}) : super(key: key);
  @override
  _AppCubitsLogicState createState() => _AppCubitsLogicState();
}

class _AppCubitsLogicState extends State<AppCubitsLogic> {
  @override
  Widget build(context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        } else if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return MainPage();
        } else if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
