import 'package:flutter/material.dart';
import 'package:carrental/resourse/style/size_manager.dart';
import 'package:carrental/resourse/widget/online_image_widget.dart';

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 7/3/24
 */

class CardImage extends StatelessWidget {
  final String? imageUrl;
  final Function onClick;
  CardImage({
    super.key,
    this.imageUrl = '',
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Card(
        elevation: 6.0,
        color: Colors.amber,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: OnlineImage(imageUrl!),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 30,
                  color: Colors.black38,
                  child: SingleChildScrollView(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SizeManager.PADDING),
                      child: Text(
                        textAlign: TextAlign.justify,
                        'This is the Main Title in this blog  fsfs fs sd fsdf',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
