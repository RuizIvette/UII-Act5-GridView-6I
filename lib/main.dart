import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(JugueteriaIvette());
}

class JugueteriaIvette extends StatelessWidget {
  const JugueteriaIvette({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Juguetería Ivette',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // Paleta basada en morados y colores atractivos
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
          secondary: Colors.pinkAccent,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F0FF), // Fondo lila muy suave
      ),
      home: const CatalogoPage(),
    );
  }
}

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  // Lista de URLs corregidas
  final List<String> imagenes = const [
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete1.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete2.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete3.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete4.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete5.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete6.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete7.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete8.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete9.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete10.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete11.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete12.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/juguete13.jfif',
    'https://raw.githubusercontent.com/RuizIvette/Juguetes/refs/heads/main/Juguete14.jfif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Juguetería Ivette 🧸',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 4,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // 2 columnas por 7 filas (14 items)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // Ajuste de aspecto para que la tarjeta sea vertical y quepa en móviles
          childAspectRatio: 0.72, 
        ),
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          return JugueteCard(url: imagenes[index], index: index + 1);
        },
      ),
    );
  }
}

class JugueteCard extends StatelessWidget {
  final String url;
  final int index;

  const JugueteCard({super.key, required this.url, required this.index});

  @override
  Widget build(BuildContext context) {
    // Generación de calificación aleatoria
    final int rating = Random().nextInt(5) + 1;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del juguete (Tamaño adaptado para móvil)
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                url,
                width: double.infinity,
                fit: BoxFit.cover,
                // Placeholder mientras carga o si falla
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.purple[50],
                  child: const Icon(Icons.toys, color: Colors.purple),
                ),
              ),
            ),
          ),
          
          // Contenedor de las 3 filas de información
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila 1: Título
                Text(
                  'Juguete Divertido #$index',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
                // Fila 2: Subtítulo
                const Text(
                  'Edición Especial',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                
                const SizedBox(height: 4),
                
                // Fila 3: Calificación con estrellas
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < rating ? Icons.star : Icons.star_border,
                      size: 16,
                      color: Colors.amber,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}