import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/testimonial_card.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    final List<Map<String, String>> testimonials = [
      {'quote': 'Strenu transformed our internal processes. Their cloud solution is robust, scalable, and has saved us countless hours.', 'author': 'Jane Doe', 'role': 'CTO, Innovate Startups', 'imageUrl': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1287&auto=format&fit=crop'},
      {'quote': 'The mobile app they developed exceeded our expectations. The team\'s technical expertise and commitment are second to none.', 'author': 'John Smith', 'role': 'CEO, Global Logistics Inc.', 'imageUrl': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1287&auto=format&fit=crop'},
      {'quote': 'Working with them felt like a true partnership. They are agile, transparent, and delivered on time and on budget.', 'author': 'Emily White', 'role': 'Product Manager, TechFlow', 'imageUrl': 'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1361&auto=format&fit=crop'}
    ];

    // --- LA CORRECCIÓN ESTÁ AQUÍ ---
    final PageController pageController = PageController(viewportFraction: 0.9);

    return Column(
      children: [
        Text('What Our Clients Say', style: textTheme.headlineMedium),
        const SizedBox(height: 50),
        SizedBox(
          height: 380,
          child: PageView.builder(
            controller: pageController,
            itemCount: testimonials.length,
            itemBuilder: (context, index) {
              final testimonial = testimonials[index];
              // El padding ahora se controla con el viewportFraction
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TestimonialCard(
                  quote: testimonial['quote']!,
                  author: testimonial['author']!,
                  role: testimonial['role']!,
                  imageUrl: testimonial['imageUrl']!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}