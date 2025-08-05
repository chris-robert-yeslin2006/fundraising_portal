<h1 align="center">💰 Fundraising Intern Portal – Flutter App</h1>
<h3 align="center">https://github.com/chris-robert-yeslin2006/fundraising_portal</h3>
<p align="center">
  A comprehensive <strong>Flutter mobile app</strong> designed for fundraising interns to track their progress, view leaderboards, and manage their fundraising journey with <strong>beautiful UI</strong>, <strong>smooth animations</strong>, and <strong>clean architecture</strong>.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Framework-Flutter-02569B?style=for-the-badge&logo=flutter" />
  <img src="https://img.shields.io/badge/Language-Dart-0175C2?style=for-the-badge&logo=dart" />
  <img src="https://img.shields.io/badge/Architecture-Clean-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/UI-Material%203-blue?style=for-the-badge&logo=material-design" />
  <img src="https://img.shields.io/badge/Fonts-Google%20Fonts-4285F4?style=for-the-badge&logo=google" />
  <img src="https://img.shields.io/badge/State-BLoC-orange?style=for-the-badge" />
</p>

---

## ✨ Features

- 🔐 **Elegant Authentication UI** – Login/SignUp with smooth animations
- 📊 **Interactive Dashboard** – Real-time stats, progress tracking, and rewards
- 🏆 **Dynamic Leaderboard** – Ranking system with user highlighting
- 📢 **Announcements Hub** – Important updates with priority indicators
- 🎁 **Rewards System** – Gamified achievement tracking with visual progress
- 📱 **Responsive Design** – Optimized for all screen sizes
- 🎨 **Modern UI/UX** – Material Design 3 with custom theming
- ⚡ **Smooth Animations** – Engaging transitions and micro-interactions

---

## 🧱 Tech Stack

| Layer          | Technology                               |
|----------------|------------------------------------------|
| Framework      | Flutter 3.10+ with Dart 3.0+           |
| Architecture   | Clean Architecture + Feature-based      |
| State Mgmt     | flutter_bloc (BLoC Pattern)             |
| Navigation     | go_router (Declarative routing)         |
| UI/Styling     | Material Design 3 + Custom Components   |
| Typography     | Google Fonts (Poppins)                  |
| Data           | Mock Data (Ready for backend)           |
| Testing        | Unit + Widget Tests                      |

---

## 📂 Project Structure
lib/
├── main.dart                    # App entry point
├── app/
│   ├── app.dart                # Main app configuration
│   └── routes/
│       └── app_routes.dart     # Route definitions
├── core/
│   ├── constants/              # App-wide constants
│   │   ├── app_colors.dart     # Color palette
│   │   ├── app_strings.dart    # String constants
│   │   └── app_text_styles.dart # Typography
│   ├── models/                 # Data models
│   │   ├── intern.dart         # Intern model
│   │   ├── announcement.dart   # Announcement model
│   │   └── reward.dart         # Reward model
│   └── utils/
│       └── mock_data.dart      # Sample data
├── features/                   # Feature modules
│   ├── auth/
│   │   └── pages/
│   │       └── login_page.dart
│   ├── dashboard/
│   │   └── pages/
│   │       └── dashboard_page.dart
│   ├── leaderboard/
│   │   └── pages/
│   │       └── leaderboard_page.dart
│   └── announcements/
│       └── pages/
│           └── announcements_page.dart
└── shared/
└── widgets/                # Reusable components
├── custom_button.dart
├── custom_text_field.dart
├── stats_card.dart
└── bottom_nav_bar.dart

---

## 🚀 Getting Started

### 1️⃣ Prerequisites
```bash
flutter --version  # Ensure Flutter 3.10+
dart --version     # Ensure Dart 3.0+
2️⃣ Clone the repository
bashgit clone https://github.com/chris-robert-yeslin2006/fundraising_portal.git
cd fundraising_portal
3️⃣ Install dependencies
bashflutter pub get
4️⃣ Run the app
bashflutter run

🎨 UI Components
🔑 Authentication

Animated Login Screen with smooth transitions
Form Validation with real-time feedback
Social Login Ready UI components

📊 Dashboard Features
ComponentDescriptionStats CardsTotal raised, rank, referral code, rewardsProgress BarsVisual fundraising progress trackingRewards GalleryUnlocked achievements with animationsQuick ActionsEasy access to key features
🏆 Leaderboard System

Rank Badges with custom icons for top 3
Current User Highlighting with special styling
Real-time Updates with smooth animations
Progress Indicators showing fundraising amounts


🎭 Mock Data Structure
dart// Sample Intern Data
final currentIntern = Intern(
  id: '1',
  name: 'Alex Johnson',
  email: 'alex@example.com',
  referralCode: 'ALEX2025',
  totalRaised: 15000,
  rank: 3,
);

// Sample Rewards
final rewards = [
  Reward(title: 'Bronze Badge', requiredAmount: 5000, isUnlocked: true),
  Reward(title: 'Silver Badge', requiredAmount: 10000, isUnlocked: true),
  // ... more rewards
];

🎨 Design System
🌈 Color Palette
dart// Primary Colors
Primary: #6366F1 (Indigo)
Secondary: #8B5CF6 (Purple)
Success: #10B981 (Emerald)
Warning: #F59E0B (Amber)
Error: #EF4444 (Red)
📝 Typography

Font Family: Poppins (Google Fonts)
Heading 1: 32px, Bold
Heading 2: 24px, SemiBold
Body Large: 16px, Regular
Caption: 12px, Regular


📱 Screenshots
<div align="center">
  <img src="screenshots/login.png" alt="Login Screen" width="250"/>
  <img src="screenshots/dashboard.png" alt="Dashboard" width="250"/>
  <img src="screenshots/leaderboard.png" alt="Leaderboard" width="250"/>
</div>
<div align="center">
  <img src="screenshots/announcements.png" alt="Announcements" width="250"/>
  <img src="screenshots/rewards.png" alt="Rewards" width="250"/>
</div>

🚀 Future Enhancements

 🔌 Backend Integration (Firebase/Supabase)
 🔔 Push Notifications for announcements
 📈 Analytics Dashboard with charts
 🌐 Multi-language Support (i18n)
 🌙 Dark Mode implementation
 💾 Offline Support with local storage
 📊 Data Export functionality
 🎯 Goal Setting and tracking


🛠️ Dependencies
yamldependencies:
  flutter: sdk: flutter
  google_fonts: ^6.1.0      # Custom typography
  flutter_bloc: ^8.1.3      # State management
  go_router: ^12.1.1        # Navigation

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^3.0.0     # Code analysis

🧪 Testing
Run tests with:
bashflutter test                    # Unit tests
flutter test integration_test/  # Integration tests

🤝 Contributing

Fork the repository
Create your feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'Add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request


📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙋‍♂️ Author
👨‍💻 Chris Robert Yeslin

📧 Email: robertchemist2006@gmail.com
💼 LinkedIn: @chris-robert
📷 Instagram: @yeslin_parker
🐙 GitHub: @chris-robert-yeslin2006


🌟 Show Your Support
Give a ⭐️ if this project helped you!

<p align="center">💰 "Track. Compete. Achieve. Fundraise with Purpose." 🚀</p>

📞 Support
If you have any questions or need help with setup, feel free to:

📧 Send an email to robertchemist2006@gmail.com
🐛 Open an issue on GitHub
💬 Reach out on social media

<p align="center">
  Made with ❤️ and Flutter
</p>
```
