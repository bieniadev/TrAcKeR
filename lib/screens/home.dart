import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tracker/components/appbar.dart';
import 'package:tracker/components/expences_list.dart';
import 'package:tracker/components/floating_button.dart';
import 'package:tracker/components/statistics.dart';
import 'package:tracker/components/circle_chart.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        appBar: AppBarSwitchable(),
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              SizedBox(height: 4),
              Statistics(),
              SizedBox(height: 6),
              CircleChart(),
              SizedBox(height: 6),
              ExpencesList(),
            ],
          ),
        ));
  }
}
