import 'package:flutter/material.dart';
import 'package:strenu_utils/strenu_utils.dart';

class HomeScreen extends StrenuAppSizeStatefulWidget {
  const HomeScreen({super.key});

  @override
  StrenuAppSizeStatefulWidgetState<StrenuAppSizeStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends StrenuAppSizeStatefulWidgetState<HomeScreen> {
  @override
  Widget desktop(BuildContext context) {
    return Text("Home screen in desktop");
  }

  @override
  Widget mobile(BuildContext context) {
    return Text("Home screen in mobile");
  }

  @override
  Widget table(BuildContext context) {
    return Text("Home screen in table");
  }
}
