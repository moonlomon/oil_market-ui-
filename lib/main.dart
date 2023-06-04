import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:intl/date_symbol_data_http_request.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:oil_market/database/drift_database.dart';
import 'package:oil_market/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 플러터가 준비될 때까지 대기 => 초기화작업 노란불

  await initializeDateFormatting(); // init 초기화

  final database = LocalDatabase(); // 데이터베이스 생성

  // GetIt = Provider같은 역할, GetIt.I = GetIt의 전역
  // 싱글톤(인스턴스가 1개)으로 GetIt에 데이터베이스 등록 => 다론 곳에서 데이터베이스 호출 가능
  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}