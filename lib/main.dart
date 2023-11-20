import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservations App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aquí se podría implementar la lógica de autenticación
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReservationListPage()),
            );
          },
          child: Text('Iniciar sesión'),
        ),
      ),
    );
  }
}

class ReservationListPage extends StatelessWidget {
  final List<String> reservations = [
    'Reservación 1',
    'Reservación 2',
    'Reservación 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Reservaciones'),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(reservations[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReservationDetailsPage(
                        reservation: reservations[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class ReservationDetailsPage extends StatelessWidget {
  final String reservation;

  ReservationDetailsPage({required this.reservation});

  Future<void> _scanQR(BuildContext context) async {
    try {
      String result = await BarcodeScanner.scan();
      // Aquí se procesaría el resultado del escaneo y se modificaría la reserva
      // En este ejemplo, simplemente mostramos el resultado del escaneo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Código QR escaneado: $result')),
      );
    } catch (e) {
      print('Error al escanear: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Reservación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detalles de la reserva: $reservation',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _scanQR(context);
              },
              child: Text('Escanear QR'),
            ),
          ],
        ),
      ),
    );
  }
}


class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizar Reserva'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aquí podrías implementar la lógica para crear una reserva
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Reserva realizada')),
            );
          },
          child: Text('Realizar Reserva'),
        ),
      ),
    );
  }
}

class ModifyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Usuario'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aquí podrías implementar la lógica para modificar un usuario
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content
