import 'package:flutter/material.dart';

import 'widgets/bodyHome.widget.dart';
import 'widgets/bottomNavigationBarWidget/bottomNavigationBar.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: BodyHomePage(),
    );
  }
}
