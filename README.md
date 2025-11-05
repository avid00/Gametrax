# Gametrax — Game Tracker & News App (Android, Flutter)

**One-liner:** Gametrax is an Android app (built with Flutter/Dart + Firebase) that helps gamers search, track and organise games, view latest gaming news, and check basic store info — all in one place. 

[![Flutter](https://img.shields.io/badge/Flutter-2.10.1-blue)](#) [![Dart](https://img.shields.io/badge/Dart-2.3.0-blue)](#) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)

---

## Demo / Screenshots
[Demo Video](https://www.youtube.com/watch?v=uQ6j9-H9pJU&feature=youtu.be)
<img width="1344" height="756" alt="image" src="https://github.com/user-attachments/assets/195854f3-3d39-4213-a3a6-fb7cf86e8769" />
<img width="1344" height="756" alt="image" src="https://github.com/user-attachments/assets/0979d0aa-3952-4c3a-b22d-d830653372cf" />
<img width="1344" height="756" alt="image" src="https://github.com/user-attachments/assets/d755f890-e383-4068-81b8-11444b511296" />


---

## Highlights / TL;DR
- **Platform:** Android (Flutter, Dart). Target / tested on Android API 29.  
- **Backend:** Firebase (authentication + Firestore for user lists). 
- **APIs:** RAWG (game database), NewsAPI / Newscatcher (news feed). The app integrates external APIs to fetch game metadata, store info, and news headlines. 
- **Key features:** Search 37.5k+ games via RAWG, create custom lists (Favourites / To-Buy / To-Play), view detailed game pages, browse gaming news, save lists to your profile. 

---

## Features (detailed)
- **Search & Game Details:** Query RAWG/IGDB for game title, cover art, release date, genre, platforms. Click a result to open a detailed page with actions (add to list, bookmark, price lookup).
- **Lists & Profile:** Persistent user lists (Favorites, To-Buy, Custom lists) stored on Firestore and available per-user. 
- **News Feed:** Curated gaming headlines on the home screen with links to original articles (uses NewsAPI / Newscatcher). Clicking a headline opens the browser via `url_launcher`. 
- **Simple UI Flow:** Splash → Onboarding → Login/Signup → Home → Search → Game Info → Profile/Lists. Uses Material Design patterns for clarity and performance. 

---

## Tech Stack
- Flutter 2.10.1 / Dart 2.3.0 (development versions used).
- Firebase (Authentication, Firestore / Realtime DB if applicable, Storage).
- External APIs: RAWG (v3), NewsAPI / Newscatcher (v2), optional IGDB. 
- Tools: Android Studio / VSCode, GitHub, Figma (UI design). 
---

## Quickstart — run locally (developer)
> **Pre-reqs:** Flutter SDK (matching or newer than 2.10.1), Dart SDK, Android SDK (API 29 device or emulator), `flutter` on PATH.

```bash
# 1. Clone
git clone https://github.com/YOUR_USERNAME/gametrax.git
cd gametrax

# 2. Install Flutter packages
flutter pub get

# 3. Configure Firebase (see notes below)
# - Create a Firebase project, add Android app with your package name,
# - Download google-services.json and place in android/app/
# - Configure Firestore rules / auth as needed.

# 4. Add API keys
# Create a file (not committed) e.g. `lib/secrets.dart` or platform env variables.
# Example pattern (do NOT commit secrets):
#   const RAWG_API_KEY = 'your_rawg_api_key';
#   const NEWS_API_KEY = 'your_news_api_key';

# 5. Run on emulator / device
flutter run
