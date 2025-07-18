import 'package:flutter/material.dart';
import 'package:strenu_utils/strenu_utils.dart';

class ServicesScreen extends StrenuAppSizeStatefulWidget {
  const ServicesScreen({super.key});

  @override
  StrenuAppSizeStatefulWidgetState<StrenuAppSizeStatefulWidget> createState() {
    return _ServicesScreenState();
  }
}

class _ServicesScreenState extends StrenuAppSizeStatefulWidgetState<ServicesScreen> {
  @override
  Widget desktop(BuildContext context) {
    return Text("Services in desktop");
  }

  @override
  Widget mobile(BuildContext context) {
    return Text("Services in mobile");
  }

  @override
  Widget table(BuildContext context) {
    return Text("Services in table");
  }
}
