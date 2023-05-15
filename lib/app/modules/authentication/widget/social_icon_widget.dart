part of '../views/authentication_view.dart';

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final String iconURL;
  final void Function() onPressed;
  const SocialIcon({Key? key, required this.colors, required this.iconURL, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: colors)),
      child: RawMaterialButton(
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: SvgPicture.asset(
          iconURL,
          height: 20,
          width: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
