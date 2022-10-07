import 'package:flutter/material.dart';

class SinConexion extends StatelessWidget {
  const SinConexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          "Data Json Sin conexión a Internet",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
    );
  }
}
