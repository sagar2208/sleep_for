import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const AlarmApp());
}

class AlarmApp extends StatelessWidget {
  const AlarmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm',
      theme: ThemeData(
        brightness: Brightness.dark, // Set dark mode here
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Alarm'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 12),
            const Text(
              'Set an alarm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                children: [
                  AlarmSlab(hours: 1),
                  SizedBox(height: 12),
                  AlarmSlab(hours: 2),
                  SizedBox(height: 12),
                  AlarmSlab(hours: 3),
                  SizedBox(height: 12),
                  AlarmSlab(hours: 4),
                  SizedBox(height: 12),
                  AlarmSlab(hours: 0, isManual: true, label: 'Manual'),
                ],
              ),
            ),
            const Divider(
              height: 32,
              thickness: 2,
              indent: 16,
              endIndent: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmSlab extends StatefulWidget {
  const AlarmSlab({
    Key? key,
    required this.hours,
    this.isManual = false,
    this.label,
  }) : super(key: key);

  final int hours;
  final bool isManual;
  final String? label;

  @override
  _AlarmSlabState createState() => _AlarmSlabState();
}

class _AlarmSlabState extends State<AlarmSlab> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isSelected ? Colors.grey : Colors.grey.withOpacity(0.5),
            width: 3,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.access_alarm,
              size: 48,
            ),
            const SizedBox(width: 16),
            Text(
              widget.label ?? '${widget.hours} hours',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (widget.isManual) const Spacer(),
          ],
        ),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
