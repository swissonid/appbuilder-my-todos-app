import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: const [
                CircleAvatar(
                  child: Text('P'),
                )
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.inbox,
              color: Colors.blueAccent,
            ),
            title: Text('Inbox'),
          ),
          const ListTile(
            leading: Icon(
              Icons.today,
              color: Colors.green,
            ),
            title: Text('Today'),
          ),
          const ListTile(
            leading: Icon(
              Icons.event_repeat,
              color: Colors.deepPurple,
            ),
            title: Text('Upcompping'),
          )
        ],
      ),
    );
  }
}
