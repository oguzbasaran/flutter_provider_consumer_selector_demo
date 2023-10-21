import 'package:flutter/material.dart';
import 'package:flutter_provider_consumer_selector_demo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // Using a TextEditingController to manage the TextField's value.
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selector & Consumer Example')),
      body: Column(
        children: [
          // Selector usage
          Selector<UserProvider, bool>(
            selector: (_, provider) => provider.user.isOnline,
            builder: (context, isOnline, child) {
              return ListTile(
                title: Text('User Status'),
                subtitle: Text(isOnline ? 'Online' : 'Offline'),
              );
            },
          ),
          // Consumer usage
          Consumer<UserProvider>(
            builder: (context, provider, child) {
              return ListTile(
                title: Text('Username'),
                subtitle: Text(provider.user.username),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'New Username',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().toggleOnlineStatus();
            },
            child: Text('Toggle Status'),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<UserProvider>()
                  .changeUsername(_usernameController.text);
            },
            child: Text('Change Username'),
          ),
        ],
      ),
    );
  }
}
