import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingLess extends StatelessWidget {
  const AppLoadingLess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      child: SpinKitDualRing(
        color: Colors.black45,
        size: 40.0,
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
