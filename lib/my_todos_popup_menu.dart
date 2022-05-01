import 'package:flutter/material.dart';

class MyTodosPopupMenu extends StatelessWidget {
  const MyTodosPopupMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
            child: MyTodoMenuItem(
              iconData: Icons.tune,
              title: Text('View'),
            ),
          ),
          const PopupMenuItem(
            child: MyTodoMenuItem(
              title: Text('Select tasks'),
              iconData: Icons.copy,
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            child: MyTodoMenuItem(
              title: Text('Activity logs'),
              iconData: Icons.monitor_heart_outlined,
            ),
          ),
        ];
      },
    );
  }
}

class MyTodoMenuItem extends StatelessWidget {
  const MyTodoMenuItem({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  final Text title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(
          width: 4,
        ),
        title
      ],
    );
  }
}
