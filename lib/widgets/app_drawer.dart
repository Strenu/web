import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      backgroundColor: colorScheme.surface, // Fondo negro, como el footer
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Cabecera del Drawer
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                'STRENU',
                style: textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
            ),
          ),
          // Links de navegación
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('Home', style: textTheme.titleMedium),
            onTap: () {
              context.go('/');
              Navigator.pop(context); // Cierra el drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.miscellaneous_services_outlined),
            title: Text('Services', style: textTheme.titleMedium),
            onTap: () {
              context.go('/services');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: Text('About Us', style: textTheme.titleMedium),
            onTap: () {
              context.go('/about');
              Navigator.pop(context);
            },
          ),
          const Divider(),
          // Botón de Contacto
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/contact');
                Navigator.pop(context);
              },
              child: const Text('Contact'),
            ),
          ),
        ],
      ),
    );
  }
}
