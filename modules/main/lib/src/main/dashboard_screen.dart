import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_engine/app_engine.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:profile/profile.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = 'dashboard';

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
        actions: [
          IconButton(
            onPressed: onTapChangeTheme,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(S.of(context).helloWorld),
          Text(S.current.helloWorld),
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
          const UserAvatar(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/edit-profile');
            },
            child: const Text('/edit-profile'),
          ),

          const ProfileScreen(),
        ],
      )),
    );
  }

  void onTapChangeTheme() {
    if (Theme.of(context).brightness == Brightness.dark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }
}
