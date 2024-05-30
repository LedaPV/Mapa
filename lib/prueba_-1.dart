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
        markerId: MarkerId('acceso_restaurantes'),
        position: LatLng(36.57618, -4.58318),
        infoWindow: InfoWindow(title: 'Acceso_restaurantes'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('ukelele_baños'),
        position: LatLng(36.57667, -4.58339),
        infoWindow: InfoWindow(title: 'ukelele_baños'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('maevaBuffet_baños'),
        position: LatLng(36.57622, -4.58268),
        infoWindow: InfoWindow(title: 'maevaBuffet_baños'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('entradaRestaurantes_baños'),
        position: LatLng(36.57624, -4.58327),
        infoWindow: InfoWindow(title: 'entradaRestaurantes_baños'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('lavanderia_monedas'),
        position: LatLng(36.57690, -4.58313),
        infoWindow: InfoWindow(title: 'lavanderia_monedas'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
  }

  //*********************************************************** POLIGONOS */
  Set<Polygon> _polygons = {};
  void _createSquarePolygon() {
    // Coordenadas de los poligonos (tener en cuenta que para que se posicionen correctamente, es necesario iniciar los puntos desde la parte superior del polígono y seguir al contrario de las agujas del reloj)
    List<LatLng> maevaBuffet_interior = [
      LatLng(36.57645, -4.58241), //Punto1
      LatLng(36.57636, -4.58253), //Punto2
      LatLng(36.57631, -4.58248), //Punto3
      LatLng(36.57617, -4.58267), //Punto4
      LatLng(36.57596, -4.58243), //Punto5
      LatLng(36.57615, -4.58218), //Punto6
      LatLng(36.57621, -4.58209), //Punto7
    ];
    List<LatLng> maevaBuffet_exterior = [
      LatLng(36.57617, -4.58267), //Punto1
      LatLng(36.57612, -4.58274), //Punto2
      LatLng(36.57591, -4.58249), //Punto3
      LatLng(36.57596, -4.58243), //Punto4
    ];
    List<LatLng> uroWok_interior = [
      LatLng(36.57645, -4.58279), //Punto1
      LatLng(36.57632, -4.58299), //Punto2
      LatLng(36.57633, -4.58305), //Punto3
      LatLng(36.57628, -4.58307), //Punto4
      LatLng(36.57626, -4.58297), //Punto5
      LatLng(36.57628, -4.58293), //Punto6
      LatLng(36.57631, -4.58290), //Punto
      LatLng(36.57627, -4.58286), //Punto
      LatLng(36.57629, -4.58288), //PuntoD
      LatLng(36.57636, -4.58278), //PuntoB
      LatLng(36.57637, -4.58279), //Punto16
      LatLng(36.57639, -4.58277), //Punto17
      LatLng(36.57642, -4.58281), //Punto18
      LatLng(36.57645, -4.58278), //Punto19
    ];
    List<LatLng> uroWok_exterior = [
      LatLng(36.57631, -4.58290), //PuntoX
      LatLng(36.57628, -4.58293), //Punto6
      LatLng(36.57625, -4.58289), //Punto7
      LatLng(36.57627, -4.58286), //PuntoA
    ];
    List<LatLng> ahimaaRestaurant_interior = [
      LatLng(36.57636, -4.58278), //PuntoB
      LatLng(36.57629, -4.58288), //PuntoD
      LatLng(36.57621, -4.58278), //PuntoC
      LatLng(36.57628, -4.58267), //Punto9
      LatLng(36.57630, -4.58270), //Punto10
      LatLng(36.57633, -4.58267), //Punto11
      LatLng(36.57634, -4.58269), //Punto12
      LatLng(36.57633, -4.58270), //Punto13
      LatLng(36.57635, -4.58273), //Punto14
      LatLng(36.57635, -4.58277), //Punto15
    ];
    List<LatLng> ahimaaRestaurant_exterior = [
      LatLng(36.57627, -4.58286), //Punto1
      LatLng(36.57625, -4.58289), //Punto7
      LatLng(36.57619, -4.58281), //Punto8
      LatLng(36.57621, -4.58278), //PuntoC
    ];
    List<LatLng> sala_papuaCine = [
      LatLng(36.57655, -4.58349), //Punto1
      LatLng(36.57650, -4.58351), //Punto2
      LatLng(36.57647, -4.58339), //Punto3
      LatLng(36.57652, -4.58337), //Punto4
    ];
    List<LatLng> ukelele_discoPub = [
      LatLng(36.57689, -4.58335), //Punto1
      LatLng(36.57670, -4.58342), //Punto2
      LatLng(36.57668, -4.58333), //Punto3
      LatLng(36.57663, -4.58335), //Punto4
      LatLng(36.57661, -4.58326), //Punto5
      LatLng(36.57685, -4.58318), //Punto6
    ];
    List<LatLng> habitaciones_5A = [
      LatLng(36.57623, -4.58361), //Punto1
      LatLng(36.57592, -4.58372), //Punto2
      LatLng(36.57588, -4.58355), //Punto3
      LatLng(36.57602, -4.58350), //Punto4
      LatLng(36.57603, -4.58353), //Punto5
      LatLng(36.57620, -4.58347), //Punto6
    ];
    List<LatLng> habitaciones_5B = [
      LatLng(36.57614, -4.58329), //Punto1
      LatLng(36.57598, -4.58334), //Punto2
      LatLng(36.57598, -4.58336), //Punto3
      LatLng(36.57585, -4.58342), //Punto4
      LatLng(36.57581, -4.58326), //Punto5
      LatLng(36.57611, -4.58315), //Punto6
    ];
    List<LatLng> oficina3_dpt_ComercialMarketing = [
      LatLng(36.57636, -4.58319), //Punto1
      LatLng(36.57626, -4.58323), //Punto2
      LatLng(36.57623, -4.58309), //Punto3
      LatLng(36.57633, -4.58305), //Punto4
    ];

    // Creación de los polígonos
    Polygon PoligonoMaevaBuffet_interior = Polygon(
      polygonId: PolygonId('maevaBuffet_interior'),
      points: maevaBuffet_interior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoMaevaBuffet_exterior = Polygon(
      polygonId: PolygonId('maevaBuffet_exterior'),
      points: maevaBuffet_exterior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoAhimaaRestaurant_interior = Polygon(
      polygonId: PolygonId('ahimaaRestaurant_interior'),
      points: ahimaaRestaurant_interior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoAhimaaRestaurant_exterior = Polygon(
      polygonId: PolygonId('ahimaaRestaurant_exterior'),
      points: ahimaaRestaurant_exterior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoUroWok_interior = Polygon(
      polygonId: PolygonId('uroWok_interior'),
      points: uroWok_interior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoUroWok_exterior = Polygon(
      polygonId: PolygonId('uroWok_exterior'),
      points: uroWok_exterior,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    Polygon PoligonoSala_papuaCine = Polygon(
      polygonId: PolygonId('sala_papuaCine'),
      points: sala_papuaCine,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 178),
      fillColor: Color.fromARGB(255, 252, 133, 216).withOpacity(1),
    );

    Polygon PoligonoUkelele_discoPub = Polygon(
      polygonId: PolygonId('ukelele_discoPub'),
      points: ukelele_discoPub,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 95, 253, 3),
      fillColor: Color.fromARGB(255, 194, 253, 160).withOpacity(1),
    );
    Polygon PoligonoHabitaciones_5A = Polygon(
      polygonId: PolygonId('habitaciones_5A'),
      points: habitaciones_5A,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 4, 164, 228),
      fillColor: Color.fromARGB(255, 152, 197, 214).withOpacity(1),
    );
    Polygon PoligonoHabitaciones_5B = Polygon(
        polygonId: PolygonId('habitaciones_5B'),
        points: habitaciones_5B,
        strokeWidth: 2,
        strokeColor: Color.fromARGB(255, 4, 164, 228),
        fillColor: Color.fromARGB(255, 152, 197, 214).withOpacity(1));
    Polygon PoligonOficina3_dpt_ComercialMarketing = Polygon(
      polygonId: PolygonId('oficina3_dpt_ComercialMarketing'),
      points: oficina3_dpt_ComercialMarketing,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 13, 22, 75),
      fillColor: Color.fromARGB(255, 21, 36, 122).withOpacity(1),
    );

    // Añadir un polígono en concreto al conjunto de polígonos
    setState(() {
      _polygons.add(PoligonoMaevaBuffet_interior);
      _polygons.add(PoligonoMaevaBuffet_exterior);
      _polygons.add(PoligonoAhimaaRestaurant_interior);
      _polygons.add(PoligonoAhimaaRestaurant_exterior);
      _polygons.add(PoligonoUroWok_interior);
      _polygons.add(PoligonoUroWok_exterior);
      _polygons.add(PoligonoSala_papuaCine);
      _polygons.add(PoligonoUkelele_discoPub);
      _polygons.add(PoligonoHabitaciones_5A);
      _polygons.add(PoligonoHabitaciones_5B);
      _polygons.add(PoligonOficina3_dpt_ComercialMarketing);
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
