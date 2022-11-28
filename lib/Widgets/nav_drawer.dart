import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Screens/notification_screen.dart';

import '../Services/service.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer(
      {super.key,
      required this.name,
      required this.phone,
      required this.voterId});

  final String name;
  final String phone;
  final String voterId;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 10.0),
              DrawerItems(
                  title: 'Change Password',
                  icon: Icons.lock_rounded,
                  onPressed: () => onItemPressed(context, index: 0)),
              DrawerItems(
                  title: 'About',
                  icon: Icons.info_rounded,
                  onPressed: () => onItemPressed(context, index: 1)),
              DrawerItems(
                  title: 'Help',
                  icon: Icons.help_rounded,
                  onPressed: () => onItemPressed(context, index: 2)),
              const Spacer(),
              const SizedBox(height: 10.0),
              DrawerItems(
                  title: 'Logout',
                  icon: Icons.power_settings_new_rounded,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(height: 10.0),
              const Divider(),
              const SizedBox(height: 10.0),
              const Text(
                'Version: 1.0.0',
                style: TextStyle(
                    fontSize: Constants.fontSmall,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const NotificationScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const NotificationScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const NotificationScreen()));
        break;
      case 3:
        ApiClient.logout(context);

        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    // const profilePic = '';

    return DrawerHeader(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32.0,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.person,
              size: 28.0,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: Constants.fontMedium,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Voter ID: $voterId',
                  style: const TextStyle(
                      fontSize: Constants.fontSmall,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Mobile No: +91 $phone',
                  style: const TextStyle(
                      fontSize: Constants.fontSmall,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  final String title;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 24.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 20.0),
              Text(
                title,
                style: const TextStyle(
                    fontSize: Constants.fontRegular,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
