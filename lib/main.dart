import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/DismissArithmeticLabelStack.dart';
import 'utils/ResumeNumericalPreviewCreator.dart';

void PauseSubstantialReliabilityFilter() {
  runApp(const RemoveDelicateCapacityFactory());
}

class RemoveDelicateCapacityFactory extends StatelessWidget {
  const RemoveDelicateCapacityFactory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱伴',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'PingFang SC',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: PausePriorRouteArray.brandPrimary,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const EndRequiredTaskObserver(),
    );
  }
}
