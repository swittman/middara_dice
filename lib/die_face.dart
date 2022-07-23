import 'package:flutter/material.dart';

import 'middara_dice_icons.dart';

enum DieIcon { blank, shield, book, star, skull }

class DieFace extends StatelessWidget {
  const DieFace({
    Key? key,
    this.color = const Color(0xFF222222),
    this.inkColor = const Color(0xFFEEEEEE),
    this.number,
    this.iconTL = DieIcon.blank,
    this.iconTR = DieIcon.blank,
    this.iconBL = DieIcon.blank,
    this.iconBR = DieIcon.blank,
  }) : super(key: key);

  final Color color, inkColor;
  final DieIcon iconTL, iconTR, iconBL, iconBR;
  final int? number;

  // These are divisors, so a larger number is a smaller icon.
  static int largeIconScale = 3;
  static int smallIconScale = 5;
  static int iconPaddingScale = 10;
  static int textScale = 3;
  static int skullScale = 2;
  static int radiusScale = 20;

  IconData? _iconFromEnum(DieIcon iconEnum) {
    switch (iconEnum) {
      case DieIcon.shield:
        return MiddaraDiceIcons.shield;
      case DieIcon.book:
        return MiddaraDiceIcons.book;
      case DieIcon.star:
        return MiddaraDiceIcons.burst;
      case DieIcon.skull:
        return MiddaraDiceIcons.skull;
      case DieIcon.blank:
      default:
        return null;
    }
  }

  Container _containerForIcon(
      DieIcon icon, Alignment alignment, BoxConstraints constraint) {
    return Container(
      margin: EdgeInsets.all(constraint.maxHeight / iconPaddingScale),
      alignment: alignment,
      child: Icon(_iconFromEnum(icon),
          color: inkColor,
          size: constraint.maxHeight /
              (number == null ? largeIconScale : smallIconScale)),
    );
  }

  bool _hasSkull() {
    return iconTL == DieIcon.skull ||
        iconTR == DieIcon.skull ||
        iconBL == DieIcon.skull ||
        iconBR == DieIcon.skull;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                    Radius.circular(constraint.maxHeight / radiusScale))),
            child: (_hasSkull()
                ? Container(
                    alignment: Alignment.center,
                    child: Icon(_iconFromEnum(DieIcon.skull),
                        color: inkColor,
                        size: constraint.maxHeight / skullScale),
                  )
                : Stack(
                    children: <Widget>[
                      _containerForIcon(iconTL, Alignment.topLeft, constraint),
                      _containerForIcon(iconTR, Alignment.topRight, constraint),
                      _containerForIcon(
                          iconBL, Alignment.bottomLeft, constraint),
                      _containerForIcon(
                          iconBR, Alignment.bottomRight, constraint),
                      if (number != null)
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            number.toString(),
                            style: TextStyle(
                                color: inkColor,
                                fontFamily: "Cinzel",
                                fontSize: constraint.maxHeight / textScale),
                          ),
                        ),
                    ],
                  )),
          );
        },
      ),
    );
  }
}
