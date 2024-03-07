import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';
import '../repositories/shared_prefs.dart';
import '../x_navigations/main_navigations.dart';

//! верхнеуровневая функция для фонового обрабочика сообщение
Future<void> handleBackgroundMessadge(RemoteMessage message) async {
  print('Title111111111111 ${message.notification?.title}');
  print('Body1111111111111 ${message.notification?.body}');
  print('Payload1111111111 ${message.data}');
}

class FirebaseApi {
  //создание экземпляра FirebaseMessaging.instance
  final _firebaseMessaging = FirebaseMessaging.instance;

  //! создание андроид канала, своего рода категории уведомлени
  //! eго нужно зарегистрировать в андроид манифест файле AndroidManifest
  //</activity> ------- нужно добавить:
  //      <meta-data
  //          android:name="com.google.firebase.messaging.default_notification_channel_id"
  //          android:value="high_importantce_channel" />
  final _androidChannel = const AndroidNotificationChannel(
      'high_importantce_channel', 'High Importantce Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.defaultImportance);

  // создание экземпляра плагина локальных уведомлений
  final _localNotifications = FlutterLocalNotificationsPlugin();

//------------------------------------------------------------------------------
  //? функция инициализации уведомлений
  Future<void> initNotofication() async {
    //запрос разрешения от пользователя(диалоговое окно, разрешает или нет)
    await _firebaseMessaging.requestPermission();

    //получение токена(идентификатор нашего устройства)
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token ${(fCMToken)}'); // сейчас печатаем,

    // сохраняем токен в SharedPrefs()(кстати, зачем намего хранить если он каждый раз приходит?)
    final fcmTokenSharedPrefs = await SharedPrefs().getFirebaseToken();
    if ((fcmTokenSharedPrefs ?? '') != fCMToken) {
      await SharedPrefs().setFirebaseToken(fCMToken);
    }
    initPushNotifications();
    initLocalNotification();
  }

//------------------------------------------------------------------------------
  // //? Функция дескриптора сообщений (для всплывающего окна)
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    //навигация
    navigatorKey.currentState?.pushNamed(
        MainNavigationRoutsName.notificationScreen,
        arguments: message);
  }

//------------------------------------------------------------------------------
//? Функция для iOS уведомления переднего плана
  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    // начальное сообщение когда приложение открывается из закрытого состояния
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // добавляем эту строку при открытии приложения
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    //создание фонового обработчика сообщений(когда свернут или закрыт)
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessadge);
    // прослушивании сообщений когда приложение открыта
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      if (notification == null) return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                // скопировать иконку из папки mipmap-xxxhdpi в папку drawable
                icon: '@drawable/ic_launcher')),
        payload: jsonEncode(event.toMap()),
      );
    });
  }

//------------------------------------------------------------------------------
//? Метод локального уведомления  инициализации
  Future initLocalNotification() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          //Указывает, что пользователь выбрал уведомление.
          case NotificationResponseType.selectedNotification:
            final message = RemoteMessage.fromMap(
                jsonDecode((notificationResponse.payload as String)));
            handleMessage(message);
            break;

          //Указывает, что пользователь выбрал действие уведомления.
          case NotificationResponseType.selectedNotificationAction:
            print('selectedNotificationAction!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
            break;
        }
      },
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }
}
