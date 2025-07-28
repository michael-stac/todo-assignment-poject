
```markdown
# 🛍️ Flutter FakeStore App

A complete Flutter application that displays products from the [FakeStore API](https://fakestoreapi.com/).  
Built using **MVVM architecture** with `provider`, this app demonstrates clean code structure, state management, and API integration.


## 🚀 Features

- 🔍 View all products from API  
- 📄 Detailed product view by ID  
- ✅ MVVM architecture using `ChangeNotifier`  
- 💡 Provider for state management  
- 🌐 REST API integration using `http`  
- 💥 Error handling and loading indicators  

---

## 📂 Project Structure

```

lib/
├── models/
│   └── product\_model.dart
├── services/
│   └── product\_service.dart
├── viewmodels/
│   └── product\_view\_model.dart
├── screens/
│   ├── product\_list\_screen.dart
│   └── product\_detail\_screen.dart
└── main.dart

````

---

## ▶️ How to Run the Project

### 1. ✅ Prerequisites

- Flutter SDK installed — [Flutter Install Guide](https://flutter.dev/docs/get-started/install)  
- A device/emulator or simulator  
- Any IDE (VS Code, Android Studio, etc.)

### 2. 📥 Clone the Repository

```bash
git clone https://github.com/your-username/flutter-fakestore-app.git
cd flutter-fakestore-app
````

### 3. 📦 Install Dependencies

```bash
flutter pub get
```

### 4. ▶️ Run the App

```bash
flutter run
```

