import 'package:flutter/material.dart';

//    {
//      "widgetId": 370,
//      "name": '下拉菜单自定义菜单项',
//      "priority": 3,
//      "subtitle":
//          "可以通过 DropdownMenuEntry 的 labelWidget 定制构建菜单项。",
//    }
class User {
  final String name;
  final bool man;
  final String image;

  const User(this.name, this.man, this.image);

  @override
  String toString() {
    return 'User{name: $name, man: $man, image: $image}';
  }
}

class DropdownMenuNode3 extends StatefulWidget {
  const DropdownMenuNode3({ super.key });

  @override
  State<DropdownMenuNode3> createState() => _DropdownMenuNode3State();
}

class _DropdownMenuNode3State extends State<DropdownMenuNode3> {
  late final TextEditingController controller;

   List<User> data = const [
    User('toly', true, 'icon_5.webp'),
    User('toly49', false, 'icon_6.webp'),
    User('toly42', true, 'icon_7.webp'),
    User('toly56', false, 'icon_8.webp'),
    User('card', true, 'icon_5.webp'),
    User('ls', true, 'icon_6.webp'),
    User('alex', true, 'icon_7.webp'),
    User('fan sha', false, 'icon_8.webp'),
  ];

  User? _selectUser;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Created by Google Bard from 'create a lyrical phrase of about 25 words that begins with "is a color"'.
    const String longText = 'is a color that sings of hope, A hue that shines like gold. It is the color of dreams, A shade that never grows old.';

    return Scaffold(
      body: Center(
        child: DropdownMenu<User>(
          width: 300,
          menuHeight: 250,
          controller: controller,
          leadingIcon:  _selectUser!=null?SizedBox(
            width: 26,
            height: 26,
            child: Center(
              child: CircleAvatar(
                radius: 14,
                foregroundColor: Colors.transparent,
                backgroundImage:
                AssetImage('assets/images/head_icon/${_selectUser!.image}', package: 'flutter_unit'),
              ),
            ),
          ):null,
          label: const Text('选择用户'),
          onSelected: (User? user) {
            print('Selected $user');
            setState(() {
              _selectUser = user;

            });
          },
          dropdownMenuEntries: data.map<DropdownMenuEntry<User>>((User user) {
            final String labelText = '${user.name} $longText\n';
            return DropdownMenuEntry<User>(
              value: user,
              label: user.name,
              // Try commenting the labelWidget out or changing
              // the labelWidget's Text parameters.
              labelWidget: _UserItem(user: user),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class _UserItem extends StatelessWidget {
  final User user;

  const _UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            foregroundColor: Colors.transparent,
            backgroundImage:
            AssetImage('assets/images/head_icon/${user.image}', package: 'flutter_unit'),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(user.name),
              Text(
                '性别: ${user.man ? '男' : '女'}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
