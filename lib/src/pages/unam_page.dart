// import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:orientat/src/pages/arte_diseno_page.dart';
import 'package:orientat/src/pages/enallt_page.dart';
import 'package:orientat/src/pages/ipn_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';

class UnamPage extends StatelessWidget {
  const UnamPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      // bottomNavigationBar: _bottomNavigationBar(context),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Orienta2"),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[
          Container(
            child: Icon(Icons.notifications_none),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            // child:
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                final route = new MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                });
                Navigator.push(context, route);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg',
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Center(child: Text("ale_jaam")),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              "Facultades ",
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
                child: Divider(
              height: 50.0,
              color: Colors.black,
            )),
          ]),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://eastus1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fcorreoipn-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!Ws_mgaZzEESB4fdqwa7X8g3IRvLxQTBAgDNdlzIQ-r0lrKI6QMjuQq45APnfzLx6%2Fitems%2F01DJYG5V24XDTKSFYDJBGYEBJHRW7TFOE6%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29ycmVvaXBuLW15LnNoYXJlcG9pbnQuY29tQGY5NGJmNGQ5LTgwOTctNDc5NC1hZGY2LWE1NDY2Y2EyODU2MyIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODY3NTQ2MjMiLCJleHAiOiIxNTg2Nzc2MjIzIiwiZW5kcG9pbnR1cmwiOiJMMVd4ZW9nVDRmU24xZmk5a2JxVWdwaytlSkVKRlJjd3Z4aGg2N1dwaE9jPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJaV1kwTVRRNE9XWXRPREF3WkMxaU1EQXdMV016TVdFdE5tUXpNbVl4TkdZMlpUWmoiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiT0RGbE5tTm1OV0V0TnpOaE5pMDBOREV3TFRneFpURXRaamMyWVdNeFlXVmtOMll5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxqYWxhbWFybTEzMDBAYWx1bW5vLmlwbi5teCIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDNiZmZkODZmYjJkNGNAbGl2ZS5jb20iLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMyJ9.WjFIWC8zTFpvRU5RcldzajZ4TDFrOGljYzBSQkZPenJSaVJNUWF2MlRpVT0&encodeFailures=1&srcWidth=&srcHeight=&width=800&height=800&action=Access',
              'Arquitectura',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://upload.wikimedia.org/wikipedia/commons/b/b2/ESCUDO_FAD_UNAM_2019.jpg',
              'Artes y Diseño',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://seeklogo.com/images/F/facultad-de-ciencias-unam-logo-B7FD4B5BC7-seeklogo.com.png',
              'Ciencias',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://seeklogo.com/images/F/facultad-de-ciencias-politicas-y-sociales-unam-logo-BBD8CC2884-seeklogo.com.png',
              'Ciencias Politicas y Sociales',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.unamenlinea.unam.mx/recursos/img/3046/pagina_3046.jpg',
              'Contaduria y Administración',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.derecho.unam.mx/informes/segundoinforme/images/Logo_derecho.png',
              'Derecho',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://eastus1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=jfif&cs=fFNQTw&docid=https%3A%2F%2Fcorreoipn-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!Ws_mgaZzEESB4fdqwa7X8g3IRvLxQTBAgDNdlzIQ-r0lrKI6QMjuQq45APnfzLx6%2Fitems%2F01DJYG5V62MUOIGDQTTVH2ISFWQOJPTOMJ%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29ycmVvaXBuLW15LnNoYXJlcG9pbnQuY29tQGY5NGJmNGQ5LTgwOTctNDc5NC1hZGY2LWE1NDY2Y2EyODU2MyIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODY3NTQyMDciLCJleHAiOiIxNTg2Nzc1ODA3IiwiZW5kcG9pbnR1cmwiOiJMMVd4ZW9nVDRmU24xZmk5a2JxVWdwaytlSkVKRlJjd3Z4aGg2N1dwaE9jPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJPRGswTVRRNE9XWXRNREEzWmkxaU1EQXdMV016TVdFdE5tRTRaVE15Tm1FeU56azAiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiT0RGbE5tTm1OV0V0TnpOaE5pMDBOREV3TFRneFpURXRaamMyWVdNeFlXVmtOMll5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxqYWxhbWFybTEzMDBAYWx1bW5vLmlwbi5teCIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDNiZmZkODZmYjJkNGNAbGl2ZS5jb20iLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMyJ9.aTArWmVuMkcwZlo0cWNTakFuL1BOb3RySzVpd2tSWG9zRmdxNEJWV2tpST0&encodeFailures=1&srcWidth=&srcHeight=&width=1920&height=859&action=Access',
              'Economia',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://eastus1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fcorreoipn-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!Ws_mgaZzEESB4fdqwa7X8g3IRvLxQTBAgDNdlzIQ-r0lrKI6QMjuQq45APnfzLx6%2Fitems%2F01DJYG5V36ZUYIK4NNMVE3LWXHXX362XOF%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29ycmVvaXBuLW15LnNoYXJlcG9pbnQuY29tQGY5NGJmNGQ5LTgwOTctNDc5NC1hZGY2LWE1NDY2Y2EyODU2MyIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODY3NTQyMDciLCJleHAiOiIxNTg2Nzc1ODA3IiwiZW5kcG9pbnR1cmwiOiJMMVd4ZW9nVDRmU24xZmk5a2JxVWdwaytlSkVKRlJjd3Z4aGg2N1dwaE9jPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJPRGswTVRRNE9XWXRNREEzWmkxaU1EQXdMV016TVdFdE5tRTRaVE15Tm1FeU56azAiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiT0RGbE5tTm1OV0V0TnpOaE5pMDBOREV3TFRneFpURXRaamMyWVdNeFlXVmtOMll5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxqYWxhbWFybTEzMDBAYWx1bW5vLmlwbi5teCIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDNiZmZkODZmYjJkNGNAbGl2ZS5jb20iLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMyJ9.aTArWmVuMkcwZlo0cWNTakFuL1BOb3RySzVpd2tSWG9zRmdxNEJWV2tpST0&encodeFailures=1&srcWidth=&srcHeight=&width=417&height=417&action=Preview',
              'Filosofía y Letras',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://eastus1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fcorreoipn-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!Ws_mgaZzEESB4fdqwa7X8g3IRvLxQTBAgDNdlzIQ-r0lrKI6QMjuQq45APnfzLx6%2Fitems%2F01DJYG5V3Q4KUU2M3RPNFYFYG4PHULSRCD%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29ycmVvaXBuLW15LnNoYXJlcG9pbnQuY29tQGY5NGJmNGQ5LTgwOTctNDc5NC1hZGY2LWE1NDY2Y2EyODU2MyIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODY3NTQyMDciLCJleHAiOiIxNTg2Nzc1ODA3IiwiZW5kcG9pbnR1cmwiOiJMMVd4ZW9nVDRmU24xZmk5a2JxVWdwaytlSkVKRlJjd3Z4aGg2N1dwaE9jPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJPRGswTVRRNE9XWXRNREEzWmkxaU1EQXdMV016TVdFdE5tRTRaVE15Tm1FeU56azAiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiT0RGbE5tTm1OV0V0TnpOaE5pMDBOREV3TFRneFpURXRaamMyWVdNeFlXVmtOMll5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxqYWxhbWFybTEzMDBAYWx1bW5vLmlwbi5teCIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDNiZmZkODZmYjJkNGNAbGl2ZS5jb20iLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMyJ9.aTArWmVuMkcwZlo0cWNTakFuL1BOb3RySzVpd2tSWG9zRmdxNEJWV2tpST0&encodeFailures=1&srcWidth=&srcHeight=&width=354&height=425&action=Preview',
              'Ingeniería',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://eastus1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fcorreoipn-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!Ws_mgaZzEESB4fdqwa7X8g3IRvLxQTBAgDNdlzIQ-r0lrKI6QMjuQq45APnfzLx6%2Fitems%2F01DJYG5V2ES65A35IKIFG35U2ZZZRZ3J3M%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29ycmVvaXBuLW15LnNoYXJlcG9pbnQuY29tQGY5NGJmNGQ5LTgwOTctNDc5NC1hZGY2LWE1NDY2Y2EyODU2MyIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODY3NTk4ODMiLCJleHAiOiIxNTg2NzgxNDgzIiwiZW5kcG9pbnR1cmwiOiJMMVd4ZW9nVDRmU24xZmk5a2JxVWdwaytlSkVKRlJjd3Z4aGg2N1dwaE9jPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJaak0wTmpRNE9XWXROREF4TWkxaU1EQXdMVE0xTUdZdE1UYzRNalkwTmpJMU5HVmsiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiT0RGbE5tTm1OV0V0TnpOaE5pMDBOREV3TFRneFpURXRaamMyWVdNeFlXVmtOMll5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxqYWxhbWFybTEzMDBAYWx1bW5vLmlwbi5teCIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDNiZmZkODZmYjJkNGNAbGl2ZS5jb20iLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMyJ9.b1c4a0o2OUlpRHpTUjlKclpITTNOVW5ndEYvRFluMFE2ZGNQYWRUdFZ4MD0&encodeFailures=1&srcWidth=&srcHeight=&width=300&height=286&action=Access',
              'Medicina',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://eastus1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=jpg&cs=fFNQTw&docid=https%3A%2F%2Fcorreoipn-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!Ws_mgaZzEESB4fdqwa7X8g3IRvLxQTBAgDNdlzIQ-r0lrKI6QMjuQq45APnfzLx6%2Fitems%2F01DJYG5VZJMN5NDJFFEVAKQV4GLAEFSUJL%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29ycmVvaXBuLW15LnNoYXJlcG9pbnQuY29tQGY5NGJmNGQ5LTgwOTctNDc5NC1hZGY2LWE1NDY2Y2EyODU2MyIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODY3NTQyMDciLCJleHAiOiIxNTg2Nzc1ODA3IiwiZW5kcG9pbnR1cmwiOiJMMVd4ZW9nVDRmU24xZmk5a2JxVWdwaytlSkVKRlJjd3Z4aGg2N1dwaE9jPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJPRGswTVRRNE9XWXRNREEzWmkxaU1EQXdMV016TVdFdE5tRTRaVE15Tm1FeU56azAiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiT0RGbE5tTm1OV0V0TnpOaE5pMDBOREV3TFRneFpURXRaamMyWVdNeFlXVmtOMll5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxqYWxhbWFybTEzMDBAYWx1bW5vLmlwbi5teCIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDNiZmZkODZmYjJkNGNAbGl2ZS5jb20iLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMyJ9.aTArWmVuMkcwZlo0cWNTakFuL1BOb3RySzVpd2tSWG9zRmdxNEJWV2tpST0&encodeFailures=1&srcWidth=&srcHeight=&width=1920&height=859&action=Access',
              'Medicina Veterinaria y Zootecnia',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.unamenlinea.unam.mx/recursos/img/84442/facultad-de-musica.jpg',
              'Música',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://seeklogo.com/images/F/facultad-de-odontologia-unam-logo-6C2831325C-seeklogo.com.png',
              'Odontología',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://seeklogo.com/images/F/facultad-de-psicologia-logo-A0E59A1368-seeklogo.com.png',
              'Psicología',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://media-exp1.licdn.com/dms/image/C4E0BAQHrENqLrysSGA/company-logo_200_200/0?e=2159024400&v=beta&t=tEEJ6d4aeMhAVZUNE8oCV_GoFz2LAH_Lx4qv3ywiCZY',
              'Quimica',
              context),
          // SizedBox(height: 20.0),
          // _cardTipo2(
          //     'https://www.unam.mx/sites/default/files/images/eventos/azulb-390x390.jpg',
          //     'Facultades de Estudios Superiores',
          //     context),
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            Text(
              "Escuelas ",
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
                child: Divider(
              height: 50.0,
              color: Colors.black,
            )),
          ]),
          SizedBox(height: 20.0),
          _cardTipo2('https://avi.cuaed.unam.mx/images/logo-eneo.png', 'ENEO',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://upload.wikimedia.org/wikipedia/commons/a/a0/Escudo_Escuela_Nacional_de_Estudios_Superiores_Unidad_Le%C3%B3n.png',
              'ENES',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.posgrado.unam.mx/linguistica/img/logo_enallt.png',
              'ENALLT',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.pngkit.com/png/detail/274-2749353_ents-unam-logo-miercoles-3-de-octubre-chicas.png',
              'ENTS',
              context),
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            Text(
              "Centros ",
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
                child: Divider(
              height: 50.0,
              color: Colors.black,
            )),
          ]),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://miro.medium.com/max/1116/1*MBugkO5jDq_q6VCm6Kkimw.png',
              'Centro de Ciencias Genómicas',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'http://oferta.unam.mx/images/cnyn1.png',
              'Centro de Nanociencias y Nanotecnología',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSvFZ3UcamECzGN90WpVDg7zW9SpAUn6_DXjw-AlIvpD9ZCVS-M&usqp=CAU',
              'Centro Universitario de Teatro',
          context),
        ],
      ),
    );
  }

  Widget _cardTipo2(url, school, context) {
    final card = Container(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                width: 120,
                height: 100,
                padding: EdgeInsets.only(left: 15.0),
                child: FadeInImage(
                  image: NetworkImage(url),
                  placeholder: AssetImage("assets/loading.gif"),
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: Text(
                school,
              ),
              padding: EdgeInsets.all(10.0),
            )
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        switch (school) {
          case 'Artes y Diseño':
            final route = new MaterialPageRoute(builder: (context) {
              return ArteDisenoPage();
            });
            Navigator.push(context, route);
            break;
          case 'ENALLT':
            final route = new MaterialPageRoute(builder: (context) {
              return EnalltPage();
            });
            Navigator.push(context, route);
            break;
          default:
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0, //Difuminado
                  spreadRadius: 2.0, // Que tanto queremos que se extienda
                  offset: Offset(2.0, 10.0))
            ]),
        child:
            ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card),
      ),
    );
  }
}
