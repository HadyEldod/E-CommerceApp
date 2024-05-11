import 'package:e_store/config/routes/routes.dart';
import 'package:e_store/core/utils/app_images.dart';
import 'package:e_store/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
                width: 150,
                height: 150,
                child: Image.asset(AppImages.logOut)),
            const Text(
              "Do You Want To LogOut !!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                CacheHelper.removeDate("User");
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
              child: const Text(
                "Press Here",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Colors.blue),
              ),
            ),
      /*      IconButton(
                onPressed: () {
                  CacheHelper.removeDate("User");
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.login, (route) => false);
                },
                icon: Icon(Icons.logout))
      */    ],
        ),
      ),
    );
  }
}
