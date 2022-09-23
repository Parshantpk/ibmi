import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.child, this.height, this.width})
      : super(key: key);
  final Widget child;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
