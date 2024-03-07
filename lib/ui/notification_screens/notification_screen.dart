import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Уведомления')),
          actions: const [SizedBox(width: 70)],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Новое сообщение:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                thickness: 3,
                color: Colors.grey,
              ),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('${message.notification?.title}'),
                    const SizedBox(height: 5),
                    Text('${message.notification?.body}'),
                    const SizedBox(height: 5),
                    Text('${message.data}'),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ],
          ),
        ));
  }
}
