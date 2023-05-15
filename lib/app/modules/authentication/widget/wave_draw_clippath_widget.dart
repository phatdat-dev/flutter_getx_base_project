part of '../views/authentication_view.dart';

class WaveDrawClipPathWidget extends StatelessWidget {
  const WaveDrawClipPathWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green.shade50, Colors.blue.shade50])),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green.shade100, Colors.blue.shade100])),
            child: const Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green, Theme.of(context).colorScheme.primary])),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Icon(
                  Icons.fastfood,
                  color: Colors.white,
                  size: 60,
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w700, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
