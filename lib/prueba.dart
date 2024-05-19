import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      markerId: MarkerId('jumping'),
      position: LatLng(36.57579, -4.58381),
      infoWindow: InfoWindow(title: 'Jumping'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
  }

  //*********************************************************** POLIGONOS */
  Set<Polygon> _polygons = {};
  void _createSquarePolygon() {
    // Coordenadas de los poligonos (tener en cuenta que para que se posicionen correctamente, es necesario iniciar los puntos desde la parte superior del polígono y seguir al contrario de las agujas del reloj)
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

    // Creación de los polígonos
    Polygon PoligonoParking = Polygon(
      polygonId: PolygonId('parking'),
      points: parking,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoShop = Polygon(
      polygonId: PolygonId('shop'),
      points: shop,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoPeluqueria = Polygon(
      polygonId: PolygonId('peluqueria'),
      points: peluqueria,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoPukaPukaClub_interior = Polygon(
      polygonId: PolygonId('pukapukaClub_interior'),
      points: pukapukaClub_interior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoPukaPukaClub_exterior = Polygon(
      polygonId: PolygonId('pukapukaClub_exterior'),
      points: pukapukaClub_exterior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoJalapaTikiSnackbar = Polygon(
      polygonId: PolygonId('jalapaTikiSnackbar'),
      points: jalapaTikiSnackbar,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoSurfBowling = Polygon(
      polygonId: PolygonId('surfBowling'),
      points: surfBowling,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoSalonAntonioValero = Polygon(
      polygonId: PolygonId('salonAntonioValero'),
      points: salonAntonioValero,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoOficina2_dpts_TesoreriaFinancieroPersonasValores = Polygon(
      polygonId: PolygonId('oficina2_dpts_TesoreriaFinancieroPersonasValores'),
      points: oficina2_dpts_TesoreriaFinancieroPersonasValores,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoOficina1_dpt_ITI = Polygon(
      polygonId: PolygonId('oficina1_dpt_ITI'),
      points: oficina1_dpt_ITI,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoMiniMonoiSpa = Polygon(
      polygonId: PolygonId('miniMonoiSpa'),
      points: miniMonoiSpa,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoMonoiSpa = Polygon(
      polygonId: PolygonId('monoiSpa'),
      points: monoiSpa,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoRecreativos = Polygon(
      polygonId: PolygonId('recreativos'),
      points: recreativos,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoTatau_escenario = Polygon(
      polygonId: PolygonId('tatau_escenario'),
      points: tatau_escenario,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoTatau_teatro = Polygon(
      polygonId: PolygonId('tatau_teatro'),
      points: tatau_teatro,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoJalapaTatauSnackbar = Polygon(
      polygonId: PolygonId('jalapaTatauSnackbar'),
      points: jalapaTatauSnackbar,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoMiniGolf = Polygon(
      polygonId: PolygonId('miniGolf'),
      points: miniGolf,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoZonaJuegos = Polygon(
      polygonId: PolygonId('zonaJuegos'),
      points: zonaJuegos,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );

    // Añadir un polígono en concreto al conjunto de polígonos
    setState(() {
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
          initialCameraPosition: _kGooglePlex,
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
