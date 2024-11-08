import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final TextEditingController _controller = TextEditingController();
  String? _savedUsername;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Store data
  Future<void> _storeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    _loadData(); // Reload data to update UI
  }

  // Load data
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUsername = prefs.getString('username') ?? 'No data saved';
    });
  }

  // Remove specific data
  Future<void> _removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    _loadData(); // Reload data to update UI
  }

  // Clear all data
  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _loadData(); // Reload data to update UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Saved Username: $_savedUsername'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter username'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _storeData,
              child: Text('Save Username'),
            ),
            ElevatedButton(
              onPressed: _loadData,
              child: Text('Load Username'),
            ),
            ElevatedButton(
              onPressed: _removeData,
              child: Text('Remove Username'),
            ),
            ElevatedButton(
              onPressed: _clearData,
              child: Text('Clear All Data'),
            ),
          ],
        ),
      ),
    );
  }
}
