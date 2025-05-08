import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.textColor,
    this.endIcon = true,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.blue : Colors.black;
    return ListTile(
      onTap: onPressed  ,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: iconColor.withAlpha(45),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 35, color: iconColor,),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor),
      ),
      trailing: endIcon ? Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(45),
          shape: BoxShape.circle,
        ),
        child: Icon(LineAwesomeIcons.angle_right_solid),
      ) : null,
    );
  }
}
