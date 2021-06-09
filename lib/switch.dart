import 'package:flutter/material.dart';

enum TogglerShape { Heart }

class KeepSwitch extends StatefulWidget {
  const KeepSwitch({
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.activeText = 'On',
    this.inactiveText = 'Off',
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
    this.isSwitchDisabled = false,
    this.switchHeight,
    this.switchWidth,
    this.switchButtonColor,
    Key? key,
    this.togglerShape,
    this.boxShape = BoxShape.circle,
  })  : assert(
            boxShape == null || togglerShape == null, "You can't provide both"),
        super(key: key);
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? switchButtonColor;
  final bool isSwitchDisabled;
  final double? switchHeight;
  final double? switchWidth;
  final String activeText;
  final TogglerShape? togglerShape;
  final BoxShape? boxShape;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  @override
  _KeepSwitchState createState() => _KeepSwitchState();
}

class _KeepSwitchState extends State<KeepSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: widget.isSwitchDisabled
              ? null
              : () {
                  _animationController.isCompleted
                      ? _animationController.reverse()
                      : _animationController.forward();
                  widget.value
                      ? widget.onChanged!(false)
                      : widget.onChanged!(true);
                },
          child: Container(
            width: widget.switchWidth ?? 55,
            height: widget.switchHeight ?? 27,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? widget.inactiveColor
                    : widget.activeColor ?? Theme.of(context).accentColor),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (_circleAnimation.value == Alignment.centerRight)
                      text(true)
                    else
                      const SizedBox(),
                    Align(
                      alignment: _circleAnimation.value,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: widget.togglerShape == TogglerShape.Heart
                            ? null
                            : BoxDecoration(
                                shape: widget.boxShape!,
                                color:
                                    widget.switchButtonColor ?? Colors.white),
                        child: widget.togglerShape == TogglerShape.Heart
                            ? CustomPaint(
                                size: const Size(90, 90),
                                painter: HeartPainter(
                                    widget.switchButtonColor ?? Colors.white),
                              )
                            : null,
                      ),
                    ),
                    if (_circleAnimation.value == Alignment.centerLeft)
                      text(false)
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ignore: avoid_positional_boolean_parameters
  Widget text(bool status) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 5),
      child: Text(
        status ? widget.activeText : widget.inactiveText,
        style: TextStyle(
            color: widget.inactiveTextColor,
            fontWeight: FontWeight.w900,
            fontSize: 18),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  HeartPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final width = size.width;
    final height = size.height;

    final path = Path()
      ..moveTo(0.5 * width, height * 0.35)
      ..cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
          0.5 * width, height)
      ..moveTo(0.5 * width, height * 0.35)
      ..cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
          0.5 * width, height);

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
