import 'package:flutter/material.dart';

class AnimatedFAB extends StatefulWidget {
  final double actionBoxHeight;
  final double actionBoxWidth;
  final Widget actionBox;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final int durationInMilliseconds;
  final double buttonDistanceFromButton;
  final double buttonBorderRadius;

  const AnimatedFAB({
    super.key,
    required this.actionBox,
    this.actionBoxHeight = 200,
    this.actionBoxWidth = 200,
    this.buttonColor = Colors.blue,
    this.buttonHeight = 60,
    this.buttonWidth = 60,
    this.durationInMilliseconds = 300,
    this.buttonDistanceFromButton = 15,
    this.buttonBorderRadius = 18,

  });
  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB> with SingleTickerProviderStateMixin {
  bool _isButtonPressed = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliseconds),
    );
  }

  void _toggleAnimation() {
    setState(() {
      _isButtonPressed = !_isButtonPressed;
      if (_isButtonPressed) {
        _animationController.forward();
      } else {
        _animationController.reverse().then((_) {
          setState(() {
            _isWidgetShowed = false;
          });
        });
      }
    });
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  bool _isWidgetShowed = false;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRect(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: widget.durationInMilliseconds),
                    curve: Curves.easeInOut,
                    width: _isButtonPressed? widget.actionBoxWidth : 0,
                    height: _isButtonPressed? widget.actionBoxHeight : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
                    ),
                    child: _isButtonPressed?OverflowBox(
                      maxHeight: widget.actionBoxHeight,
                      maxWidth: widget.actionBoxWidth,
                      child: widget.actionBox,
                    ): null,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: widget.buttonDistanceFromButton),
                  height: widget.buttonHeight,
                  width: widget.buttonWidth,
                  decoration: BoxDecoration(
                    color: widget.buttonColor,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: IconButton(
                    icon: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animationController.value * 0.5 * 3.1415,
                          child: child,
                        );
                      },
                      child: Icon(
                        _isButtonPressed ? Icons.close : Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _toggleAnimation,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}