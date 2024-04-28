import 'package:final_project_team02/holder/cart/cart_page.dart';
import 'package:final_project_team02/holder/profile/settings_page.dart';
import 'package:flutter/material.dart';

import '../holder/cart/cart_page_view_model.dart';
import '../holder/main_holder.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final home;
  final setting;
  final cart;

  const CustomAppBar({
    required this.home,
    required this.setting,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainHolder()),
              );
            },
            child: Icon(home),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                child: Icon(setting),
              ),
              CartPage(cartIcon: cart,),
            ],
          )

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

