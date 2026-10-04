import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoardBtn extends StatelessWidget {
  String title;
  int index;
  void Function (int)onClick;

  BoardBtn({required this.title,required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onClick(index),

        child: Container(
          height: double.infinity,
          width: double.infinity,

          child: title.isNotEmpty
              ? title == "x"
                    ? SvgPicture.asset("assets/images/Vector 1.svg")
                    : SvgPicture.asset("assets/images/Ellipse 1.svg")
              : null,
        ),
      ),
    );
  }
}
