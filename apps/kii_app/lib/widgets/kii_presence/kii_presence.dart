import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Lightweight animated identity element for KII.
///
/// The painter listens directly to the animation, avoiding a rebuild of the
/// surrounding screen on every frame. TickerMode pauses it when not visible.
class KiiPresence extends StatefulWidget {
  const KiiPresence({super.key, this.size = 192});

  final double size;

  @override
  State<KiiPresence> createState() => _KiiPresenceState();
}

class _KiiPresenceState extends State<KiiPresence>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.size,
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _KiiPresencePainter(_controller),
        ),
      ),
    );
  }
}

class _KiiPresencePainter extends CustomPainter {
  _KiiPresencePainter(this.animation) : super(repaint: animation);

  final Animation<double> animation;

  static const Color orange = Color(0xFFFF7A1A);
  static const Color paleOrange = Color(0xFFFFA15C);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final unit = math.min(size.width, size.height);
    final progress = animation.value;
    final rotation = progress * math.pi * 2;

    final outerPaint = Paint()
      ..color = orange.withValues(alpha: 0.24)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final ringPaint = Paint()
      ..color = orange.withValues(alpha: 0.66)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.25;

    final finePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.16)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Static outer frame.
    canvas.drawCircle(center, unit * 0.46, outerPaint);
    canvas.drawCircle(center, unit * 0.405, finePaint);

    // Two orbital ellipses rotate in opposite directions.
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: unit * 0.86,
        height: unit * 0.39,
      ),
      ringPaint,
    );
    canvas.restore();

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-rotation * 0.62 - 0.55);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: unit * 0.72,
        height: unit * 0.29,
      ),
      finePaint,
    );
    canvas.restore();

    // Small moving marker on the outer orbit.
    final markerAngle = rotation - math.pi / 2;
    final marker = Offset(
      center.dx + math.cos(markerAngle) * unit * 0.43,
      center.dy + math.sin(markerAngle) * unit * 0.43,
    );
    canvas.drawCircle(
      marker,
      unit * 0.022,
      Paint()..color = paleOrange,
    );

    // Core pulse. The pulse is subtle, keeping the visual calm.
    final pulse = 0.94 + (math.sin(rotation) + 1) * 0.035;
    final coreRadius = unit * 0.145 * pulse;

    final glowPaint = Paint()
      ..color = orange.withValues(alpha: 0.13)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, unit * 0.075);
    canvas.drawCircle(center, coreRadius * 1.55, glowPaint);

    final corePaint = Paint()
      ..color = orange.withValues(alpha: 0.13)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, coreRadius, corePaint);

    canvas.drawCircle(
      center,
      coreRadius,
      Paint()
        ..color = paleOrange
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    canvas.drawCircle(
      center,
      unit * 0.043,
      Paint()..color = const Color(0xFFFFB477),
    );

    // Four restrained technical markers.
    for (var i = 0; i < 4; i++) {
      final angle = i * math.pi / 2 + math.pi / 4;
      final point = Offset(
        center.dx + math.cos(angle) * unit * 0.34,
        center.dy + math.sin(angle) * unit * 0.34,
      );
      canvas.drawCircle(
        point,
        unit * 0.009,
        Paint()..color = orange.withValues(alpha: 0.72),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _KiiPresencePainter oldDelegate) => false;
}
