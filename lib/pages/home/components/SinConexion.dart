import 'package:flutter/material.dart';
import 'package:flutter_dragonball/utils/dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            color: Colors.black,
            size: Dimensions.height40,
          ),
          SizedBox(
            height: Dimensions.height60,
          ),
          Text(
            "Cargando...",
            style: TextStyle(color: Colors.black, fontSize: Dimensions.font16),
          )
        ],
      ), /*CircularProgressIndicator(
        value: controller.value,
        semanticsLabel: 'Connection failure',
        color: Colors.black,
      ),*/
    );
  }
}
