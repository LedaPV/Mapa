import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //*********************************************************** FUNCIÓN QUE OBTIENE LOS PERMISOS DEL USUARIO Y SEGUIDAMENTE LA UBICACIÓN REAL */
  String _locationMessage = "";
  LatLng _initialPosition = LatLng(36.57677, -4.58330);

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // El servicio de ubicación no está habilitado. No podemos continuar.
      setState(() {
        _locationMessage = "El servicio de ubicación está deshabilitado.";
      });
      return;
    }

    // Verifica el permiso de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados. No podemos continuar.
        setState(() {
          _locationMessage = "Permiso de ubicación denegado.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Los permisos están denegados permanentemente. No podemos continuar.
      setState(() {
        _locationMessage = "Permiso de ubicación denegado permanentemente.";
      });
      return;
    }

    // Obtiene la ubicación actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationMessage =
          "Ubicación: Latitud: ${position.latitude}, Longitud: ${position.longitude}";
    });
  }

  //*********************************************************** MARCADORES */
  // Una lista donde se incluyen todos los marcadores
  List<Marker> markers = [];
  void _createMarkers() {
    markers.add(
      Marker(
        markerId: MarkerId('jumping'),
        position: LatLng(36.57577, -4.58382),
        infoWindow: InfoWindow(title: 'Jumping'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(Marker(
      markerId: MarkerId('tabla_ping-pong'),
      position: LatLng(36.57631, -4.58404),
      infoWindow: InfoWindow(title: 'Ping-pong'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('cama_elastica'),
      position: LatLng(36.57583, -4.58382),
      infoWindow: InfoWindow(title: 'Cama elastica infantil'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    // --Ascensores--
    markers.add(Marker(
      markerId: MarkerId('a_ascensores'),
      position: LatLng(36.57624, -4.58339),
      infoWindow: InfoWindow(title: 'Ascensores'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('b_ascensores'),
      position: LatLng(36.57663, -4.58324),
      infoWindow: InfoWindow(title: 'Ascensores'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('c_ascensores'),
      position: LatLng(36.57688, -4.58314),
      infoWindow: InfoWindow(title: 'Ascensores'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('d_ascensores'),
      position: LatLng(36.57662, -4.58290),
      infoWindow: InfoWindow(title: 'Ascensores'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('e_ascensores'),
      position: LatLng(36.57637, -4.58258),
      infoWindow: InfoWindow(title: 'Ascensores'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    // --Escaleras--
    markers.add(Marker(
      markerId: MarkerId('a_escaleras'),
      position: LatLng(36.57656, -4.58326),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('b_escaleras'),
      position: LatLng(36.57644, -4.58331),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('c_escaleras'),
      position: LatLng(36.57638, -4.58333),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('d_escaleras'),
      position: LatLng(36.57619, -4.58340),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('e_escaleras'),
      position: LatLng(36.57694, -4.58310),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('f_escaleras'),
      position: LatLng(36.57653, -4.58275),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('g_escaleras'),
      position: LatLng(36.57632, -4.58250),
      infoWindow: InfoWindow(title: 'Escaleras'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    // --Baños--
    markers.add(Marker(
      markerId: MarkerId('a_baños'),
      position: LatLng(36.57623, -4.58330),
      infoWindow: InfoWindow(title: 'Servicios-Baños'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('b_baños'),
      position: LatLng(36.57599, -4.58245),
      infoWindow: InfoWindow(title: 'Servicios-Baños'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
    markers.add(Marker(
      markerId: MarkerId('c_baños'),
      position: LatLng(36.57655, -4.58273),
      infoWindow: InfoWindow(title: 'Servicios-Baños'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
  }

  //*********************************************************** POLIGONOS */
  Set<Polygon> _polygons = {};
  void _createSquarePolygon() {
    // Coordenadas de los poligonos (tener en cuenta que para que se posicionen correctamente, es necesario iniciar los puntos desde la parte superior del polígono y seguir al contrario de las agujas del reloj)
    List<LatLng> perimetro_total = [
      LatLng(36.57736, -4.58295),
      LatLng(36.57740, -4.58291),
      LatLng(36.57744, -4.58290),
      LatLng(36.57747, -4.58292),
      LatLng(36.57750, -4.58295),
      LatLng(36.57510, -4.58298),
      LatLng(36.57751, -4.58303),
      LatLng(36.57750, -4.58307),
      LatLng(36.57748, -4.58310),
      LatLng(36.57746, -4.58311),
      LatLng(36.57745, -4.58312),
      LatLng(36.57743, -4.58313),
      LatLng(36.57739, -4.58314),
      LatLng(36.57741, -4.58319),
      LatLng(36.57695, -4.58335),
      LatLng(36.57687, -4.58338),
      LatLng(36.57685, -4.58334),
      LatLng(36.57683, -4.58335),
      LatLng(36.57682, -4.58330),
      LatLng(36.57675, -4.58333),
      LatLng(36.57676, -4.58338),
      LatLng(36.57673, -4.58338),
      LatLng(36.57674, -4.58343),
      LatLng(36.57651, -4.58352),
      LatLng(36.57652, -4.58358),
      LatLng(36.57632, -4.58360),
      LatLng(36.57634, -4.58372),
      LatLng(36.57635, -4.58371),
      LatLng(36.57638, -4.58383),
      LatLng(36.57640, -4.58387),
      LatLng(36.57642, -4.58393),
      LatLng(36.57637, -4.58403),
      LatLng(36.57629, -4.58410),
      LatLng(36.57607, -4.58468),
      LatLng(36.57604, -4.58466),
      LatLng(36.57603, -4.58403),
      LatLng(36.57604, -4.58384),
      LatLng(36.57603, -4.58396),
      LatLng(36.57593, -4.58393),
      LatLng(36.57590, -4.58402),
      LatLng(36.57573, -4.58394),
      LatLng(36.57563, -4.58336),
      LatLng(36.57577, -4.58262),
      LatLng(36.57583, -4.58243),
      LatLng(36.57591, -4.58231),
      LatLng(36.57594, -4.58228),
      LatLng(36.57595, -4.58225),
      LatLng(36.57597, -4.58223),
      LatLng(36.57599, -4.58217),
      LatLng(36.57601, -4.58213),
      LatLng(36.57602, -4.58211),
      LatLng(36.57603, -4.58208),
      LatLng(36.57604, -4.58205),
      LatLng(36.57612, -4.58185),
      LatLng(36.57620, -4.58161),
      LatLng(36.57626, -4.58167),
      LatLng(36.57628, -4.58176),
      LatLng(36.57631, -4.58175),
      LatLng(36.57633, -4.58177),
      LatLng(36.57634, -4.58181),
      LatLng(36.57636, -4.58184),
      LatLng(36.57636, -4.58188),
      LatLng(36.57646, -4.58207),
      LatLng(36.57651, -4.58216),
      LatLng(36.57655, -4.58226),
      LatLng(36.57658, -4.58233),
      LatLng(36.57663, -4.58246),
      LatLng(36.57664, -4.58249),
      LatLng(36.57667, -4.58252),
      LatLng(36.57665, -4.58256),
      LatLng(36.57692, -4.58290),
      LatLng(36.57693, -4.58291),
      LatLng(36.57732, -4.58276)
    ];
    List<LatLng> parking = [
      LatLng(36.57728, -4.58280), //Esquina superior derecha
      LatLng(36.57736, -4.58318), //Esquina superior izquierda
      LatLng(36.57702, -4.58330), //Esquina inferior izquierda
      LatLng(36.57695, -4.58292), //Esquina inferior derecha
    ];
    List<LatLng> shop = [
      LatLng(36.57689, -4.58321), //Esquina superior derecha
      LatLng(36.57692, -4.58335), //Esquina superior izquierda
      LatLng(36.57672, -4.58342), //Esquina inferior izquierda
      LatLng(36.57669, -4.58328), //Esquina inferior derecha
    ];
    List<LatLng> peluqueria = [
      LatLng(36.57669, -4.58328), //Esquina superior derecha
      LatLng(36.57670,
          -4.58334), //Esquina superior izquierda  => No encaja bien, me cago en tó!!!
      LatLng(36.57664, -4.58336), //Esquina inferior izquierda
      LatLng(36.57663, -4.58330), //Esquina inferior derecha
    ];
    List<LatLng> pukapukaClub_interior = [
      LatLng(36.57653, -4.58335), //Esquina superior derecha
      LatLng(36.57656, -4.58348), //Esquina superior izquierda
      LatLng(36.57627, -4.58360), //Esquina inferior izquierda
      LatLng(36.57623, -4.58347), //Esquina inferior derecha
    ];
    List<LatLng> pukapukaClub_exterior = [
      LatLng(36.57650, -4.58350), //Esquina superior derecha
      LatLng(36.57652, -4.58358), //Esquina superior izquierda
      LatLng(36.57632, -4.58366), //Esquina inferior izquierda
      LatLng(36.57630, -4.58358), //Esquina inferior derecha
    ];
    List<LatLng> jalapaTikiSnackbar = [
      LatLng(36.57614, -4.58259), //Esquina superior derecha
      LatLng(36.57611, -4.58263), //Esquina superior izquierda
      LatLng(36.57602, -4.58252), //Esquina inferior izquierda
      LatLng(36.57606, -4.58248), //Esquina inferior derecha
    ];
    List<LatLng> surfBowling = [
      LatLng(36.57644, -4.58235), //Esquina superior derecha
      LatLng(36.57637, -4.58244), //Esquina superior izquierda
      LatLng(36.57615, -4.58218), //Esquina inferior izquierda
      LatLng(36.57621, -4.58209), //Esquina inferior derecha
    ];
    List<LatLng> salonAntonioValero = [
      LatLng(36.57637, -4.58244), //Esquina superior derecha
      LatLng(36.57626, -4.58260), //Esquina superior izquierda
      LatLng(36.57603, -4.58233), //Esquina inferior izquierda
      LatLng(36.57615, -4.58218), //Esquina inferior derecha
    ];
    List<LatLng> oficina2_dpts_TesoreriaFinancieroPersonasValores = [
      LatLng(36.57610, -4.58318), //Esquina superior derecha
      LatLng(36.57614, -4.58330), //Esquina superior izquierda
      LatLng(36.57583, -4.58342), //Esquina inferior izquierda
      LatLng(36.57579, -4.58329), //Esquina inferior derecha
    ];
    List<LatLng> oficina1_dpt_ITI = [
      LatLng(36.57618, -4.58346), //Esquina superior derecha
      LatLng(36.57621, -4.58360), //Esquina superior izquierda
      LatLng(36.57590, -4.58373), //Esquina inferior izquierda
      LatLng(36.57586, -4.58358), //Esquina inferior derecha
    ];
    List<LatLng> miniMonoiSpa = [
      LatLng(36.57695, -4.58297), //Punto1
      LatLng(36.57688, -4.58300), //Punto2
      LatLng(36.57686, -4.58299), //Punto3
      LatLng(36.57685, -4.58294), //Punto4
      LatLng(36.57684, -4.58292), //Punto5
      LatLng(36.57685, -4.58290), //Punto6
      LatLng(36.57685, -4.58289), //Punto7
      LatLng(36.57687, -4.58285), //Punto8
      LatLng(36.57691, -4.58292), //Punto9
      LatLng(36.57695, -4.58292), //Punto10
    ];
    List<LatLng> monoiSpa = [
      LatLng(36.57687, -4.58285), //Punto1
      LatLng(36.57685, -4.58289), //Punto2
      LatLng(36.57685, -4.58290), //Punto3
      LatLng(36.57684, -4.58292), //Punto4
      LatLng(36.57685, -4.58294), //Punto5
      LatLng(36.57686, -4.58299), //Punto6
      LatLng(36.57682, -4.58304), //Punto7
      LatLng(36.57670, -4.58290), //Punto8
      LatLng(36.57670, -4.58291), //Punto9
      LatLng(36.57657, -4.58275), //Punto10
      LatLng(36.57666, -4.58260), //Punto11
    ];
    List<LatLng> recreativos = [
      LatLng(36.57661, -4.58257), //Punto1
      LatLng(36.57652, -4.58270), //Punto2
      LatLng(36.57639, -4.58255), //Punto3
      LatLng(36.57642, -4.58250), //Punto4
      LatLng(36.57637, -4.58244), //Punto5
      LatLng(36.57644, -4.58235), //Punto6
    ];
    List<LatLng> tatau_escenario = [
      LatLng(36.57637, -4.58384), //Punto1
      LatLng(36.57633, -4.58385), //Punto2
      LatLng(36.57629, -4.58381), //Punto3
      LatLng(36.57630, -4.58373), //Punto4
      LatLng(36.57634, -4.58371), //Punto5
    ];
    List<LatLng> tatau_teatro = [
      LatLng(36.57622, -4.58369), //Punto1
      LatLng(36.57628, -4.58395), //Punto2
      LatLng(36.57626, -4.58403), //Punto3
      LatLng(36.57611, -4.58402), //Punto4
      LatLng(36.57606, -4.58391), //Punto5
      LatLng(36.57597, -4.58387), //Punto6
      LatLng(36.57596, -4.58378), //Punto7
    ];

    List<LatLng> jalapaTatauSnackbar = [
      LatLng(36.57587, -4.58374), //Punto1
      LatLng(36.57582, -4.58376), //Punto2
      LatLng(36.57578, -4.58373), //Punto3
      LatLng(36.57576, -4.58363), //Punto4
      LatLng(36.57577, -4.58359), //Punto5
      LatLng(36.57583, -4.58357), //Punto6
    ];
    List<LatLng> miniGolf = [
      LatLng(36.57667, -4.58252), //Punto1
      LatLng(36.57664, -4.58255), //Punto2
      LatLng(36.57628, -4.58208), //Punto3
      LatLng(36.57640, -4.58195), //Punto4
      LatLng(36.57652, -4.58218), //Punto5
      LatLng(36.57658, -4.58233), //Punto6
    ];
    List<LatLng> zonaJuegos = [
      LatLng(36.57631, -4.58183), //Punto1
      LatLng(36.57626, -4.58188), //Punto2
      LatLng(36.57622, -4.58181), //Punto3
      LatLng(36.57620, -4.58182), //Punto4
      LatLng(36.57618, -4.58179), //Punto5
      LatLng(36.57625, -4.58174), //Punto6
    ];
    List<LatLng> piscina_zonaJuegos = [
      LatLng(36.57621, -4.58194), //Punto1
      LatLng(36.57621, -4.58195), //Punto2
      LatLng(36.57621, -4.58197), //Punto3
      LatLng(36.57621, -4.58198), //Punto4
      LatLng(36.57620, -4.58198), //Punto5
      LatLng(36.57616, -4.58199), //Punto6
      LatLng(36.57616, -4.58198), //Punto7
      LatLng(36.57615, -4.58198), //Punto8
      LatLng(36.57615, -4.58197), //Punto9
      LatLng(36.57615, -4.58195), //Punto10
      LatLng(36.57616, -4.58195), //Punto11
      LatLng(36.57619, -4.58194), //Punto12
      LatLng(36.57620, -4.58194), //Punto13
    ];
    List<LatLng> jacuzzi_zonaJuegos = [
      LatLng(36.57612, -4.58199), //Punto1
      LatLng(36.57612, -4.58200), //Punto2
      LatLng(36.57611, -4.58201), //Punto3
      LatLng(36.57610, -4.58200), //Punto4
      LatLng(36.57610, -4.58199), //Punto5
      LatLng(36.57611, -4.58198), //Punto6
    ];
    List<LatLng> lago = [
      LatLng(36.57678, -4.58303), //Punto1
      LatLng(36.57677, -4.58313), //Punto2
      LatLng(36.57673, -4.58317), //Punto3
      LatLng(36.57669, -4.58318), //Punto4
      LatLng(36.57664, -4.58315), //Punto5
      LatLng(36.57650, -4.58319), //Punto6
      LatLng(36.57649, -4.58314), //Punto7
      LatLng(36.57632, -4.58321), //Punto8
      LatLng(36.57631, -4.58298), //Punto9
      LatLng(36.57646, -4.58277), //Punto10
      LatLng(36.57659, -4.58294), //Punto11
      LatLng(36.57660, -4.58293), //Punto12
      LatLng(36.57664, -4.58296), //Punto13
      LatLng(36.57667, -4.58292), //Punto14
      LatLng(36.57678, -4.58303), //Punto15
    ];
    List<LatLng> pajarera = [
      LatLng(36.57637, -4.58334), //Punto1
      LatLng(36.57637, -4.58337), //Punto2
      LatLng(36.57632, -4.58339), //Punto3
      LatLng(36.57630, -4.58336), //Punto4
      LatLng(36.57630, -4.58332), //Punto5
      LatLng(36.57635, -4.58330), //Punto6
    ];
    List<LatLng> piscinaPrincipal = [
      LatLng(36.57611, -4.58293), //Punto2
      LatLng(36.57610, -4.58297), //Punto3
      LatLng(36.57608, -4.58301), //Punto4
      LatLng(36.57605, -4.58303), //Punto5
      LatLng(36.57600, -4.58302), //Punto6
      LatLng(36.57596, -4.58302), //Punto7
      LatLng(36.57593, -4.58303), //Punto8
      LatLng(36.57590, -4.58300), //Punto9
      LatLng(36.57586, -4.58296), //Punto10
      LatLng(36.57585, -4.58291), //Punto11
      LatLng(36.57585, -4.58284), //Punto12
      LatLng(36.57583, -4.58279), //Punto13
      LatLng(36.57583, -4.58275), //Punto14
      LatLng(36.57585, -4.58270), //Punto15
      LatLng(36.57589, -4.58267), //Punto16
      LatLng(36.57592, -4.58268), //Punto17
      LatLng(36.57595, -4.58269), //Punto18
      LatLng(36.57610, -4.58289), //Punto19
    ];

    // Creación de los polígonos
    Polygon PoligonoPerimetro_total = Polygon(
      polygonId: PolygonId('perimetro_total'),
      points: perimetro_total,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 158, 60, 3),
      fillColor: Color.fromARGB(143, 253, 95, 3).withOpacity(1),
    );
    Polygon PoligonoParking = Polygon(
      polygonId: PolygonId('parking'),
      points: parking,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 102, 101, 101),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoShop = Polygon(
      polygonId: PolygonId('shop'),
      points: shop,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: Color.fromARGB(176, 253, 3, 3).withOpacity(1),
    );
    Polygon PoligonoPeluqueria = Polygon(
      polygonId: PolygonId('peluqueria'),
      points: peluqueria,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 236, 3, 61),
      fillColor: Color.fromARGB(202, 236, 3, 61).withOpacity(1),
    );
    Polygon PoligonoPukaPukaClub_interior = Polygon(
      polygonId: PolygonId('pukapukaClub_interior'),
      points: pukapukaClub_interior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 95, 3),
      fillColor: Color.fromARGB(214, 253, 95, 3).withOpacity(1),
    );
    Polygon PoligonoPukaPukaClub_exterior = Polygon(
      polygonId: PolygonId('pukapukaClub_exterior'),
      points: pukapukaClub_exterior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 95, 3),
      fillColor: Color.fromARGB(157, 253, 95, 3).withOpacity(1),
    );
    Polygon PoligonoJalapaTikiSnackbar = Polygon(
      polygonId: PolygonId('jalapaTikiSnackbar'),
      points: jalapaTikiSnackbar,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 255, 37, 37),
      fillColor: Color.fromARGB(214, 252, 16, 16).withOpacity(1),
    );
    Polygon PoligonoSurfBowling = Polygon(
      polygonId: PolygonId('surfBowling'),
      points: surfBowling,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 252, 144, 4),
      fillColor: Color.fromARGB(190, 252, 145, 4).withOpacity(1),
    );
    Polygon PoligonoSalonAntonioValero = Polygon(
      polygonId: PolygonId('salonAntonioValero'),
      points: salonAntonioValero,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 180, 3, 3),
      fillColor: Color.fromARGB(197, 180, 3, 3).withOpacity(1),
    );
    Polygon PoligonoOficina2_dpts_TesoreriaFinancieroPersonasValores = Polygon(
      polygonId: PolygonId('oficina2_dpts_TesoreriaFinancieroPersonasValores'),
      points: oficina2_dpts_TesoreriaFinancieroPersonasValores,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 13, 22, 75),
      fillColor: Color.fromARGB(255, 21, 36, 122).withOpacity(1),
    );
    Polygon PoligonoOficina1_dpt_ITI = Polygon(
      polygonId: PolygonId('oficina1_dpt_ITI'),
      points: oficina1_dpt_ITI,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 13, 22, 75),
      fillColor: Color.fromARGB(255, 21, 36, 122).withOpacity(1),
    );
    Polygon PoligonoMiniMonoiSpa = Polygon(
      polygonId: PolygonId('miniMonoiSpa'),
      points: miniMonoiSpa,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(174, 121, 2, 151),
      fillColor: Color.fromARGB(110, 121, 2, 151).withOpacity(1),
    );
    Polygon PoligonoMonoiSpa = Polygon(
      polygonId: PolygonId('monoiSpa'),
      points: monoiSpa,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 121, 2, 151),
      fillColor: Color.fromARGB(174, 121, 2, 151).withOpacity(1),
    );
    Polygon PoligonoRecreativos = Polygon(
      polygonId: PolygonId('recreativos'),
      points: recreativos,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 252, 165, 4),
      fillColor: Color.fromARGB(188, 252, 165, 4).withOpacity(1),
    );
    Polygon PoligonoTatau_escenario = Polygon(
      polygonId: PolygonId('tatau_escenario'),
      points: tatau_escenario,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 43, 56, 243),
      fillColor: Color.fromARGB(214, 43, 56, 243).withOpacity(1),
    );
    Polygon PoligonoTatau_teatro = Polygon(
      polygonId: PolygonId('tatau_teatro'),
      points: tatau_teatro,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 43, 56, 243),
      fillColor: Color.fromARGB(197, 43, 56, 243).withOpacity(1),
    );
    Polygon PoligonoJalapaTatauSnackbar = Polygon(
      polygonId: PolygonId('jalapaTatauSnackbar'),
      points: jalapaTatauSnackbar,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 255, 37, 37),
      fillColor: Color.fromARGB(214, 252, 16, 16).withOpacity(1),
    );
    Polygon PoligonoMiniGolf = Polygon(
      polygonId: PolygonId('miniGolf'),
      points: miniGolf,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 57, 170, 5),
      fillColor: Color.fromARGB(183, 57, 170, 5).withOpacity(1),
    );
    Polygon PoligonoZonaJuegos = Polygon(
      polygonId: PolygonId('zonaJuegos'),
      points: zonaJuegos,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 224, 94, 18),
      fillColor: Color.fromARGB(193, 250, 107, 25).withOpacity(1),
    );
    Polygon PoligonoPiscinaZonaJuegos = Polygon(
      polygonId: PolygonId('piscina_zonaJuegos'),
      points: piscina_zonaJuegos,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 3, 140, 253),
      fillColor: Color.fromARGB(202, 3, 140, 253).withOpacity(1),
    );
    Polygon PoligonoJacuzziZonaJuegos = Polygon(
      polygonId: PolygonId('jacuzzi_zonaJuegos'),
      points: jacuzzi_zonaJuegos,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 3, 140, 253),
      fillColor: Color.fromARGB(202, 3, 140, 253).withOpacity(1),
    );
    Polygon PoligonoLago = Polygon(
      polygonId: PolygonId('lago'),
      points: lago,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 3, 236, 253),
      fillColor: Color.fromARGB(164, 3, 236, 253).withOpacity(1),
    );
    Polygon PoligonoPajarera = Polygon(
      polygonId: PolygonId('pajarera'),
      points: pajarera,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 249, 3),
      fillColor: Color.fromARGB(172, 253, 249, 3).withOpacity(1),
    );
    Polygon PoligonoPiscinaPrincipal = Polygon(
      polygonId: PolygonId('piscinaPrincipal'),
      points: piscinaPrincipal,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 3, 140, 253),
      fillColor: Color.fromARGB(202, 3, 140, 253).withOpacity(1),
    );

    // Añadir un polígono en concreto al conjunto de polígonos
    setState(() {
      _polygons.add(PoligonoPerimetro_total);
      _polygons.add(PoligonoParking);
      _polygons.add(PoligonoShop);
      _polygons.add(PoligonoPeluqueria);
      _polygons.add(PoligonoPukaPukaClub_interior);
      _polygons.add(PoligonoPukaPukaClub_exterior);
      _polygons.add(PoligonoJalapaTikiSnackbar);
      _polygons.add(PoligonoSurfBowling);
      _polygons.add(PoligonoSalonAntonioValero);
      _polygons.add(PoligonoOficina2_dpts_TesoreriaFinancieroPersonasValores);
      _polygons.add(PoligonoOficina1_dpt_ITI);
      _polygons.add(PoligonoMiniMonoiSpa);
      _polygons.add(PoligonoMonoiSpa);
      _polygons.add(PoligonoRecreativos);
      _polygons.add(PoligonoTatau_escenario);
      _polygons.add(PoligonoTatau_teatro);
      _polygons.add(PoligonoJalapaTatauSnackbar);
      _polygons.add(PoligonoMiniGolf);
      _polygons.add(PoligonoZonaJuegos);
      _polygons.add(PoligonoPiscinaZonaJuegos);
      _polygons.add(PoligonoJacuzziZonaJuegos);
      _polygons.add(PoligonoLago);
      _polygons.add(PoligonoPajarera);
      _polygons.add(PoligonoPiscinaPrincipal);
    });
  }

  // Inicio de las funciones que ejecutan la creación de los polígonos y los marcadores
  @override
  void initState() {
    super.initState();
    _createSquarePolygon();
    _createMarkers();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.576454, -4.584222),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Página Principal'),
      ),
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 10,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          polygons: _polygons,
          markers: Set<Marker>.of(
              markers), //Con esto añadimos el array de marcadores al mapa. Al igual que hacemos con los polígonos
        ),
      ]),
    );
  }
}
