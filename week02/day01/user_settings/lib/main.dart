import 'package:flutter/material.dart';
import 'package:user_settings/models.dart';
import 'package:user_settings/preferences_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  var _selectedLanguage = Set<ProgrammingLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSetting();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguage = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Setting'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            RadioListTile(
                title: Text("Female"),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue)),
            RadioListTile(
                title: Text("Male"),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue)),
            RadioListTile(
                title: Text("Other"),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue)),
            CheckboxListTile(
              title: Text('Dart'),
              value: _selectedLanguage.contains(ProgrammingLanguage.DART),
              onChanged: (_) {
                setState(() {
                  _selectedLanguage.contains(ProgrammingLanguage.DART)
                      ? _selectedLanguage.remove(ProgrammingLanguage.DART)
                      : _selectedLanguage.add(ProgrammingLanguage.DART);
                });
              },
            ),
            CheckboxListTile(
              title: Text('JavaScript'),
              value: _selectedLanguage.contains(ProgrammingLanguage.JAVASCRIPT),
              onChanged: (_) {
                setState(() {
                  _selectedLanguage.contains(ProgrammingLanguage.JAVASCRIPT)
                      ? _selectedLanguage.remove(ProgrammingLanguage.JAVASCRIPT)
                      : _selectedLanguage.add(ProgrammingLanguage.JAVASCRIPT);
                });
              },
            ),
            CheckboxListTile(
              title: Text('Kotlin'),
              value: _selectedLanguage.contains(ProgrammingLanguage.KOTLIN),
              onChanged: (_) {
                setState(() {
                  _selectedLanguage.contains(ProgrammingLanguage.KOTLIN)
                      ? _selectedLanguage.remove(ProgrammingLanguage.KOTLIN)
                      : _selectedLanguage.add(ProgrammingLanguage.KOTLIN);
                });
              },
            ),
            CheckboxListTile(
              title: Text('Swift'),
              value: _selectedLanguage.contains(ProgrammingLanguage.SWIFT),
              onChanged: (_) {
                setState(() {
                  _selectedLanguage.contains(ProgrammingLanguage.SWIFT)
                      ? _selectedLanguage.remove(ProgrammingLanguage.SWIFT)
                      : _selectedLanguage.add(ProgrammingLanguage.SWIFT);
                });
              },
            ),
            SwitchListTile(
                title: Text('Is Employed '),
                value: _isEmployed,
                onChanged: (newValue) =>
                    setState(() => _isEmployed = newValue)),
            TextButton(onPressed: _saveSetting, child: Text('Save Settings')),
          ],
        ),
      ),
    );
  }

  void _saveSetting() {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        programmingLanguages: _selectedLanguage,
        isEmployed: _isEmployed);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
  }
}
