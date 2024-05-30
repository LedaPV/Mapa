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
        markerId: MarkerId('baños'),
        position: LatLng(36.57665, -4.58278),
        infoWindow: InfoWindow(title: 'WC'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('telefono'),
        position: LatLng(36.57692, -4.58307),
        infoWindow: InfoWindow(title: 'Telefono'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('cajero'),
        position: LatLng(36.57691, -4.58305),
        infoWindow: InfoWindow(title: 'Cajero'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('info_holidayPlus'),
        position: LatLng(36.57689, -4.58310),
        infoWindow: InfoWindow(title: 'Info_Holiday_Plus'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    
  }

  //*********************************************************** POLIGONOS */
  Set<Polygon> _polygons = {};
  void _createSquarePolygon() {
    // Coordenadas de los poligonos (tener en cuenta que para que se posicionen correctamente, es necesario iniciar los puntos desde la parte superior del polígono y seguir al contrario de las agujas del reloj)
    List<LatLng> recepcion = [
      LatLng(36.57693, -4.58295), //Punto1
      LatLng(36.57687, -4.58303), //Punto2
      LatLng(36.57673, -4.58285), //Punto3
      LatLng(36.57679, -4.58278), //Punto4
    ];
    
    // Creación de los polígonos
    Polygon PoligonoRecepcion = Polygon(
      polygonId: PolygonId('recepcion'),
      points: recepcion,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );
    
    // Añadir un polígono en concreto al conjunto de polígonos
    setState(() {
      _polygons.add(PoligonoRecepcion);
      
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
