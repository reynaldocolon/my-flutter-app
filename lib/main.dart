import 'package:flutter/material.dart';
import 'dart:html' as html; // Standard web tool for redirects

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HHR Management Tool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// --- MAIN HOME SCREEN ---
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Reynaldo Colon Home'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.dashboard_customize, size: 64, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              'Welcome to your Management Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Use the menu on the top left to navigate between reports and your portfolio.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- GRANT OVERVIEW SCREEN ---
class GrantOverviewScreen extends StatelessWidget {
  const GrantOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grant Expense Reporting'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.account_balance, color: Colors.green),
                title: Text('State Grants'),
                subtitle: Text('Responsibility: \$5M+'),
                trailing: Icon(Icons.arrow_forward_ios, size: 14),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.location_city, color: Colors.blue),
                title: Text('County Grants'),
                subtitle: Text('Status: Active Reporting'),
                trailing: Icon(Icons.arrow_forward_ios, size: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- REUSABLE NAVIGATION DRAWER ---
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'HHR Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  'Hudson County Office on Aging',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assessment),
            title: const Text('Grant Overview'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const GrantOverviewScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('My Portfolio Site'),
            onTap: () {
              // FORCE REDIRECT: Bypass pop-up blockers by changing the current tab's URL
              html.window.location.href = 'https://reynaldocolon.github.io';
            },
          ),
        ],
      ),
    );
  }
}