import 'package:flutter/material.dart';

class SinConexion extends StatefulWidget {
  const SinConexion({
    Key? key,
  }) : super(key: key);
  @override
  State<SinConexion> createState() => _SinConexionState();
}

class _SinConexionState extends State<SinConexion>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: controller.value,
        semanticsLabel: 'Connection failure',
        color: Colors.black,
      ),
    );
  }
}
