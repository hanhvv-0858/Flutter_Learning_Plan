# Flutter_Learning_Plan
## 2. Dart language 
### 2.1 Hello, Dart!
#### 2.1.1 Anatomy of a Dart Program
### 2.2 Programming a Greeter: Hello, _!
#### 2.2.1 Add more greetings
#### 2.2.2 I/O and Dart Libraries
### 2.3 Common Programming Concepts In Dart
#### 2.3.1 Intro to Dart’s Type System
#### 2.3.2 Comments
#### 2.3.3 Variables and Assignment
#### 2.3.4 Operators
#### 2.3.5 Null Aware Operators
### 2.4 Control Flow
#### 2.4.1 if and else
#### 2.4.2 switch and case
#### 2.4.3 Advanced Switch usage
#### 2.4.4 Loops
### 2.5 Functions
#### 2.5.1 Anatomy of a Dart Function
#### 2.5.2 Parameters
#### 2.5.3 Default parameter values
#### 2.5.4 Advanced Function Concepts
#### 2.5.5 Lexical Scope
### 2.6 Object Oriented Programming (in Dart)
#### 2.6.1 Classes
#### 2.6.2 Constructors
#### 2.6.3 Inheritance
#### 2.6.4 Factories and Named Constructors
#### 2.6.5 Enumerators

## 3. Flutter 
### 3.1 Intro to the counter app
#### 3.1.1 Flutter project structure
#### 3.1.2 Anatomy of a Flutter App
#### 3.1.3 Again, "Everything is a Widget"
#### 3.1.4 The build method
#### 3.1.5 new and const constructors in Flutter
#### 3.1.6 Hot Reload
### 3.2 Widgets: The widget tree, widget types and the State object
#### 3.2.1 Stateless Widget
#### 3.2.2 Stateful Widget
#### 3.2.3 setState
#### 3.2.4 initState
### 3.3 BuildContext
### 3.4 Enhancing the Counter app with the most important widgets
#### 3.4.1 Raised Button
### 3.5 Intro to Layout in Flutter
#### 3.5.1 Row and Column
#### 3.5.2 Layout Constraints in Flutter
#### 3.5.3 RenderObject
#### 3.5.4 RenderObject and Constraints
#### 3.5.5 RenderBoxes and layout errors
#### 3.5.6 Multi-child widgets
#### 3.5.7 Icons and the FloatingActionButton
#### 3.5.8 Images
#### 3.5.9 Container Widget
### 3.6 The Element Tree
#### 3.6.1 Elements and Widgets
#### 3.6.2 Exploring the Element Tree with an example
#### 3.6.3 The Element Tree and State Objects
#### 3.6.4 Widget Keys

## 4. Important Widgets, Theme, and Layout
### 4.1 Setting up and configuring a Flutter app
#### 4.1.1 Configuration: pubspec and main.dart
#### 4.1.2 SystemChrome
### 4.2 Structural Widgets and more configuration
#### 4.2.1 MaterialApp widget
#### 4.2.2 Scaffold
#### 4.2.3 AppBar and PreferredSizeWidget
### 4.3 Styling in Flutter and Theme
#### 4.3.1 Theme
#### 4.3.2 MediaQuery and the of method
#### 4.3.3 ScreenAwareSize method
### 4.4 Common Layout and UI widgets
#### 4.4.1 Stack
#### 4.4.2 Table
#### 4.4.3 TabBar
### 4.5 ListView and Builders

## 5. User Interaction: Forms and Gestures
### 5.1 User interaction and gestures
#### 5.1.1 The GestureDetector widget
#### 5.1.2 The GestureDetector in practice
#### 5.1.3 Dismissible
### 5.2 Flutter Forms
#### 5.2.1 The Form widget
#### 5.2.2 GlobalKey - FormState
### 5.3 FormField widgets
#### 5.3.1 TextFormField
#### 5.3.2 DropdownFormButton
#### 5.3.3 Generic Form Fields
### 5.4 Form UI and working with focus nodes
#### 5.4.1 InputDecoration
#### 5.4.2 Improve UI with FocusNodes
### 5.5 Form methods help manage form state
#### 5.5.1 Form.onChange
#### 5.5.2 FormState.save
#### 5.5.3 Form.onWillPop

