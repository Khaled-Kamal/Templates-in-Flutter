import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationTemplatePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimationTemplatePage extends StatefulWidget {
  const AnimationTemplatePage({super.key});

  @override
  State<AnimationTemplatePage> createState() => _AnimationTemplatePageState();
}

class _AnimationTemplatePageState extends State<AnimationTemplatePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _scaleAnim;
  late final Animation<double> _rotationAnim;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  bool _playingForward = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Scale: 0.8 -> 1.05 -> 1.0 (using a curved tween)
    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.05).chain(CurveTween(curve: Curves.easeOut)), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 40),
    ]).animate(_controller);

    // Rotation: -6deg -> 6deg -> 0
    _rotationAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: -0.1, end: 0.1).chain(CurveTween(curve: Curves.easeInOut)), weight: 70),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0.0).chain(CurveTween(curve: Curves.easeOut)), weight: 30),
    ]).animate(_controller);

    // Fade: 0 -> 1
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Slide: from below (0,0.25) -> center (0,0)
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOutCubic))
        .animate(_controller);

    // Start animation automatically
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_controller.isAnimating) return;
    if (_playingForward) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _playingForward = !_playingForward;
  }

  void _replay() {
    _controller.reset();
    _controller.forward();
    _playingForward = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Template'),
        actions: [
          IconButton(
            tooltip: 'Replay',
            onPressed: _replay,
            icon: const Icon(Icons.replay),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnim,
                    child: SlideTransition(
                      position: _slideAnim,
                      child: Transform.scale(
                        scale: _scaleAnim.value,
                        child: Transform.rotate(
                          angle: _rotationAnim.value,
                          child: child,
                        ),
                      ),
                    ),
                  );
                },
                child: _buildCard(),
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_controller.isAnimating) return;
                      _controller.forward();
                      _playingForward = true;
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Play'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_controller.isAnimating) return;
                      _controller.reverse();
                      _playingForward = false;
                    },
                    icon: const Icon(Icons.reverse),
                    label: const Text('Reverse'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _toggleAnimation,
                    icon: const Icon(Icons.shuffle),
                    label: const Text('Toggle'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: 300,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.flutter_dash, size: 44),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Animated Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 6),
                    Text('This is a reusable animation template.\nCustomize the child widget to fit your UI.',
                        style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
