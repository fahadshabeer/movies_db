# ProductBox Flutter Test

This repository contains the completed Flutter test for the ProductBox assessment. The test evaluates proficiency in Flutter development, covering state management, UI design, API integration, and best practices. The application developed is a movie browsing app that integrates with TheMovieDB API and Firebase Firestore.

## Features Implemented

### 1. Movie List
- Fetches and displays a list of movies using the API endpoint:
  ```
  /discover/movie?api_key={{apiKey}}
  ```
- Implements pagination to load more movies when scrolling.

### 2. Movie Details
- Displays additional movie information when a movie is clicked.
- Uses the API endpoint:
  ```
  /movie/{movieId}?api_key={{apiKey}}&language=en-US
  ```

### 3. Search Functionality
- Implements a search bar to filter movies by name on the frontend using array logic.

### 4. Favorites Management
- Allows users to mark/unmark movies as favorites.
- Saves favorite movies to Firebase Firestore.

### 5. Favorites Screen
- Displays a list of favorite movies fetched from Firebase Firestore.

### 6. Dark/Light Theme Toggle
- Implements a theme toggle that allows users to switch between light and dark themes.

## Firebase Integration

### 1. Firebase Setup
- Configured Firebase Firestore for storing favorite movies.
- Firebase Authentication is not required; favorites are stored using auto-generated document IDs.

### 2. Firestore Operations
- **Save Favorites**: When a user marks a movie as a favorite, it is stored in Firestore.
- **Fetch Favorites**: Retrieves and displays favorite movies from Firestore.

## Technical Details

### 1. State Management
- Utilized **BLoC/Cubit** for managing states across the app.

### 2. Widget Reusability
- Built reusable widgets:
    - **MovieCard**: Displays movie details in a list.
    - **SearchBar**: Allows users to filter movies.
    - **FavoriteButton**: Manages adding/removing favorites.

### 3. Network Layer
- Implemented a clean and scalable network layer for fetching movie data from the API.

### 4. Error Handling
- Implemented error handling for empty responses, API failures, and network issues.

## Bonus Implementations
- **Animations**: Added animations for screen transitions and favorite toggle effects.
- **Responsive UI**: Ensures compatibility with different screen sizes.

## Installation and Setup

### 1. Prerequisites
- Flutter SDK installed
- Firebase configured in the project
- TheMovieDB API key obtained

### 2. Steps to Run the Project
```sh
# Clone the repository
git clone https://github.com/fahadshabeer/movies_db.git
cd movies_db

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### 3. Firebase Configuration
- Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files in respective folders.
- Enable Firestore in Firebase Console.

## Submission Details
- **Repository**: https://github.com/fahadshabeer/movies_db.git
- **Architecture**: Clean and maintainable structure following best practices.

---

Thank you for reviewing this submission. Looking forward to your feedback!

