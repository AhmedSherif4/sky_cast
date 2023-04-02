import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SnackBar errorMessageSnackBar(String textError) {
  return SnackBar(
    content: Stack(clipBehavior: Clip.none, children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFFC72C41),
        ),
        height: 90,
        child: Row(
          children: [
            const SizedBox(
              width: 48,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Oh snap!',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    textError,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(20)),
          child: SvgPicture.asset(
            "assets/icons/bubbles.svg",
            height: 48,
            width: 40,
            color: const Color(0xFF801336),
          ),
        ),
      ),
      Positioned(
        top: -20,
        left: 0,
        child: Stack(alignment: Alignment.center, children: [
          SvgPicture.asset(
            "assets/icons/fail.svg",
            height: 40,
            color: const Color(0xFF801336),
          ),
          Positioned(
            top: 10,
            child: SvgPicture.asset(
              "assets/icons/close.svg",
              height: 16,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    ]),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
