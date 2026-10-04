import 'package:boy/Order_Process/floating_cash.dart';

import 'package:boy/aboutus.dart';
import 'package:boy/edit_profile.dart';
import 'package:boy/help_page.dart';
import 'package:boy/terms_and_policy.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List settingvals = [
    "My Profile",
    "Payment Setting",
    // "Place Selecting",
    // "Notification",
    "About Us",
    "terms and policy license",
    "Help",
  ];

  final setting_link = [
    editprofile(), Cash(), aboutcompany(),
    terms_and_policy(), help_page()
    // editprofile(),oders_list(),wallet(),refer_earn(),aboutus(),aboutus(),
    // aboutus(),contact()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Container(
        color: const Color.fromARGB(255, 227, 224, 224),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemCount: settingvals.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 2,
                      );
                    },
                    itemBuilder: ((context, index) {
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(settingvals[index]),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => setting_link[index])),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
