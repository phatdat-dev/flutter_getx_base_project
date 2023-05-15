part of '../views/authentication_view.dart';

class CustomPrefixIconWidget extends StatelessWidget {
  const CustomPrefixIconWidget({super.key, required this.color, required this.icon});

  final Color color;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(10.0))),
        child: icon);
  }
}
