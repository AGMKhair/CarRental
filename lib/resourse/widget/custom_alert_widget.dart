import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:carrental/resourse/style/size_manager.dart';
import 'package:carrental/resourse/util/string_dictionary.dart';
import 'package:carrental/resourse/widget/space_widget.dart';

class CustomAlertDialog {
  CustomAlertDialog({
    this.title = StringDictionary.ERROR,
    this.description = StringDictionary.ERROR_MESSAGE,
    this.cancelTitle,
    this.okTitle,
    required this.onAlertAction,
  });

  String? title;
  String? description;
  String? cancelTitle;
  String? okTitle;
  Function onAlertAction;

  void show(BuildContext context) {
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return _getAlertDialog(context);
      },
    );
  }

  Widget _getAlertDialog(BuildContext context) {
    return AlertDialog(
      semanticLabel: StringDictionary.ALERT_DIALOG,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeManager.DIALOG_RADIUS),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: contentBox(context),
    );
  }

  contentBox(context) {
    const padding = SizeManager.DIALOG_RADIUS;

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: padding, top: padding * 1.5, right: padding, bottom: padding),
          decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(padding), boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Space(times: 1.5),
              Text(
                description!,
                style: TextStyle(fontSize: SizeManager.text_size_22),
                textAlign: TextAlign.left,
              ),
              Space(times: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  cancelTitle != null
                      ? TextButton(
                          child: Text(cancelTitle!),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      : Container(),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      description!.startsWith(StringDictionary.UPDATE_MESSAGE) ? LaunchReview.launch() : onAlertAction();
                    },
                    child: Text(okTitle ?? StringDictionary.OK),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
