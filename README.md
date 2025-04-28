# doc_app

## 🎨 System Design

```plaintext
lib/
├── core/                      # Core modules and shared utilities
│   ├── di/                    # Dependency injection configuration (get_it)
│   ├── networking/            # HTTP client setup (Dio + Retrofit)
│   ├── routing/               # Navigation and route management
│   ├── helpers/               # Common utility classes and functions
│   ├── theming/               # App-wide theme and style definitions
│   └── widgets/               # Shared reusable widgets
│                      
├── features/                  # Feature-specific modules
│   └── feature_name/          # Individual feature module
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
