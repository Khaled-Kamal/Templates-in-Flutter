

# 🌗 Flutter Dark & Light Mode Toggle

مثال بسيط لعمل زرار يبدّل بين **Dark Mode** و **Light Mode** في Flutter باستخدام
`ValueNotifier` و `ValueListenableBuilder` بدون أي State Management معقد.

---

## ✨ الفكرة

* نستخدم `ValueNotifier<ThemeMode>` لتخزين حالة الثيم
* نربطه بـ `MaterialApp`
* نغيّر القيمة عن طريق زرار

---

## 📌 الخطوة 1: إنشاء Theme Notifier

```dart
ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.light);
```

---

## 📌 الخطوة 2: ربطه بـ MaterialApp

```dart
ValueListenableBuilder<ThemeMode>(
  valueListenable: themeNotifier,
  builder: (context, ThemeMode mode, _) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: const HomeScreen(),
    );
  },
);
```

---

## 📌 الخطوة 3: زرار التبديل بين Dark و Light

```dart
IconButton(
  icon: const Icon(Icons.brightness_6),
  onPressed: () {
    themeNotifier.value =
        themeNotifier.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
  },
);
```

---

## 🧪 مثال شاشة كاملة

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Toggle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeNotifier.value =
                  themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Hello Flutter 👋',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
