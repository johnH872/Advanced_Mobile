import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leadingIcon;
  final IconButton? button_1;
  const CustomAppBar({required this.title, required this.leadingIcon, this.button_1, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:const Color(0xFFFBE186),
      leading: leadingIcon, 
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),), 
      actions: <Widget>[
        button_1 ?? Container(),
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notification',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ]);
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
