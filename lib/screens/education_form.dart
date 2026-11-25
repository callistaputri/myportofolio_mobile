import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _institution = "";
  String _fieldOfStudy = "";
  DateTime? _started;
  DateTime? _ended;

  String formatDate(DateTime? date) {
    if (date == null) return "";
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  Future<void> selectDate(bool isStart) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: isStart
          ? (_started ?? DateTime.now())
          : (_ended ?? _started ?? DateTime.now()),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        if (isStart) {
          _started = selectedDate;
        } else {
          _ended = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Education Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF1B4AF),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Education Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Institution",
                  hintText: "e.g. Universitas Indonesia",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _institution = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Institution cannot be empty!";
                  }
                  if (value.trim().length > 100) {
                    return "Maximum 100 characters!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Field of Study",
                  hintText: "e.g. Information Systems",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _fieldOfStudy = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Field of study cannot be empty!";
                  }
                  if (value.trim().length > 100) {
                    return "Maximum 100 characters!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Start Date",
                  hintText: "Select start date",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                controller: TextEditingController(text: formatDate(_started)),
                onTap: () => selectDate(true),
                validator: (value) {
                  if (_started == null) {
                    return "Start date is required!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "End Date (Optional)",
                  hintText: "Leave empty if ongoing",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                controller: TextEditingController(text: formatDate(_ended)),
                onTap: () => selectDate(false),
                validator: (value) {
                  if (_ended != null &&
                      _started != null &&
                      _ended!.isBefore(_started!)) {
                    return "End date cannot be before start date!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1B4AF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Education successfully added!"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Institution: $_institution"),
                                Text("Field of Study: $_fieldOfStudy"),
                                Text("Started: ${formatDate(_started)}"),
                                Text(
                                  "Ended: ${_ended == null ? 'Present' : formatDate(_ended)}",
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                  _formKey.currentState!.reset();

                                  setState(() {
                                    _institution = "";
                                    _fieldOfStudy = "";
                                    _started = null;
                                    _ended = null;
                                  });
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
