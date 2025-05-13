
import 'package:flutter/material.dart';
import 'package:carrental/resourse/style/color_manager.dart';
import 'package:carrental/resourse/style/size_manager.dart';


class AccentButton extends StatelessWidget {
  final bool isIconButton;
  final bool transparentBackground;
  final String label;
  final IconData? icon;
  final Widget? imageWidget;
  final VoidCallback onPressed;

  const AccentButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon, // Image or icon is required
    this.imageWidget, // Image or icon is required
    this.isIconButton = false,
    this.transparentBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstLabel = label;
    String secondLabel = '';

    if (label.length >= 9) {
      List<String> titles = label.split(' ');
      firstLabel = titles[0];

      if (titles[1].isNotEmpty) {
        secondLabel = label.substring(firstLabel.length + 1);
      }
    }

    return Container(
      height: SizeManager.size_10,
      child: GestureDetector(
        onTap: onPressed,
        child: Semantics(
          label: label,
          excludeSemantics: true,
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(SizeManager.CARD_RADIUS),
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(SizeManager.PADDING),
                    child: isIconButton
                        ? Icon(
                            icon,
                            color: ColorManager.deepBlack,
                            size: SizeManager.ICON_SIZE_SM,
                          )
                        : Ink(
                            decoration: ShapeDecoration(
                              color: transparentBackground
                                  ? null
                                  : isIconButton
                                      ? Colors.teal
                                      : ColorManager.iconBackground,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Semantics(
                                label: label,
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.circular(SizeManager.BOX_RADIUS),
                                  child: imageWidget,
                                ),
                              ),
                              color: Colors.white,
                              iconSize: SizeManager.ICON_SIZE_SM,
                              onPressed: onPressed,
                            ),
                          ),
                  ),
                ),
              ),
              Text(firstLabel, textAlign: TextAlign.center, style: TextStyle(fontSize: SizeManager.BUTTON_SECONDARY_TEXT_SIZE)),
              secondLabel.isNotEmpty ? Text(secondLabel, textAlign: TextAlign.center, style: TextStyle(fontSize: SizeManager.BUTTON_SECONDARY_TEXT_SIZE)) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
