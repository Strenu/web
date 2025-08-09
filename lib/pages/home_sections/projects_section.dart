import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<Map<String, dynamic>> projects = [
      {
        'title': 'OptiStock - Inventory Management',
        'description':
            'A custom web platform to optimize stock levels and automate supply chain logistics for a multi-warehouse retail company.',
        'imageUrl':
            'https://images.unsplash.com/photo-1542744095-291d1f67b221?q=80&w=1170&auto=format&fit=crop',
        'tags': ['Flutter Web', 'AWS Lambda', 'DynamoDB'],
      },
      {
        'title': 'ConnectApp - B2B Platform',
        'description':
            'A cross-platform mobile app for industry professionals to connect, collaborate, and share insights securely.',
        'imageUrl':
            'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=1332&auto=format&fit=crop',
        'tags': ['Flutter Mobile', 'Firebase', 'Cloud Functions'],
      },
      {
        'title': 'Cloud Migration for Enterprise',
        'description':
            'Full infrastructure migration to AWS for a legacy enterprise system, improving performance by 200% and reducing operational costs.',
        'imageUrl':
            'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?q=80&w=1170&auto=format&fit=crop',
        'tags': ['AWS', 'EC2', 'S3', 'DevOps'],
      },
    ];

    final PageController pageController = PageController(
      viewportFraction: 0.85,
    );

    return Column(
      children: [
        Text('Featured Projects', style: textTheme.headlineMedium),
        const SizedBox(height: 20),
        Text(
          'We turn complex challenges into robust digital solutions.',
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 480,
          child: PageView.builder(
            controller: pageController,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ProjectCard(
                  title: project['title'],
                  description: project['description'],
                  imageUrl: project['imageUrl'],
                  tags: project['tags'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
