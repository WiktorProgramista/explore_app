import 'package:flutter/material.dart';

class CalendarForm extends StatefulWidget {
  const CalendarForm({super.key});

  @override
  State<CalendarForm> createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  bool isAllDay = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 1));
  String repeatOption = "Nigdy";
  String calendar = "Dom";
  String alert1 = "W dniu wydarzenia (9.00)";
  String alert2 = "Brak";

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = pickedDate;
          if (startDate.isAfter(endDate)) {
            endDate = startDate.add(const Duration(days: 1));
          }
        } else {
          endDate = pickedDate;
          if (endDate.isBefore(startDate)) {
            startDate = endDate.subtract(const Duration(days: 1));
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalendarz imprez"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Gala muzyki filmowej",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              "Hala widowiskowo-sportowa Spodek\nal. Korfantego 35, Katowice",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Wydarzenie całodniowe",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isAllDay,
                  onChanged: (value) {
                    setState(() {
                      isAllDay = value;
                    });
                  },
                ),
              ],
            ),
            const Divider(),

            ListTile(
              title: const Text("Początek"),
              subtitle: Text("${startDate.toLocal()}".split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, true),
            ),

            ListTile(
              title: const Text("Koniec"),
              subtitle: Text("${endDate.toLocal()}".split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, false),
            ),
            const Divider(),
            // Powtarzaj
            ListTile(
              title: const Text("Powtarzaj"),
              subtitle: Text(repeatOption),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            // Kalendarz
            ListTile(
              title: const Text("Kalendarz"),
              subtitle: Text(calendar),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            // Alert 1
            ListTile(
              title: const Text("Alert"),
              subtitle: Text(alert1),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            // Alert 2
            ListTile(
              title: const Text("2. alert"),
              subtitle: Text(alert2),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
