import 'package:flutter/material.dart';
import 'package:strenu_utils/strenu_utils.dart';

class AboutScreen extends StrenuAppSizeStatefulWidget {
  const AboutScreen({super.key});

  @override
  StrenuAppSizeStatefulWidgetState<StrenuAppSizeStatefulWidget> createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends StrenuAppSizeStatefulWidgetState<AboutScreen> {
  @override
  Widget desktop(BuildContext context) {
    return Text("About in desktop");
  }

  @override
  Widget mobile(BuildContext context) {
    return Text("About in mobile");
  }

  @override
  Widget table(BuildContext context) {
    return Text("About in table");
  }
}
