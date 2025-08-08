import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/contact_form.dart';
import 'package:strenu_web/widgets/footer.dart';
import 'package:strenu_web/widgets/max_width_container.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      key: const ValueKey('contact'),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      children: [
        const SizedBox(height: 80),
        MaxWidthContainer(
          child: Column(
            children: [
              Text('Contact Us', style: textTheme.displayMedium, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Text(
                'Ready to start your project? Let\'s talk about how we can help.',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              const ContactForm(),
            ],
          ),
        ),
        const SizedBox(height: 80),
        const Footer(),
      ],
    );
  }
}