import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:planandact/app/app.dart';
import 'package:planandact/core/time/timezone_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TimezoneService.initialize();
  await initializeDateFormatting('tr_TR', null);
  runApp(const ProviderScope(child: PlanAndActApp()));
}
