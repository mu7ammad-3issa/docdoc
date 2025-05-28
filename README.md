# DocDoc - Doctor Appointment App

**Version:** 1.0.2+1

DocDoc is a Flutter application designed to help users manage and schedule medical appointments easily, providing a new and streamlined experience.

## 📸 Screenshots

### Splash
![Screenshot_٢٠٢٥٠٤٣٠-١٩٤٢٥٧](https://github.com/user-attachments/assets/a4edffe3-f1fd-4ada-b607-45e445fcd283)


### Onboarding
![Screenshot_٢٠٢٥٠٤٣٠-٠٦٤٦٠١](https://github.com/user-attachments/assets/45b2d9aa-1a8a-492c-a921-7fb9a2d68183)

### Authentication (Login & Sign-Up)
![Screenshot_٢٠٢٥٠٥٠٦-٢٣٠٩٢١](https://github.com/user-attachments/assets/9bdd0ba6-ed52-4376-bd13-d0c06933451c) ![Screenshot_٢٠٢٥٠٥٠٨-١١١٠٣٤](https://github.com/user-attachments/assets/56a7bcff-014b-4dbe-b56c-5c9c0802adaf)

### Home Screen
![Screenshot_٢٠٢٥٠٥٢٣-١٤٣١١٥](https://github.com/user-attachments/assets/25abe966-eb20-48c4-9bbb-37f3417a1721)


## 🎨 System Design

The project follows a feature-first architecture, with a clear separation of concerns between core functionalities and feature-specific modules.

```plaintext
lib/
├── core/                      # Core modules and shared utilities
│   ├── di/                    # Dependency injection configuration (get_it)
│   ├── helpers/               # Common utility classes and functions (constants, extensions, regex, shared_pref_helper, spacing)
│   ├── networking/            # HTTP client setup (Dio + Retrofit)
│   ├── routing/               # Navigation and route management
│   ├── theming/               # App-wide theme and style definitions (colors, font_weight_helper, styles)
│   └── widgets/               # Shared reusable widgets (app_text_button, app_text_form_field)
│
├── features/                  # Feature-specific modules
│   └── feature_name/          # Individual feature module (e.g., login, sign_up, home)
│       ├── data/              # Data layer for handling business logic
│       │   ├── models/        # Data models specific to the feature
│       │   └── repo/          # Repositories for data operations
│       │
│       ├── logic/             # Business logic and state management
│       │   ├── cubit/         # Cubit for state management
│       │   └── states/        # State definitions for the cubit
│       │
│       └── ui/                # Presentation layer
│           ├── widgets/       # Feature-specific reusable widgets
│           └── screens/       # Screen implementations for the feature
│
├── main_development.dart      # Main entry point for development environment
├── main_production.dart       # Main entry point for production environment
└── doc_app.dart               # Root application widget
```


## ✨ Features

* **Onboarding:** Smooth introduction for new users.
* **Authentication:** Secure login and sign-up functionalities.
* **Home Screen:**
    * Display doctor specializations.
    * List doctors based on selected specialization.
    * User-friendly interface to find and book appointments.
* **Firebase Integration:** Utilizes Firebase for services like App Distribution.

## 🚀 Getting Started

### Prerequisites

* Flutter SDK: Version 3.24.4 or higher (stable channel)
* Java JDK: Version 17.0.12
* Ruby: Version 3.4.2
* Bundler

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/mu7ammad-3issa/docdoc.git](https://github.com/mu7ammad-3issa/docdoc.git)
    cd docdoc
    ```
2.  **Install Flutter dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Setup Ruby for Android (Fastlane):**
    ```bash
    cd android
    bundle install
    cd ..
    ```
   
4.  **Configure Firebase:**
    * Place your `google-services.json` file in `android/app/`.
    * Configure iOS Firebase setup as per `lib/firebase_options.dart`.

### Running the App

* **Development:**
    ```bash
    flutter run lib/main_development.dart --flavor Development
    ```
    Or use the VSCode launch configuration "DocDoc Development".
* **Production:**
    ```bash
    flutter run lib/main_production.dart --flavor Production
    ```
    Or use the VSCode launch configuration "DocDoc Production".

## 🛠️ Built With

* **Flutter** - UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Dart** - Programming language used by Flutter.
* **Bloc/Cubit** - State management solution.
* **GetIt** - Service locator for dependency injection.
* **Dio** - HTTP client for Dart.
* **Retrofit** - Type-safe HTTP client generator for Dio.
* **Freezed** - Code generator for immutable classes and unions.
* **json_serializable** - For automatic JSON serialization/deserialization.
* **Flutter Secure Storage** - For secure data storage.
* **Shared Preferences** - For simple key-value data storage.
* **Flutter ScreenUtil** - For adapting screen and font size.
* **Cached Network Image** - To load and cache network images.
* **Shimmer** - For loading animations.
* **Firebase Core** - For Firebase initialization.
* **Flutter Native Splash** - For customizing the native splash screen.

## ⚙️ Project Structure Highlights

* **Core:** Contains shared modules for:
    * Dependency Injection (`get_it`)
    * Networking (Dio, Retrofit, API constants, error handling)
    * Routing (`AppRouter`, named routes)
    * Helpers (App Regex, Constants, Extensions, Shared Preferences)
    * Theming (Colors, Fonts, Styles)
    * Shared Widgets
* **Features:** Each feature (e.g., Login, SignUp, Home) is modularized with its own data, logic (Cubit), and UI layers.
* **Firebase Configuration:**
    * `firebase.json`: Defines Firebase project IDs and app IDs for different platforms.
    * `android/app/google-services.json`: Android Firebase configuration.
    * `lib/firebase_options.dart`: Dart Firebase configuration options for different platforms.
* **Splash Screen:** Configured via `flutter_native_splash.yaml`.

## 🔧 Linting

The project uses `flutter_lints` for static analysis to encourage good coding practices. Custom lint rules can be configured in `analysis_options.yaml`.

## 🚀 CI/CD (Android - Firebase App Distribution)

A GitHub Actions workflow is set up to build and distribute the Android app to Firebase App Distribution on pushes to the `master` branch.

The workflow (`.github/workflows/android_fastlane_firebase_app_distribution_workflow.yml`) involves:
1.  Checking out the repository code.
2.  Setting up JDK 17.
3.  Installing Flutter (version 3.24.4, stable channel).
4.  Setting up Ruby (version 3.4.2) and caching gems.
5.  Building and distributing the app using Fastlane (`firebase_distribution` lane).

### Fastlane (Android)

The Android Fastlane setup includes a `firebase_distribution` lane for building and distributing the app.
The Fastfile for Android executes the following steps:
1.  `flutter clean`
2.  `flutter build apk --release --flavor production --target lib/main_production.dart --no-tree-shake-icons`
3.  `firebase_app_distribution` (distributes the built APK)


## 📱 Platform Specifics

### Android

* **Package Name:** `com.example.flutter_complete_project`
* **MainActivity:** `com.example.flutter_complete_project.MainActivity` (Kotlin)
* **Permissions:** `android.permission.INTERNET` is used for development (hot reload, etc.) and profile builds.
* **Launch Background & Styles:** Customized launch backgrounds and themes are defined in `res/drawable*` and `res/values*` directories.
* **Gradle:** Uses Gradle version 8.3. JVM arguments for Gradle are configured in `gradle.properties`.

### iOS

* **Bundle ID:** `com.example.flutterCompleteProject`
* **AppDelegate:** Standard Flutter `AppDelegate.swift`.
* **Assets:** App icons and launch images are managed in `Assets.xcassets`.

### Web, Linux, macOS, Windows

Standard Flutter project structure for these platforms is included.

## 🧪 Testing

A basic widget test example is provided in `test/widget_test.dart`.

## 🤝 Contributing

Contributions are welcome! Please follow the existing code style and structure.
