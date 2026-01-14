import '../../services/google_calendar_service.dart';
import 'package:flutter/material.dart';
import '../../data/models/tasbeeh_model.dart';
import '../../services/google_calendar_service.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController targetController = TextEditingController();

  int currentCount = 0;
  String selectedTargetType = 'Daily';

  void incrementCount() {
    setState(() {
      currentCount++;
    });
  }

  Future<void> submitTasbeeh() async {
    final String name = nameController.text.trim();
    final int target = int.tryParse(targetController.text) ?? 0;

    if (name.isEmpty || target <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid tasbeeh details')),
      );
      return;
    }

    final tasbeeh = Tasbeeh(
      name: name,
      currentCount: currentCount,
      targetCount: target,
      startDate: DateTime.now(),
    );

    try {
      await GoogleCalendarService().addTasbeehEvent(
        tasbeehName: tasbeeh.name,
        targetCount: tasbeeh.targetCount,
        targetType: selectedTargetType,
        startDate: tasbeeh.startDate,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tasbeeh added & synced with Google Calendar'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sync with Google Calendar'),
        ),
      );
    }

    setState(() {
      nameController.clear();
      targetController.clear();
      currentCount = 0;
      selectedTargetType = 'Daily';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3ECE5),
      appBar: AppBar(
        title: const Text('Tasbeeh Tracker'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4A3728),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tasbeeh Name
            const Text(
              'Tasbeeh Name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'e.g. SubhanAllah',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Target Type
            const Text(
              'Target Type',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildTargetChip('Daily'),
                const SizedBox(width: 10),
                _buildTargetChip('Monthly'),
              ],
            ),

            const SizedBox(height: 20),

            // Target Count
            const Text(
              'Target Count',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: targetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g. 1000',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Current Counter
            Center(
              child: Column(
                children: [
                  Text(
                    '$currentCount',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A3728),
                    ),
                  ),
                  const Text(
                    'Current Count',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Increment Button
            Center(
              child: ElevatedButton(
                onPressed: incrementCount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A3728),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  elevation: 6,
                ),
                child: const Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitTasbeeh,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A3728),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Submit Tasbeeh',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetChip(String type) {
    final bool isSelected = selectedTargetType == type;

    return ChoiceChip(
      label: Text(type),
      selected: isSelected,
      selectedColor: const Color(0xFF4A3728),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
      onSelected: (_) {
        setState(() {
          selectedTargetType = type;
        });
      },
    );
  }
}
