import 'package:flutter/material.dart';

class customappbar extends StatelessWidget {
  const customappbar({required this.namebar, required this.icon, this.onPressed});
  final String namebar;
  final IconData icon;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            namebar,
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 40,
            width: 40,
            child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
