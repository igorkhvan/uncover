import 'package:flutter/material.dart';
import 'package:uncover/logic/models/stranger_model.dart';

class StrangerTile extends StatelessWidget {
  final StrangerModel? stranger;
  final Function? longPressCallback;
  final Function? shortPressCallback;

  const StrangerTile({
    super.key,
    this.stranger,
    required this.longPressCallback,
    required this.shortPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (longPressCallback != null) longPressCallback!();
      },
      onTap: () {
        if (shortPressCallback != null) shortPressCallback!();
      },
      child: SizedBox(
        height: 80.0,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 70.0,
                  child: Card(
                    elevation: 0.0,
                    color: Colors.white.withAlpha(120),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 80.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${stranger!.firstName ?? ''} ${stranger!.lastName ?? ''}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withAlpha(180)),
                              ),
                              Text(
                                stranger!.interestsDescription ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black.withAlpha(180)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
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
                  'assets/emoji/${stranger?.mood! ?? 'mood-00023'}.png',
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
