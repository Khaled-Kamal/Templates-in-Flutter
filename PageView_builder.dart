import 'package:flutter/material.dart';

class PageViewBuilderDemo extends StatefulWidget {
  const PageViewBuilderDemo({super.key});

  @override
  State<PageViewBuilderDemo> createState() => _PageViewBuilderDemoState();
}

class _PageViewBuilderDemoState extends State<PageViewBuilderDemo> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageView.builder Demo")),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: colors.length, 
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  color: colors[index],
                  child: Center(
                    child: Text(
                      "Page ${index + 1}",
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text("Current Page: $_currentPage", style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
