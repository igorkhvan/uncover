import 'package:flutter/material.dart';
import 'package:uncover/logic/models/stranger_model.dart';

class StrangerTile extends StatelessWidget {
  final StrangerModel? stranger;
  final VoidCallback? longPressCallback;
  final VoidCallback? shortPressCallback;

  const StrangerTile({
    super.key,
    this.stranger,
    this.longPressCallback,
    this.shortPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (longPressCallback != null) longPressCallback;
      },
      onTap: () {
        if (shortPressCallback != null) shortPressCallback;
      },
      child: SizedBox(
        height: 80.0,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 70.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100.0,
                      ),
                      Text(
                        stranger!.firstName ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              child: Image.network(
                stranger!.avatar!,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0.0,
              child: Card(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                child: Image.asset(
                  'assets/emoji/Angry 01.png',
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
