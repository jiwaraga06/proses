import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proses/source/data/auth/cubit/splassh_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplasshCubit>(context).session(context);
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}