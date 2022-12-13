import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget  with PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
    );
  }

  //some wierd stuff to solve app bar glitches
  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
