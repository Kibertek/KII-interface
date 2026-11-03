import 'package:flutter/material.dart';

/// Initial lightweight placeholder for KII Presence.
///
/// The animated implementation will be added as a separate, optimized
/// component so it can also be reused by the floating companion.
class KiiPresence extends StatelessWidget {
  const KiiPresence({super.key, this.size = 176});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size * 0.92,
            height: size * 0.92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x55FF7A1A),
                width: 1,
              ),
            ),
          ),
          Transform.rotate(
            angle: -0.55,
            child: Container(
              width: size * 0.78,
              height: size * 0.42,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0x99FF7A1A),
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(size),
              ),
            ),
          ),
          Container(
            width: size * 0.36,
            height: size * 0.36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFF7A1A).withValues(alpha: 0.12),
              border: Border.all(
                color: const Color(0xFFFF8A32),
                width: 1.5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x55FF7A1A),
                  blurRadius: 28,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: size * 0.12,
                height: size * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF9A52),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
