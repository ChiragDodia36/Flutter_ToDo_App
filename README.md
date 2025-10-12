# To-Do App - Advanced Flutter Project

A beautiful, feature-rich cross-platform To-Do application built with Flutter that demonstrates advanced mobile development concepts and best practices.

## 🌟 Key Features

### Core Task Management
✅ **Task Creation** - Add new tasks with title, description, and priority levels
📝 **Task Listing** - View all tasks in a clean, organized list with color-coded priorities
👁️ **Task Details** - See complete task information with formatted dates and priority indicators
✏️ **Task Editing** - Edit existing tasks with pre-populated forms
✔️ **Task Completion** - Mark tasks as completed or pending with visual feedback
🗑️ **Task Deletion** - Remove tasks with confirmation dialogs
💾 **Local Storage** - All tasks persist locally using SQLite with automatic migrations

### Advanced Features

#### 1. **Priority System with Smart Color Coding**
- 🔴 **Crucial** - Red priority for urgent tasks
- 🟠 **Important** - Orange priority for high-priority tasks  
- 🟡 **Less Important** - Yellow priority for standard tasks
- 🟢 **Completed** - All completed tasks turn green regardless of original priority
- Visual priority indicators throughout the app

#### 2. **Search & Filter**
- 🔍 Real-time search across task titles and descriptions
- 📊 Filter by status: All, Pending, or Completed
- 🎯 Combined search and filter functionality
- ❌ Clear search button for quick reset

#### 3. **Swipe Gestures**
- 👉 Swipe right to mark as complete
- 👈 Swipe left to delete (with confirmation)
- 🎨 Visual feedback during swipe actions
- ⚡ Intuitive gesture-based task management

#### 4. **Dark Mode Support**
- 🌙 Toggle between light and dark themes
- 💾 Theme preference persists across app launches
- 🎨 All screens fully optimized for both themes
- 🔘 Easy-access toggle button in app bar

#### 5. **Task Editing**
- ✏️ Edit task title, description, and priority
- 📋 Pre-populated form with existing data
- 🔄 Real-time UI updates after editing
- ✅ Full validation on edited content

### UI/UX Excellence
- 🎨 Modern Material Design 3 interface
- 📱 Responsive layouts for all screen sizes
- ⚡ Smooth animations and transitions
- 🎯 Empty states with helpful messages
- 🔄 Loading indicators for async operations
- ✅ Success/error snackbar notifications
- 🎭 Context-aware icons and colors

## 🏗️ Architecture & Technical Implementation

### Data Layer
```
lib/models/
├── task.dart              # Task model with Priority enum
                          # - Color coding logic
                          # - Serialization methods
                          # - Equality operators
```

### Service Layer
```
lib/services/
├── database_service.dart  # SQLite database operations
                          # - CRUD operations
                          # - Database migrations (v1 → v2)
                          # - Singleton pattern
```

### State Management
```
lib/providers/
├── task_provider.dart     # Task state management
                          # - Task list operations
                          # - Filter helpers
                          # - Real-time updates
├── theme_provider.dart    # Theme state management
                          # - Light/Dark mode toggle
                          # - SharedPreferences integration
                          # - Theme persistence
```

### Presentation Layer
```
lib/screens/
├── home.dart             # Main screen
                          # - Search functionality
                          # - Filter chips
                          # - Swipe gestures
                          # - Task list with priorities
├── addtask.dart          # Task creation
                          # - Form validation
                          # - Priority selector
├── edittask.dart         # Task editing
                          # - Pre-populated form
                          # - Priority update
├── detailedview.dart     # Task details
                          # - Full task information
                          # - Edit/Delete actions
                          # - Priority display
```

## 🛠️ Tech Stack

- **Frontend**: Flutter 3.9.2+ (cross-platform iOS & Android)
- **Database**: SQLite (sqflite ^2.3.0) with migrations
- **State Management**: Provider ^6.1.1
- **Local Storage**: 
  - SharedPreferences ^2.2.2 (theme persistence)
  - Path Provider ^2.1.1 (file paths)
- **Date Formatting**: Intl ^0.19.0
- **Architecture**: Clean Architecture with separation of concerns

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd todo_app
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

4. Run tests
```bash
flutter test
```

5. Analyze code
```bash
flutter analyze
```

## 📱 Features in Action

### Adding a Task
1. Tap the **+** floating action button
2. Enter task title (3+ characters)
3. Enter task description (5+ characters)
4. Select priority level (Crucial/Important/Less Important)
5. Tap **Save Task**