## 6. Flutter Animations and using the Canvas
### 6.1 Introducing Flutter Animations
#### 6.1.1 Tweens
#### 6.1.2 Animation Curves
#### 6.1.3 Ticker providers
#### 6.1.4 AnimationController
#### 6.1.5 AnimatedWidget
#### 6.1.6 Implementing the AnimationController and Tween for the background
### 6.2 CustomPainter and the Canvas
#### 6.2.1 The shapes used to make up the clouds
#### 6.2.2 Define the CustomPainter and Paint object
#### 6.2.3 CustomPainter paint method
### 6.3 Animations Again: Staggered animations, TweenSequence, and built in animations
#### 6.3.1 Creating a custom animation state class
#### 6.3.2 Built in animation widgets: SlideTransition
#### 6.3.3 TweenSequence
### 6.4 Reusable color transition custom widgets

## 7.Flutter Routing In Depth
### 7.1 Routing in Flutter
#### 7.1.1 The Farmers Market app
#### 7.1.2 The app source code
### 7.2 Declarative Routing and Named Routes
#### 7.2.1 Declaring routes
#### 7.2.2 MaterialDrawer widget and a the full menu
#### 7.2.3 Highlight active route with RouteAware
### 7.3 Routing on the Fly
#### 7.3.1 MaterialRouteBuilder
#### 7.3.2 showSnackBar, showBottomSheet and the like
### 7.4 Routing Animations

## 8.Flutter State Management
### 8.1 Deep Dive into StatefulWidget
#### 8.1.1 The Widget Tree and the Element Tree
#### 8.1.2 The StatefulWidget Lifecycle and When to Do What
### 8.2 Pure Flutter state management: The InheritedWidget
#### 8.2.1 Creating a Central Store wth an InheritedWidget + StatefulWidget team
#### 8.2.2 The 'inheritFromWidgetOfExactType' and 'of' methods
#### 8.2.3 Use the of method to lift state up
#### 8.2.4 State management patterns beyond Flutter
### 8.3 Blocs: Business Logic Components
#### 8.3.1 Blocs. How do they work?
#### 8.3.2 Implementing the Bloc architecture
#### 8.3.3 Intro to Streams and Async Dart
#### 8.3.4 Implementing Streams in the CartBloc

## 9.Async Dart and Flutter
### 9.1 Async Dart
#### 9.1.1 Future Recap
#### 9.1.2 async / await
### 9.2 Sinks and Streams (and StreamControllers)
#### 9.2.1 Implementing streams
#### 9.2.2 Broadcast streams
#### 9.2.3 Higher Order Streams
### 9.3 Using streams in blocs
#### 9.3.1 Implementing a bloc input
### 9.4 Async Flutter: StreamBuilder
### 9.5 Infinite and Custom Scrollable widgets
#### 9.5.1 CustomScrollView and Slivers
#### 9.5.2 CatalogWidget scroll view
#### 9.5.3 Delegates
#### 9.5.4 Custom sliver


## 10.Working with data: HTTP, Firestore, and JSON
### 10.1 HTTP and Flutter
#### 10.1.1 HTTP package
#### 10.1.2 GET request
#### 10.1.3 JSON Serialization
#### 10.1.4 Bring it all together in the UI
### 10.2 Firebase and Flutter
#### 10.2.1 Create a Firestore project
#### 10.2.2 Configure your app
#### 10.2.3 Add Firebase to your pubspec
#### 10.2.4 Use Firestore
#### 10.3 Dependency Injection

## 11. Testing and Accessibilty
### 11.1 Testing Flutter apps
#### 11.1.1 Setup for Dart Unit tests
#### 11.1.2 Writing Dart unit tests
#### 11.1.3 Using Mockito to test methods that need external dependencies
#### 11.1.4 Flutter widget tests
#### 11.1.5 Flutter integration tests
#### 11.1.6 Performance profiling integration tests
### 11.2 Accessibility with the Semantics widgets
### 11.3 Wrap up

