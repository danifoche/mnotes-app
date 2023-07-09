import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/presentation/widgets/icons/home_icon_active.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int index;
  ValueSetter function;

  CustomBottomNavigationBar({
    super.key, 
    required this.index,
    required this.function
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  double iconsWidth = 25.0;
  double iconsHeight = 25.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            spreadRadius: 0.0,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          onTap: (int newIndex) => widget.function(newIndex),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: widget.index,
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_chat_icon.svg",
                width: iconsWidth,
                height: iconsHeight,
              ),
              label: '',
              activeIcon: const HomeIconActive(
                iconPath: "assets/icons/home_chat_icon.svg",
                color: Color(0xFF019F95),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_contacts_icon.svg",
                width: iconsWidth,
                height: iconsHeight,
              ),
              label: '',
              activeIcon: const HomeIconActive(
                iconPath: "assets/icons/home_contacts_icon.svg",
                color: Color(0xFF019F95),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_settings_icon.svg",
                width: iconsWidth,
                height: iconsHeight,
              ),
              label: '',
              activeIcon: const HomeIconActive(
                iconPath: "assets/icons/home_settings_icon.svg",
                color: Color(0xFF019F95),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
