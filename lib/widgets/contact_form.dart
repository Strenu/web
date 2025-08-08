import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  // TODO: Añadir TextEditingControllers si necesitas capturar los datos
  bool _isSending = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSending = true);
      // TODO: Aquí iría la lógica para enviar el email.
      // Por ejemplo, una llamada a una API o a Firebase Functions.
      // Simulamos un envío con un retraso.
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thank you for your message! We will be in touch shortly.')),
        );
        _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Full Name'),
            validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Company'),
             validator: (value) => value!.isEmpty ? 'Please enter your company name' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Work Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => (value!.isEmpty || !value.contains('@')) ? 'Please enter a valid email' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'How can we help?'),
            maxLines: 5,
            validator: (value) => value!.isEmpty ? 'Please enter your message' : null,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _isSending ? null : _submitForm,
            child: _isSending
                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 3))
                : const Text('Send Message'),
          ),
        ],
      ),
    );
  }
}