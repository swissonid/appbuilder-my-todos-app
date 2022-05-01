import 'package:flutter/material.dart';

class MyTodosNavigationBar extends StatelessWidget {
  const MyTodosNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BottomAppBar(
      color: themeData.primaryColor,
      shape: const CircularNotchedRectangle(),
      elevation: 4,
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavBarIconButton(
              onPressed: () {},
              iconData: Icons.menu,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavBarIconButton(
                  onPressed: () {},
                  iconData: Icons.search,
                ),
                _NavBarIconButton(
                  onPressed: () {},
                  iconData: Icons.add_alert_outlined,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NavBarIconButton extends StatelessWidget {
  const _NavBarIconButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).primaryIconTheme.color;
    return IconButton(
      onPressed: () {},
      color: iconColor,
      icon: Icon(iconData),
    );
  }
}
