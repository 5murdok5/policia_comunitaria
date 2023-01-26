import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  final Widget? child;
  final bool expand;
  final bool isVeritical;

  const ExpandedSection({
    Key? key,
    this.child,
    this.isVeritical = true,
    this.expand = false,
  }) : super(key: key);

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    prepareAnimations();
    if (widget.expand) {
      setState(() {
        expandController.forward();
      });
    }
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    Animation<double> curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: widget.isVeritical ? Axis.vertical : Axis.horizontal,
      axisAlignment: widget.isVeritical ? 1.0 : -1.0,
      sizeFactor: animation,
      child: widget.child,
    );
  }
}
