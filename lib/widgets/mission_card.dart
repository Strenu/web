import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/diagonal_image_clipper.dart';

class MissionCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const MissionCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Usamos LayoutBuilder solo para la responsividad (Row vs Column)
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 400),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // En pantallas anchas, usamos el Stack con el Clipper
            if (constraints.maxWidth > 800) {
              return Stack(
                children: [
                  Positioned.fill(child: Container(color: colorScheme.surface)),
                  Positioned.fill(
                    child: ClipPath(
                      clipper:
                          DiagonalImageClipper(), // Usa el clipper con los valores fijos
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 6, // Damos un poco más de espacio al texto
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: textTheme.displaySmall?.copyWith(
                                  color: colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(description, style: textTheme.bodyLarge),
                            ],
                          ),
                        ),
                      ),
                      Expanded(flex: 4, child: Container()),
                    ],
                  ),
                ],
              );
            }
            // En pantallas estrechas, el layout simple en columna
            return Column(
              children: [
                Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.displaySmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(description, style: textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
