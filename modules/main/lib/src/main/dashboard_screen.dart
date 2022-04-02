import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage(
              ImageConstants.payment,
              package: 'design_system',
            ),
          ),
          Image.asset(
            'assets/images/payment_money.png',
            package: 'design_system',
          ),
          SvgPicture.asset(
            'assets/icons/notification.svg',
            package: 'design_system',
          ),
          Lottie.asset(
            'assets/animations/success-animation.json',
            package: 'design_system',
            width: 72,
          ),
        ],
      )),
    );
  }
}
