import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/view/profileScreen/profile.screen.dart';

import '../../app/app.color.constant.dart';

Widget drawerWidget(BuildContext context) {
  return Drawer(
    backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(),
          currentAccountPicture: CircleAvatar(
            radius: 32.r,
            backgroundColor: AppColors.activeColor,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              child: CircleAvatar(
                radius: 30.r,
                child: Image.asset("name"),
              ),
            ),
          ),
          accountName: Text(
            "Inductus Jobs",
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(fontSize: 18.sp),
            ),
          ),
          accountEmail: Text(
            "vivek.yadav@inductusgroup.com",
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(fontSize: 12.sp),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.account_circle_rounded,
          ),
          title: const Text('Profile '),
          onTap: () {},
        ),
        const ListTile(
          leading: Icon(
            Icons.cabin,
          ),
          title: Text(
            'Cart',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        )
      ],
    ),
  );
}
