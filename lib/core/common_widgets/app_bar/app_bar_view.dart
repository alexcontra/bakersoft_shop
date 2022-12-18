import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../specs/assets.dart';
import '../../../specs/colors.dart';
import '../../../specs/constraints.dart';
import '../../routes/navigator_routes.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final double appBarHeight = Heights.H_64;
  final void Function()? onPressedMenu;
  final bool isProfile;
  final bool isShoppingCart;
  final bool isBackButton;
  final String title;

  CustomAppBar(
      {this.onPressedMenu,
      this.isProfile = true,
      this.isShoppingCart = true,
      this.isBackButton = false,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AppBar(
        backgroundColor: AppColors.WHITE,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: Paddings.P_8),
          child: Row(
            children: [
              Visibility(
                visible: widget.isBackButton,
                replacement: SizedBox(
                  width: Paddings.P_32,
                  child: IconButton(
                      splashRadius: 0.1,
                      padding: EdgeInsets.only(left: Paddings.P_8),
                      icon: SvgPicture.asset(
                        Assets.MENU,
                        width: 20,
                        height: 23,
                        color: AppColors.DARK_GREEN,
                      ),
                      onPressed: null),
                ),
                child: SizedBox(
                  width: Paddings.P_32,
                  child: IconButton(
                    splashRadius: 0.1,
                    padding: EdgeInsets.only(left: Paddings.P_8),
                    icon: SvgPicture.asset(
                      Assets.BACK_ARROW,
                      width: 20,
                      height: 23,
                      color: AppColors.DARK_GREEN,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.DARK_GREEN,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Paddings.P_8),
            child: Row(
              children: [
                Visibility(
                  visible: widget.isShoppingCart,
                  child: Container(
                    padding: EdgeInsets.only(right: Paddings.P_6),
                    width: 50,
                    child: IconButton(
                      splashRadius: 0.1,
                      iconSize: 45,
                      onPressed: () {
                        getToBagPage(context);
                      },
                      icon: SvgPicture.asset(
                        Assets.SHOPPING_CART,
                        color: AppColors.DARK_GREEN,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.isProfile,
                  child: SizedBox(
                    width: 50,
                    child: IconButton(
                      splashRadius: 0.1,
                      iconSize: 45,
                      onPressed: null,
                      icon: SvgPicture.asset(
                        Assets.PROFILE_PAGE,
                        color: AppColors.LIGHT_GREY,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
