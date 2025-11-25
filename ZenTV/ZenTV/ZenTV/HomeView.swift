//
//  HomeView.swift
//  ZenTV
//
//  Created by Supuni Nethsarani on 2025-11-25.
//

import SwiftUI

struct HomeView: View {
    @State private var focusedTab: String? = nil
    @State private var activeTab: String = "Home"
    @State private var currentView: String = "Home"
    
    var body: some View {
        Group {
            if currentView == "Home" {
                homeContent
            } else if currentView == "Average Score" {
                AverageScoreView(currentView: $currentView)
            } else if currentView == "Recent" {
                RecentView(currentView: $currentView)
            } else if currentView == "Live" {
                LiveView(currentView: $currentView)
            } else {
                homeContent // Default fallback
            }
        }
        .onChange(of: currentView) { newValue in
            activeTab = newValue
        }
    }
    
    private var homeContent: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Top Header Bar (Fixed Height)
                    HeaderBar()
                        .frame(height: 90)
                    
                    // Content Area (Remaining Height)
                    HStack(spacing: 0) {
                        // Left Sidebar Navigation (Fixed Width)
                        SidebarNavigation(
                            activeTab: $activeTab,
                            focusedTab: $focusedTab,
                            onTabSelected: { tab in
                                currentView = tab
                            }
                        )
                        .frame(width: 250)
                        
                        // Main Content Area (Remaining Width)
                        MainContentArea()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Header Bar
struct HeaderBar: View {
    var body: some View {
        HStack {
            // Left side - Logo and Title
            HStack(spacing: 16) {
                Circle()
                    .fill(Color.white.opacity(0.9))
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "tv")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    )
                
                Text("ZenSpace TV")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Right side - Date and Profile Pictures
            HStack(spacing: 16) {
                Text("Wed, Oct 27")
                    .font(.system(size: 20))
                    .foregroundColor(.white.opacity(0.8))
                
                HStack(spacing: -10) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.blue, Color.purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 45, height: 45)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                        )
                    
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.orange, Color.pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 45, height: 45)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 20)
        .background(Color.black)
    }
}

// MARK: - Sidebar Navigation
struct SidebarNavigation: View {
    @Binding var activeTab: String
    @Binding var focusedTab: String?
    var onTabSelected: ((String) -> Void)? = nil
    @Namespace private var animation
    
    let navItems: [(icon: String, title: String)] = [
        ("magnifyingglass", "Search"),
        ("house.fill", "Home"),
        ("chart.bar.fill", "Average Score"),
        ("clock.arrow.circlepath", "Recent"),
        ("dot.radiowaves.left.and.right", "Live")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(navItems, id: \.title) { item in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            activeTab = item.title
                            onTabSelected?(item.title)
                        }
                    }) {
                        NavigationItem(
                            icon: item.icon,
                            title: item.title,
                            isActive: activeTab == item.title,
                            isFocused: focusedTab == item.title
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(
                        GeometryReader { geo in
                            if focusedTab == item.title || (focusedTab == nil && activeTab == item.title) {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .matchedGeometryEffect(id: "TAB_HIGHLIGHT", in: animation)
                            }
                        }
                    )
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
            
            Spacer()
            
            // Bottom Profile Avatars
            HStack(spacing: -10) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.blue, Color.purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 45, height: 45)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.orange, Color.pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 45, height: 45)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)
    }
}

// MARK: - Navigation Item
struct NavigationItem: View {
    let icon: String
    let title: String
    let isActive: Bool
    let isFocused: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(isFocused || isActive ? .black : .white)
                .frame(width: 30)
            
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(isFocused || isActive ? .black : .white)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Main Content Area
struct MainContentArea: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 24) {
                // Large Featured Banner (60% of available height)
                FeaturedBanner()
                    .frame(height: geometry.size.height * 0.6)
                
                // Three Small Cards (40% of available height)
                HStack(spacing: 24) {
                    SmallCard(
                        imageName: "home_Todays_Meal_Plan",
                        title: "Today's Meal Plan",
                        subtitle: "1200 kcal today."
                    )
                    .frame(maxWidth: .infinity)
                    
                    SmallCard(
                        imageName: "home_10_Breathing",
                        title: "10 Breathing",
                        subtitle: "High Stress Today."
                    )
                    .frame(maxWidth: .infinity)
                    
                    SmallCard(
                        imageName: "home_sleep_tips!",
                        title: "Sleep Tips!",
                        subtitle: "Improve Your Sleep"
                    )
                    .frame(maxWidth: .infinity)
                }
                .frame(height: geometry.size.height * 0.35)
            }
            .padding(32)
        }
    }
}

// MARK: - Featured Banner
struct FeaturedBanner: View {
    @Environment(\.isFocused) var isFocused: Bool
    
    var body: some View {
        Button(action: {
            // Action when banner is selected
            print("Start Your Couple Workout selected")
        }) {
            ZStack(alignment: .bottomLeading) {
                // Background Image
                Image("home_Start_Your_Couple_workout")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                
                // Gradient Overlay for text readability
                LinearGradient(
                    colors: [Color.black.opacity(0.7), Color.clear],
                    startPoint: .bottomLeading,
                    endPoint: .center
                )
                
                // Content Overlay
                VStack(alignment: .leading, spacing: 12) {
                    Text("Start Your Couple Workout!")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("You missed 300 kcal yesterday. Time to reclaim them")
                        .font(.system(size: 22))
                        .foregroundColor(.white.opacity(0.9))
                    
                    Text("20 minutes. Full Body.")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                        .italic()
                    
                    // Play Button
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        .overlay(
                            Image(systemName: "play.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.black)
                                .offset(x: 3)
                        )
                        .padding(.top, 10)
                }
                .padding(50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(CardButtonStyle())
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 8)
    }
}

// MARK: - Small Card
struct SmallCard: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        Button(action: {
            // Action when card is selected
            print("\(title) selected")
        }) {
            ZStack(alignment: .bottomLeading) {
                // Background Image with fallback
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                
                // Gradient Overlay
                LinearGradient(
                    colors: [Color.black.opacity(0.8), Color.clear],
                    startPoint: .bottomLeading,
                    endPoint: .center
                )
                
                // Text Content
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(24)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(CardButtonStyle())
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

// MARK: - Custom Button Style for tvOS
struct CardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .animation(.easeInOut(duration: 0.3), value: configuration.isPressed)
    }
}

#Preview {
    HomeView()
}
