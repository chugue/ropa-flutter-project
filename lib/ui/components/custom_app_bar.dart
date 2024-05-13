import 'package:final_project_team02/ui/holder/my_page/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

import '../holder/main_holder.dart';
import '../holder/my_page/pages/cart/cart_page.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                child: Icon(setting),
              ),
              if (cart != null)
                CartPage(
                  cartIcon: cart,
                ),
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
