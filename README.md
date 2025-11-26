# ZenSpace TV 📺

<div align="center">

![Platform](https://img.shields.io/badge/platform-tvOS%2026.0%2B-blue)
![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Xcode](https://img.shields.io/badge/Xcode-16.0%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)

**A Modern Wellness & Fitness Application for Apple TV**

ZenSpace TV transforms your Apple TV into a comprehensive wellness companion, offering personalized workout sessions, health metrics tracking, and mindful wellness content for couples and individuals.

</div>

---

## 📖 About

ZenSpace TV is a native tvOS application built with SwiftUI that brings wellness and fitness into your living room. Designed specifically for Apple TV's unique interface, it leverages the tvOS focus engine to provide an intuitive big-screen experience. Whether you're tracking health metrics, starting a couple's workout, planning meals, or practicing breathing exercises, ZenSpace TV makes wellness accessible from your couch.

The application supports multi-user profiles, allowing couples or family members to track their individual health metrics while enjoying shared wellness activities. With a sleek, modern interface featuring smooth animations and tvOS-optimized navigation, ZenSpace TV delivers a premium Apple TV experience.

---

## ✨ Features

### 🏠 Content & Wellness Features

- **🏋️ Couple Workouts** - Start interactive workout sessions designed for two users with motivational prompts
- **🍽️ Meal Planning** - Daily meal plans with calorie tracking and nutritional guidance (1200 kcal target)
- **🧘 Breathing Exercises** - 10-minute guided breathing sessions with stress level assessment
- **😴 Sleep Tips** - Personalized recommendations to improve sleep quality
- **🤸 Yoga Sessions** - 30-minute guided yoga workouts with visual demonstrations
- **👟 Activity Tracking** - Monitor daily steps and physical activity

### 📊 Health Tracking Features

- **💤 Sleep Quality Scoring** - Track and monitor sleep quality metrics (0-10 scale)
- **❤️ Resting Heart Rate** - Monitor resting HR with visual indicators
- **📈 Heart Rate Variability (HRV)** - Track HRV for recovery and stress insights
- **🏃 Activity Load Tracking** - Monitor workout intensity and volume (measured in arbitrary units)
- **👥 Multi-User Profiles** - Separate health metrics for User 1 and User 2
- **📉 Trend Visualization** - Compare metrics across multiple users

### 🎮 Navigation & UI Features

- **🎯 Sidebar Navigation** - Persistent left sidebar with 5 main sections
- **✨ Focus Effects** - Smooth animated highlights following tvOS focus engine
- **🌟 Matched Geometry Animation** - Fluid transitions between navigation items
- **🎨 Active State Indicators** - Clear visual feedback for current section
- **⚡ Responsive Layout** - Adapts to different Apple TV screen sizes
- **🎭 Gradient Overlays** - Modern glassmorphic design elements

### 🎬 User Experience Features

- **⏱️ Live Countdown Timer** - Real-time workout countdown with dynamic animations
- **🖼️ Rich Media Cards** - Interactive content cards with image overlays
- **🎪 Hover Animations** - Scale effects on button press for tactile feedback
- **🎞️ Recent Activity Gallery** - Visual history of completed activities
- **📱 Profile Avatars** - Gradient-styled user profile indicators
- **🔍 Search Functionality** - Quick access to find wellness content (UI ready)

---
## 📋 Requirements

### Development Environment

- **macOS**: Sonoma 14.0 or later
- **Xcode**: 16.0 or later (supports tvOS 26.0 SDK)
- **Swift**: 5.0
- **Command Line Tools**: Xcode Command Line Tools installed

### Target Platform

- **tvOS**: 26.0 or later
- **Device Support**:
  - Apple TV 4K (2nd generation or later)
  - Apple TV 4K (3rd generation)
  - Apple TV HD (4th generation)
- **Simulator**: tvOS Simulator (included with Xcode)

### Dependencies

**None** - This project uses only native Apple frameworks:

- SwiftUI (UI Framework)
- Foundation (Core utilities)
- Combine (Reactive programming - Timer implementation)

---

## 🚀 Installation

### 1. Clone the Repository

```bash
# Clone the repository
git clone https://github.com/yourusername/ZenSpaceTV.git

# Navigate to project directory
cd ZenSpaceTV/ZenTV
```

### 2. Open the Project

```bash
# Open the Xcode project
open ZenTV.xcodeproj
```

### 3. Configure Project Settings

1. In Xcode, select the **ZenTV** project in the navigator
2. Select the **ZenTV** target
3. Under **Signing & Capabilities**, select your development team
4. Ensure the bundle identifier is unique: `com.yourdomain.ZenTV`

### 4. Select Target Device

- For Simulator: Choose **Apple TV** from the device menu
- For Physical Device: Connect Apple TV via Xcode → Window → Devices and Simulators

### 5. Build and Run

```bash
# Build and run from command line
xcodebuild -project ZenTV.xcodeproj -scheme ZenTV -destination 'platform=tvOS Simulator,name=Apple TV' build
```

Or press **⌘R** in Xcode to build and run.

---

## 📁 Project Structure

```
ZenTV/
├── ZenTV/
│   ├── ZenTVApp.swift              # Main app entry point
│   ├── HomeView.swift               # Home screen with navigation
│   │   ├── HeaderBar                # Top app bar with logo and profiles
│   │   ├── SidebarNavigation       # Left navigation sidebar
│   │   ├── NavigationItem          # Individual nav button component
│   │   ├── MainContentArea         # Home content grid
│   │   ├── FeaturedBanner          # Large hero workout card
│   │   └── SmallCard               # Quick access content cards
│   ├── AverageScoreView.swift      # Health metrics comparison
│   │   ├── AverageScoreContentArea # Metrics page layout
│   │   ├── UserScoreCard           # Individual user metrics card
│   │   └── MetricCard              # Single metric display
│   ├── RecentView.swift            # Activity history gallery
│   │   ├── RecentContentArea       # Recent activities layout
│   │   ├── RecentActivity          # Activity data model
│   │   └── ActivityCard            # Individual activity card
│   ├── LiveView.swift              # Active workout session
│   │   ├── LiveContentArea         # Live workout layout
│   │   ├── CountdownTimerView      # Animated countdown component
│   │   └── LiveSession             # Session data model
│   ├── ContentView.swift           # Unused starter template
│   ├── Assets.xcassets/            # Image and asset catalog
│   │   ├── App Icon & Top Shelf Image.brandassets/
│   │   ├── home_*.imageset         # Home screen images
│   │   ├── average_score_*.imageset # Metrics screen images
│   │   ├── recent_*.imageset       # Recent activities images
│   │   └── live_banner.imageset    # Live session image
│   └── README.md                   # This file
├── ZenTV.xcodeproj/                # Xcode project file
├── ZenTVTests/                     # Unit tests
└── ZenTVUITests/                   # UI tests
```

### Key Files & Components

- **`ZenTVApp.swift`**: App entry point, launches `HomeView` as root
- **`HomeView.swift`**: Main navigation hub with sidebar and view routing
- **`AverageScoreView.swift`**: Multi-user health metrics dashboard
- **`RecentView.swift`**: Activity history with 4-column grid layout
- **`LiveView.swift`**: Live workout session with countdown timer
- **`Assets.xcassets/`**: All images organized by view/feature

---

## 🛠️ Technologies Used

### Core Technologies

- **Swift 5.0** - Modern, type-safe programming language
- **SwiftUI** - Declarative UI framework for tvOS
- **tvOS 26.0 SDK** - Latest Apple TV APIs and features

### Architecture

- **Pattern**: Component-based architecture with SwiftUI
- **State Management**: `@State`, `@Binding` for local and shared state
- **Navigation**: Custom view switching with binding-based routing
- **Data Flow**: Unidirectional data flow with SwiftUI property wrappers

### UI Implementation

- **Layout System**: 
  - `GeometryReader` for responsive sizing
  - `HStack`/`VStack` for flex-like layouts
  - `LazyVGrid` for grid-based metric cards
  - `ZStack` for layered content (images + overlays)

- **Animations**:
  - `withAnimation()` for smooth transitions
  - `matchedGeometryEffect()` for navigation highlights
  - `.scaleEffect()` for button press feedback
  - Custom `ButtonStyle` implementations

- **Components**:
  - Reusable card components (`FeaturedBanner`, `SmallCard`, `MetricCard`)
  - Shared navigation components (`SidebarNavigation`, `HeaderBar`)
  - Custom button styles (`CardButtonStyle`, `MetricCardButtonStyle`)

### tvOS-Specific

- **Focus Engine**: Native tvOS focus management with `@Environment(\.isFocused)`
- **Remote Control**: Button-based navigation with automatic focus handling
- **Layout Optimization**: Safe area handling for TV overscan
- **Performance**: Optimized asset loading for large screen displays

---

## 🧭 Navigation System

ZenSpace TV uses a **sidebar navigation pattern** with a persistent left panel and view-based routing.

### Navigation Structure

```swift
Sidebar Items:
├── 🔍 Search (UI ready, functionality pending)
├── 🏠 Home (default view)
├── 📊 Average Score (health metrics)
├── 🕐 Recent (activity history)
└── 📡 Live (workout session)
```

### Implementation Details

**Active State Management:**
- `activeTab` tracks currently selected section
- Updates automatically when view changes
- Persists across navigation

**Focus Management:**
- `focusedTab` tracks tvOS focus state
- Highlights item under remote focus
- Falls back to `activeTab` when no focus

**Hover Effect:**
- White background highlight using `matchedGeometryEffect`
- Smooth animation between nav items (0.3s easeInOut)
- Black text color when active/focused

**View Routing:**
- Single `@State var currentView` controls displayed content
- Binding passed to child views for navigation
- Callback pattern: `onTabSelected` updates parent state

### Navigation Code Pattern

```swift
@State private var currentView: String = "Home"

if currentView == "Home" {
    homeContent
} else if currentView == "Average Score" {
    AverageScoreView(currentView: $currentView)
}
// ... other views
```

---

## 🎨 Configuration

### Assets Configuration

All images are managed through Xcode's Asset Catalog (`Assets.xcassets`).

#### Asset Naming Convention:

```
[view]_[content_description]

Examples:
- home_Start_Your_Couple_workout
- home_Todays_Meal_Plan
- average_score_user_propic1
- recent_10_Min_Breathing
- live_banner
```

#### Adding New Images:

1. Open `Assets.xcassets` in Xcode
2. Right-click → **New Image Set**
3. Name following convention above
4. Drag images into 1x, 2x, 3x slots (tvOS uses 1x and 2x)
5. Reference in code: `Image("asset_name")`

#### Image Requirements:

- **Format**: PNG or JPEG
- **Resolution**: 
  - 1x: Standard HD resolution
  - 2x: Retina/4K resolution (recommended)
- **Color Space**: sRGB or Display P3
- **Hero Banner**: ~1920x800px (2x: 3840x1600px)
- **Small Cards**: ~600x400px (2x: 1200x800px)
- **Profile Pictures**: 280x280px (2x: 560x560px)
- **Activity Cards**: 600x900px (2x: 1200x1800px)

### Color Scheme

The app uses a dark theme optimized for TV viewing:

```swift
// Primary Colors
Background: Color.black
Text Primary: Color.white
Text Secondary: Color.white.opacity(0.8)
Accent: Color.white (for active states)

// Gradient Profiles
User 1: [Color.blue → Color.purple]
User 2: [Color.orange → Color.pink]

// UI Elements
Card Background: Color(red: 0.16, green: 0.16, blue: 0.16)
Border: Color.white.opacity(0.2)
Overlay: Color.black.opacity(0.7)

// Metric Icons
Sleep: Color.blue (moon)
Heart Rate: Color.pink (heart)
HRV: Color.green (chart)
Activity: Color.orange (dumbbell)
```

### Content Customization

#### Adding New Workout Content:

1. Add image to `Assets.xcassets`
2. Update relevant view's data array:

```swift
// In HomeView.swift - MainContentArea
SmallCard(
    imageName: "home_New_Content",
    title: "New Workout",
    subtitle: "Description here"
)
```

#### Modifying User Profiles:

```swift
// In AverageScoreView.swift - AverageScoreContentArea
UserScoreCard(
    userName: "Your Name",
    profileImage: "your_profile_image",
    sleepQuality: 8.5,
    restingHR: 60,
    hrv: 350,
    activityLoad: 400
)
```

#### Adding Recent Activities:

```swift
// In RecentView.swift - RecentContentArea
let activities: [RecentActivity] = [
    RecentActivity(
        id: 5,
        imageName: "recent_New_Activity",
        title: "New Activity",
        subtitle: "Today"
    )
]
```

---

## 👥 Multi-User Support

ZenSpace TV supports **two user profiles** throughout the application.

### Current Implementation:

**User Profiles:**
- User 1: Blue-purple gradient avatar
- User 2: Orange-pink gradient avatar

**User Data Storage:**
- Currently: Hardcoded values in SwiftUI views
- Profile images: `average_score_user_propic1` and `average_score_user_propic2`

**User-Specific Metrics:**
- Individual Sleep Quality scores
- Separate Resting HR values
- Independent HRV tracking
- Personal Activity Load metrics

**Shared Features:**
- Couple workouts (designed for both users)
- Shared meal plans
- Common activity history

### Adding More Users:

To extend to 3+ users:

1. Update `AverageScoreContentArea` to use `ForEach` loop
2. Create user data model:

```swift
struct User: Identifiable {
    let id: Int
    let name: String
    let profileImage: String
    let sleepQuality: Double
    let restingHR: Int
    let hrv: Int
    let activityLoad: Int
}
```

3. Implement persistence (UserDefaults or Core Data)
4. Add user selection flow

---

## 💻 Development Workflow

### Running on tvOS Simulator

```bash
# List available simulators
xcrun simctl list devices | grep "Apple TV"

# Boot simulator
xcrun simctl boot "Apple TV"

# Run app
xcodebuild -project ZenTV.xcodeproj -scheme ZenTV \
  -destination 'platform=tvOS Simulator,name=Apple TV' \
  build
```

### Testing on Physical Apple TV

1. **Connect Apple TV**:
   - Xcode → Window → Devices and Simulators
   - Connect Apple TV via Wi-Fi (same network as Mac)
   - Pair using on-screen code

2. **Enable Developer Mode**:
   - Settings → Remotes and Devices → Remote App and Devices
   - Enable "Developer Mode"

3. **Deploy**:
   - Select Apple TV in device menu
   - Press ⌘R to build and run

### Debugging Tips for TV Apps

**Focus Debugging:**
```swift
// Add to any view to see focus changes
.onFocusChange { isFocused in
    print("Focus changed: \(isFocused)")
}
```

**Layout Debugging:**
```swift
// Visualize view bounds
.border(Color.red, width: 2)
```

**Performance Monitoring:**
- Instruments → Time Profiler
- Look for 60 FPS on tvOS (slower than expected on simulator)

**Common Issues:**

1. **Images not loading**: Check asset names match exactly (case-sensitive)
2. **Navigation not working**: Verify `@Binding` is passed correctly
3. **Focus not responding**: Ensure `.focusable()` is applied (SwiftUI handles automatically)
4. **Layout issues**: Test on multiple TV sizes in simulator

### Code Style Guidelines

```swift
// MARK: - Comments for structure
// MARK: - Header Bar

// State variables at top
@State private var activeTab: String = "Home"
@Binding var currentView: String

// Computed properties
var body: some View { }

// Private helper functions at bottom
private func startCountdown() { }
```

---

## 🎯 User Interface Details

### Layout System

**Grid-Based Design:**
- Home: 1 large + 3 small cards
- Average Score: 2 user cards, each with 2x2 metric grid
- Recent: 4-column horizontal grid
- Live: Single full-width workout view

**Responsive Sizing:**
```swift
GeometryReader { geometry in
    let largeCardHeight = (totalHeight - gapSize) * 0.65 // 65%
    let smallCardsHeight = (totalHeight - gapSize) * 0.35 // 35%
}
```

### Card Designs

**Featured Banner (Home):**
- Full-width hero image
- Gradient overlay (black 0.7 opacity)
- Large title (48pt bold)
- Subtitle and metadata
- Play button (70x70 white circle)
- Scale effect on press (1.05x)

**Small Cards (Home):**
- 16:9 aspect ratio
- Image with gradient overlay
- Bold title (28pt)
- Subtitle text (16pt)
- Rounded corners (16pt radius)

**Metric Cards (Average Score):**
- Equal 2x2 grid layout
- SF Symbol icon (32pt) in colored circle
- Label text (16pt medium)
- Large value display (40pt bold)
- Dark gray background (#2A2A2A)

**Activity Cards (Recent):**
- 2:3 aspect ratio (portrait)
- Full image with rounded corners
- Title and timestamp below
- Hover scale effect

### Text Overlay Implementation

```swift
ZStack(alignment: .bottomLeading) {
    // Background Image
    Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
    
    // Gradient Overlay
    LinearGradient(
        colors: [Color.black.opacity(0.8), Color.clear],
        startPoint: .bottomLeading,
        endPoint: .center
    )
    
    // Text Content
    VStack(alignment: .leading) {
        Text(title)
        Text(subtitle)
    }
    .padding(24)
}
```

### Animation & Transition Effects

**Navigation Highlight:**
```swift
.matchedGeometryEffect(id: "TAB_HIGHLIGHT", in: animation)
.animation(.easeInOut(duration: 0.3))
```

**Button Press:**
```swift
.scaleEffect(configuration.isPressed ? 1.05 : 1.0)
.brightness(configuration.isPressed ? 0.1 : 0)
```

**Countdown Timer:**
```swift
.scaleEffect(countdownValue <= 5 ? 1.1 : 1.0)
.animation(.easeInOut(duration: 0.3), value: countdownValue)
```

**View Transitions:**
```swift
withAnimation(.easeInOut(duration: 0.3)) {
    activeTab = item.title
}
```

---

## ⚠️ Known Issues

### tvOS-Specific Limitations

1. **Search Functionality**: UI is present but not yet implemented
   - Workaround: Add search logic to filter content arrays

2. **Static Content**: All content is hardcoded
   - Workaround: Implement data models and JSON loading

3. **No Persistence**: User data resets on app restart
   - Workaround: Add UserDefaults or Core Data storage

4. **Timer Memory Leak**: Live view timer not invalidated properly
   - Fix: Store timer reference and invalidate in `.onDisappear`

### Layout Issues

1. **Overscan on Older TVs**: Content may extend beyond visible area
   - Solution: Test on physical devices, add safe area padding

2. **Fixed Aspect Ratios**: Cards may clip on non-standard screens
   - Solution: Use `.scaledToFit()` instead of `.scaledToFill()`

### Performance Considerations

1. **Image Loading**: Large images may cause memory pressure
   - Recommendation: Use compressed assets, implement lazy loading

2. **Animation Performance**: Multiple simultaneous animations may stutter
   - Recommendation: Reduce animation complexity or duration

---

## 🗺️ Roadmap

Based on code analysis and comments, potential future enhancements:

### Planned Features

- [ ] **Search Implementation**: Add content filtering and search results
- [ ] **Backend Integration**: Connect to REST API for dynamic content
- [ ] **User Authentication**: Add profile login and data sync
- [ ] **Video Playback**: Play actual workout videos instead of static images
- [ ] **Health Kit Integration**: Sync metrics with Apple Health (iOS companion app)
- [ ] **Achievements System**: Track milestones and progress
- [ ] **Social Features**: Share workouts with friends
- [ ] **Custom Workout Builder**: Create personalized routines

### Partially Implemented

- **Search View**: UI ready, needs backend logic
- **User Profiles**: Visual only, needs data model and storage
- **Live Sessions**: Static countdown, needs actual workout flow

### Technical Debt

- Extract reusable components into separate files
- Implement proper MVVM architecture with ViewModels
- Add comprehensive unit and UI tests
- Create data layer with repositories
- Implement error handling and loading states
- Add accessibility labels for VoiceOver support

---

## 🤝 Contributing

Contributions are welcome! To contribute to ZenSpace TV:

### Getting Started

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test on tvOS Simulator and physical Apple TV if possible
5. Commit with descriptive messages: `git commit -m 'Add amazing feature'`
6. Push to your fork: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Development Guidelines

- Follow existing code style (see code examples above)
- Use SwiftUI best practices
- Add MARK comments for view sections
- Test on multiple Apple TV models
- Ensure animations run smoothly at 60 FPS
- Update README if adding new features

### Code Review Process

1. All PRs require review before merging
2. CI checks must pass (if configured)
3. Test coverage should not decrease
4. Documentation must be updated

### Testing Requirements

- Run on tvOS Simulator (Apple TV 4K)
- Test focus navigation with remote
- Verify all images load correctly
- Check layout on different screen sizes
- Test performance with Instruments

---

## 📞 Contact & Support

### Project Information

- **Developer**: Supuni Nethsarani
- **Created**: November 25, 2025
- **Version**: 1.0
- **Bundle ID**: com.dulmini.ZenTV

### Support Channels

- **Issues**: [GitHub Issues](https://github.com/yourusername/ZenSpaceTV/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/ZenSpaceTV/discussions)
- **Email**: your.email@example.com

### Reporting Bugs

When reporting bugs, please include:

1. tvOS version
2. Apple TV model
3. Steps to reproduce
4. Expected vs actual behavior
5. Screenshots or screen recordings if applicable
6. Xcode console logs

### Feature Requests

We welcome feature suggestions! Please:

1. Check existing issues first
2. Describe the feature and use case
3. Explain how it fits with tvOS design patterns
4. Consider submitting a PR if you can implement it

---

## 📄 License

This project is licensed under the MIT License.

```
MIT License

Copyright (c) 2025 Supuni Nethsarani

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🙏 Acknowledgments

- Built with **SwiftUI** for native tvOS experience
- Icons from **SF Symbols** (Apple Design Resources)
- Design inspired by modern streaming platforms and wellness apps
- tvOS focus engine provides seamless navigation

---

<div align="center">

**Made with ❤️ for Apple TV**

[Report Bug](https://github.com/yourusername/ZenSpaceTV/issues) · [Request Feature](https://github.com/yourusername/ZenSpaceTV/issues) · [Documentation](https://github.com/yourusername/ZenSpaceTV/wiki)

</div>
