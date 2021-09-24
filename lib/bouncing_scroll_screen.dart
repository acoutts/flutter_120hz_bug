import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BouncingScrollScreen extends StatefulWidget {
  const BouncingScrollScreen({Key? key}) : super(key: key);

  @override
  State<BouncingScrollScreen> createState() => _BouncingScrollScreenState();
}

class _BouncingScrollScreenState extends State<BouncingScrollScreen>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {});
    });
    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            for (var i = 0; i < 50; i++) ...[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(24),
                child: Text(
                  'Test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
            ]
          ],
        ),
      ),
    );
  }
}
