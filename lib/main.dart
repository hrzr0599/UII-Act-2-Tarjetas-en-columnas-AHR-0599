import 'package:flutter/material.dart';

void main() {
  runApp(const StarMedicaApp());
}

class StarMedicaApp extends StatelessWidget {
  const StarMedicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StarMedica',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF001A33), // Fondo azul oscuro
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de datos para las tarjetas
    final List<Map<String, String>> medicalData = [
      {
        'title': 'NUESTRO LOGO',
        'subtitle': 'Identidad y Excelencia Medica',
        'image': 'https://raw.githubusercontent.com/hrzr0599/imagenes-para-fluter-6-I-11-Feb-26/refs/heads/main/logo.JPG'
      },
      {
        'title': 'PSICOLOGIA',
        'subtitle': 'Bienestar mental y emocional especializado',
        'image': 'https://raw.githubusercontent.com/hrzr0599/imagenes-para-fluter-6-I-11-Feb-26/refs/heads/main/james-person-1.jpg'
      },
      {
        'title': 'PEDIATRIA',
        'subtitle': 'Cuidado integral para los mas pequenos',
        'image': 'https://raw.githubusercontent.com/hrzr0599/imagenes-para-fluter-6-I-11-Feb-26/refs/heads/main/hospital-infantil.jpg'
      },
      {
        'title': 'CONSULTA FAMILIAR',
        'subtitle': 'Atencion medica para todo tu nucleo',
        'image': 'https://raw.githubusercontent.com/hrzr0599/imagenes-para-fluter-6-I-11-Feb-26/refs/heads/main/familyAHR.jpg'
      },
      {
        'title': 'INSTALACIONES',
        'subtitle': 'Tecnologia de vanguardia a su servicio',
        'image': 'https://raw.githubusercontent.com/hrzr0599/imagenes-para-fluter-6-I-11-Feb-26/refs/heads/main/AHR%20HEADER.jpg'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StarMedica',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF003366), // Azul Marino solicitado
        elevation: 4,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: medicalData.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(color: Color(0xFFCC0000), width: 1), // Detalle en rojo
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Lado izquierdo: Imagen de la web
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      medicalData[index]['image']!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 80,
                          color: Colors.black12,
                          child: const Icon(Icons.broken_image, color: Colors.black),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Lado derecho: Textos
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicalData[index]['title']!,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Titulo mas grande y negritas
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          medicalData[index]['subtitle']!,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF555555), // Subtitulo mas pequeno
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}