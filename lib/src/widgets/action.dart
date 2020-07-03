import 'package:flutter/material.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';

class MyActions extends StatelessWidget {
  const MyActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _prefs = new PreferenciasUsuario();
    return Padding(
      padding: EdgeInsets.all(8.0),
      // child:
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: _prefs.foto != null
              ? Image.network(
                  _prefs.foto,
                  width: 40,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/no-image.png',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
