import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsExample extends StatefulWidget {
  @override
  State<MapsExample> createState() => MapsExampleState();
}

class MapsExampleState extends State<MapsExample> {
  Set<Polygon> _polygons = {};

  void _createSquarePolygon() {
    // Coordenadas del poligono
    List<LatLng> parking = [
      LatLng(36.57728, -4.58280), //Esquina superiorderecha
      LatLng(36.57736, -4.58318), //Esquina superior izquierda
      LatLng(36.57695, -4.58292), //Esquina inferior derecha
      LatLng(36.57702, -4.58330), //Esquina inferior izquierda
    ];

    Polygon PoligonoParking = Polygon(
      polygonId: PolygonId('parking'),
      points: parking,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );

    List<LatLng> squareCoordinates = [
      LatLng(37.576838, -4.583353), // Esquina superior izquierda
      LatLng(36.576726, -4.583353), // Esquina inferior izquierda
      LatLng(36.576726, -4.583522), // Esquina inferior derecha
      LatLng(37.576838, -4.583522), // Esquina superior derecha
    ];

    // Creación del polígono
    Polygon squarePolygon = Polygon(
      polygonId: PolygonId('square'),
      points: squareCoordinates,
      strokeWidth: 2,
      strokeColor: Color.fromARGB(255, 253, 3, 3),
      fillColor: const Color.fromARGB(255, 160, 161, 162).withOpacity(1),
    );

    // Añadir el polígono al conjunto de polígonos
    setState(() {
      //Ya solo nos quedaría añadir el poligono del parking al array de polígonos que tenemos creado antes.
      _polygons.add(squarePolygon);
      _polygons.add(PoligonoParking);
    });
  }

  @override
  void initState() {
    super.initState();
    _createSquarePolygon();
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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            polygons: _polygons,
          ),
          // Positioned(
          //   bottom: 16,
          //   right: 16,
          //   child: GestureDetector(
          //     onTap: () {
          //       // Aquí iría la lógica para ir al lago o la piscina
          //       // Puedes navegar a otra pantalla o realizar alguna acción específica
          //     },
          //     child: Container(
          //       padding: EdgeInsets.all(12),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(24),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.2),
          //             spreadRadius: 2,
          //             blurRadius: 4,
          //             offset: Offset(0, 2),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Icon(Icons.pool),
          //           SizedBox(width: 8),
          //           Text('To the Pool!'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 160,
          //   left: 10,
          //   child: Image.asset(
          //     'assets/PY_PLANO_P0-SinFondo.png', // Ruta de la imagen en tu proyecto
          //     width: 400,
          //     height: 400,
          //   ),
          // ),
        ],
      ),
    );
  }
}
