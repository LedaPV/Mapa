import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

// List<LatLng> PoligonosCuadra(
//     LatLng lado1, LatLng lado2, LatLng lado3, LatLng lado4) {
//   List<LatLng> squareCoordinates = [
//     lado1, // Esquina superior izquierda
//     lado2, // Esquina superior derecha
//     lado3, // Esquina inferior derecha
//     lado4, // Esquina inferior izquierda
//   ];
//   return squareCoordinates;
// }

class MapSampleState extends State<MapSample> {
  Set<Polygon> _polygons = {};
  void _createSquarePolygon() {
    // Coordenadas del cuadrado
    //Lo primiero que hacemos es definir las coordenadas que tendrán los diferentes puntos
    List<LatLng> squareCoordinates = [
      LatLng(37.576838, -4.583353), // Esquina superior izquierda
      LatLng(36.576726, -6.583389), // Esquina superior derecha
      LatLng(36.576743, -4.583522), // Esquina inferior derecha
      LatLng(36.576845, -4.583455), // Esquina inferior izquierda
    ];

    // Crear el polígono cuadrado

    Polygon squarePolygon = Polygon(
      polygonId: PolygonId('square'),
      points: squareCoordinates,
      strokeWidth: 2, //Grosor de la línea del polígono
      strokeColor: //Color de la línea
          Color.fromARGB(255, 253, 3, 3), // Color del borde del polígono
      fillColor: const Color.fromARGB(255, 160, 161, 162) // Color de fondo
          .withOpacity(1), // Color de relleno del polígono
    );

    //Y listo, lo último que hacemos es añadir el poligono al array

    // que tal? lo has entendido? sI pero lo que decia rubén de tres funciones
    //Creo que es algo así, mira
    setState(() {
      _polygons.add(squarePolygon);
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

  static const CameraPosition _Pool = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(36.575960, -4.582861),
    tilt: 59.440717697143555,
    zoom: 20,
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
          Positioned(
            bottom: 16,
            right: 16,
            child: GestureDetector(
              onTap: _goToTheLake,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.pool),
                    SizedBox(width: 8),
                    Text('To the Pool!'),
                  ],
                ),
              ),
            ),
          ),
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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_Pool));
  }
}