### Searching & Filtering
1. Use the search bar to find tasks by title or description
2. Click filter chips to view All/Pending/Completed tasks
3. Combine search with filters for precise results
4. Clear search with the X button

### Swipe Actions
- **Complete Task**: Swipe right → task marked as done
- **Delete Task**: Swipe left → confirm deletion dialog

### Editing Tasks
1. Tap any task to view details
2. Click the edit icon in the app bar
3. Modify title, description, or priority
4. Tap **Update Task** to save changes

### Dark Mode
- Tap the moon/sun icon in the app bar to toggle themes
- Theme preference automatically saved

## 🎯 Advanced Concepts Demonstrated

### 1. Database Management
- SQLite integration with sqflite
- Database versioning and migrations
- CRUD operations with async/await
- Singleton pattern for database instance

### 2. State Management
- Provider pattern for app-wide state
- ChangeNotifier for reactive updates
- Consumer widgets for selective rebuilding
- Multiple providers with MultiProvider

### 3. Persistent Storage
- SharedPreferences for user preferences
- SQLite for structured data
- Data serialization (JSON ↔ Dart objects)

### 4. UI/UX Best Practices
- Material Design 3 guidelines
- Responsive layouts
- Gesture handling (Dismissible widget)
- Form validation
- Loading states
- Error handling with user feedback
- Empty states
- Confirmation dialogs

### 5. Flutter Widgets Mastery
- StatefulWidget vs StatelessWidget
- Custom widgets and composition
- Keys for widget identity
- ListView.builder for performance
- Consumer for selective rebuilding
- Theme switching

### 6. Code Quality
- Clean Architecture principles
- Separation of concerns (models/services/providers/screens)
- DRY (Don't Repeat Yourself)
- Comprehensive error handling
- Type safety
- Null safety
- Zero linter warnings

## 📊 Project Structure

```
lib/
├── main.dart                 # App entry point with providers
├── models/
│   └── task.dart            # Task model with Priority enum
├── services/
│   └── database_service.dart # SQLite database operations
├── providers/
│   ├── task_provider.dart   # Task state management
│   └── theme_provider.dart  # Theme state management
└── screens/
    ├── home.dart            # Main screen (search, filter, list)
    ├── addtask.dart         # Create new task
    ├── edittask.dart        # Edit existing task
    └── detailedview.dart    # View task details
```

## 🎓 Learning Outcomes / Skills Demonstrated

This project showcases proficiency in:

1. **Flutter Fundamentals**
   - Widget tree and composition
   - State management
   - Navigation
   - Async programming

2. **Database Operations**
   - SQLite integration
   - CRUD operations
   - Schema migrations
   - Data persistence

3. **Advanced UI Concepts**
   - Gesture detection
   - Custom themes
   - Responsive design
   - Animations

4. **Software Architecture**
   - Clean code principles
   - Design patterns (Singleton, Provider)
   - Separation of concerns
   - Scalable structure

5. **Production-Ready Features**
   - Error handling
   - Input validation
   - User feedback
   - Confirmation dialogs
   - Search and filter
   - Testing

## 📈 Performance Optimizations

- ListView.builder for efficient list rendering
- Keys for proper widget identity
- Selective widget rebuilding with Consumer
- Lazy loading of tasks
- Efficient state updates

## 🧪 Testing

The project includes widget tests:

```bash
flutter test
```

Test coverage includes:
- App initialization
- Home screen rendering
- Widget presence verification

## 🔄 Database Schema

### Version 2 (Current)
```sql
CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  isCompleted INTEGER NOT NULL,
  createdAt TEXT NOT NULL,
  priority INTEGER NOT NULL DEFAULT 2
)
```

### Migration from v1 → v2
- Added `priority` column with default value (lessImportant)
- Automatic migration for existing installations

## 🎨 Color System

| Priority | Status | Color |
|----------|--------|-------|
| Crucial | Pending | Red |
| Important | Pending | Orange |
| Less Important | Pending | Yellow |
| Any Priority | Completed | Green |

## 📝 Future Enhancements

Potential features for expansion:
- Due dates and reminders
- Task categories/tags
- Task notes with rich text
- Export/Import functionality
- Cloud sync
- Statistics dashboard
- Multi-language support
- Biometric security

## 🤝 Contributing

This project demonstrates Flutter proficiency for academic/professional purposes. For suggestions or improvements, please open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Created as a demonstration of Flutter development skills for Research Assistant position application.

---

**Note**: This is a production-ready application demonstrating modern Flutter development practices, clean architecture, and user-centric design.
