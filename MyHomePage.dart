// lib/MyHomePage.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glassmorphic Card'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassmorphicCard(
                title: 'Square Card',
                width: 150,
                height: 150,
                content: 'csdcdvd',
              ),
              const SizedBox(height: 20),
              GlassmorphicCard(
                title: 'Rectangular Card',
                content: 'This is a rectangular glassmorphic card.',
                width: 300,
                height: 150,
              ),
              const SizedBox(height: 20),
              GlassmorphicCard(
                title: 'Tall Card',
                content: 'This is a tall glassmorphic card.',
                width: 150,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlassmorphicCard extends StatefulWidget {
  final String title;
  final String content;
  final double? width; // Optional width
  final double? height; // Optional height

  const GlassmorphicCard({
    Key? key,
    required this.title,
    required this.content,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _GlassmorphicCardState createState() => _GlassmorphicCardState();
}

class _GlassmorphicCardState extends State<GlassmorphicCard> {
  double _scale = 1.0; // Initial scale factor

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95; // Scale down when pressed
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Return to original scale
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0; // Reset scale if tap is canceled
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 100), // Smooth transition
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Material(
                color: Colors.transparent, // Required for InkWell splash to show correctly
                child: InkWell(
                  borderRadius: BorderRadius.circular(20), // Rounded corners for splash
                  splashColor: Colors.white.withOpacity(0.2),
                  onTap: () {
                    // Optional: define behavior on card tap here
                    print("${widget.title} card tapped!");
                  },
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.25),
                          Colors.white.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(-5, -5),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.content,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
