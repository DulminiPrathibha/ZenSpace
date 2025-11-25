//
//  RecentView.swift
//  ZenTV
//
//  Created by Supuni Nethsarani on 2025-11-25.
//

import SwiftUI

struct RecentView: View {
    @State private var focusedTab: String? = nil
    @State private var activeTab: String = "Recent"
    @Binding var currentView: String
    
    var body: some View {
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
                        RecentContentArea()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Recent Content Area
struct RecentContentArea: View {
    let activities: [RecentActivity] = [
        RecentActivity(
            id: 1,
            imageName: "recent_10_Min_Breathing",
            title: "10 Min Breathing",
            subtitle: "Today"
        ),
        RecentActivity(
            id: 2,
            imageName: "recent_Meal_Plan",
            title: "Meal Plan",
            subtitle: "Last Monday"
        ),
        RecentActivity(
            id: 3,
            imageName: "recent_30_Mins_Yoga",
            title: "30 Mins Yoga",
            subtitle: "Yesterday"
        ),
        RecentActivity(
            id: 4,
            imageName: "recent_Steps",
            title: "Steps",
            subtitle: "Today"
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Page Title
            Text("Recent")
                .font(.system(size: 56, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 50)
                .padding(.bottom, 60)
            
            // Activity Cards Grid
            GeometryReader { geometry in
                HStack(spacing: 24) {
                    ForEach(activities) { activity in
                        ActivityCard(activity: activity)
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 60)
        }
    }
}

// MARK: - Recent Activity Model
struct RecentActivity: Identifiable {
    let id: Int
    let imageName: String
    let title: String
    let subtitle: String
}

// MARK: - Activity Card
struct ActivityCard: View {
    let activity: RecentActivity
    @Environment(\.isFocused) var isFocused: Bool
    
    var body: some View {
        Button(action: {
            print("\(activity.title) selected")
        }) {
            VStack(alignment: .leading, spacing: 16) {
                // Card Image
                GeometryReader { geometry in
                    Image(activity.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .aspectRatio(2/3, contentMode: .fit)
                
                // Text Section
                VStack(alignment: .leading, spacing: 6) {
                    Text(activity.title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(activity.subtitle)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
        }
        .buttonStyle(ActivityCardButtonStyle())
    }
}

// MARK: - Activity Card Button Style
struct ActivityCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .brightness(configuration.isPressed ? 0.1 : 0)
            .animation(.easeInOut(duration: 0.3), value: configuration.isPressed)
    }
}

#Preview {
    RecentView(currentView: .constant("Recent"))
}
