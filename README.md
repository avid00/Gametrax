# Gametrax — Game Tracker & News App (Android, Flutter)

**One-liner:** Gametrax is an Android app (built with Flutter/Dart + Firebase) that helps gamers search, track and organise games, view latest gaming news, and check basic store info — all in one place. :contentReference[oaicite:2]{index=2} :contentReference[oaicite:3]{index=3}

[![Flutter](https://img.shields.io/badge/Flutter-2.10.1-blue)](#) [![Dart](https://img.shields.io/badge/Dart-2.3.0-blue)](#) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)

---

## Demo 
[Demo](https://youtu.be/uQ6j9-H9pJU) Video of the App



---

## Highlights / TL;DR
- **Platform:** Android (Flutter, Dart). Target / tested on Android API 29. :contentReference[oaicite:4]{index=4}  
- **Backend:** Firebase (authentication + Firestore for user lists). :contentReference[oaicite:5]{index=5}  
- **APIs:** RAWG (game database), NewsAPI / Newscatcher (news feed). The app integrates external APIs to fetch game metadata, store info, and news headlines. :contentReference[oaicite:6]{index=6} :contentReference[oaicite:7]{index=7}  
- **Key features:** Search 37.5k+ games via RAWG, create custom lists (Favourites / To-Buy / To-Play), view detailed game pages, browse gaming news, save lists to your profile. :contentReference[oaicite:8]{index=8}

---

## Features (detailed)
- **Search & Game Details:** Query RAWG/IGDB for game title, cover art, release date, genre, platforms. Click a result to open a detailed page with actions (add to list, bookmark, price lookup). :contentReference[oaicite:9]{index=9}  
- **Lists & Profile:** Persistent user lists (Favorites, To-Buy, Custom lists) stored on Firestore and available per-user. :contentReference[oaicite:10]{index=10}  
- **News Feed:** Curated gaming headlines on the home screen with links to original articles (uses NewsAPI / Newscatcher). Clicking a headline opens the browser via `url_launcher`. :contentReference[oaicite:11]{index=11}  
- **Simple UI Flow:** Splash → Onboarding → Login/Signup → Home → Search → Game Info → Profile/Lists. Uses Material Design patterns for clarity and performance. :contentReference[oaicite:12]{index=12}

---

## Tech Stack
- Flutter 2.10.1 / Dart 2.3.0 (development versions used).
- Firebase (Authentication, Firestore / Realtime DB if applicable, Storage). 
- External APIs: RAWG (v3), NewsAPI / Newscatcher (v2), optional IGDB. 
- Tools: Android Studio / VSCode, GitHub, Figma (UI design).

---

## Quickstart — run locally (developer)
> **Pre-reqs:** Flutter SDK (matching or newer than 2.10.1), Dart SDK, Android SDK (API 29 device or emulator), `flutter` on PATH. :contentReference[oaicite:18]{index=18}

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
