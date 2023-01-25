import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proses/source/data/auth/cubit/login_cubit.dart';
import 'package:proses/source/data/auth/cubit/splassh_cubit.dart';
import 'package:proses/source/data/home/cubit/detail_cubit.dart';
import 'package:proses/source/network/network.dart';
import 'package:proses/source/repository/repository.dart';
import 'package:proses/source/router/router.dart';

void main() {
  runApp(MyApp(
    repository: MyRepository(myNetwork: MyNetwork()),
    router: RouterNavigation(),
  ));
}

class MyApp extends StatelessWidget {
  final MyRepository? repository;
  final RouterNavigation? router;

  const MyApp({super.key, this.repository, this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplasshCubit(myRepository: repository),
        ),
        BlocProvider(
          create: (loginContext) => LoginCubit(myRepository: repository),
        ),
        BlocProvider(
          create: (detailContext) => DetailCubit(myRepository: repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router!.generateRoute,
      ),
    );
  }
}
