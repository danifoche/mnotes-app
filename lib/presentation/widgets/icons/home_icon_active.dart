import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeIconActive extends StatefulWidget {

  final String iconPath;
  final Color color;

  const HomeIconActive({
    super.key,
    required this.iconPath,
    required this.color,
  });

  @override
  State<HomeIconActive> createState() => _HomeIconActiveState();
}

class _HomeIconActiveState extends State<HomeIconActive> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          widget.iconPath,
          width: 25.0,
          height: 25.0,
          colorFilter: ColorFilter.mode(
            widget.color, 
            BlendMode.srcIn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
          ),
          child: SvgPicture.asset(
            "assets/icons/home_ellipse_icon.svg",
            colorFilter: ColorFilter.mode(
              widget.color, 
              BlendMode.srcIn,
            ),
          ),
        )
      ],
    );
  }
}