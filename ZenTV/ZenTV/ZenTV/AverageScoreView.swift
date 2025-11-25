//
//  AverageScoreView.swift
//  ZenTV
//
//  Created by Supuni Nethsarani on 2025-11-25.
//

import SwiftUI

struct AverageScoreView: View {
    @State private var focusedTab: String? = nil
    @State private var activeTab: String = "Average Score"
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
                        AverageScoreContentArea()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Average Score Content Area
struct AverageScoreContentArea: View {
    var body: some View {
        VStack(spacing: 0) {
            // Page Title
            Text("Average Scores")
                .font(.system(size: 56, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 40)
                .padding(.bottom, 50)
            
            // Two User Cards
            GeometryReader { geometry in
                HStack(spacing: 32) {
                    // User 1 Card
                    UserScoreCard(
                        userName: "User 1",
                        profileImage: "user1",
                        sleepQuality: 8.2,
                        restingHR: 52,
                        hrv: 342,
                        activityLoad: 342
                    )
                    .frame(maxWidth: .infinity)
                    
                    // User 2 Card
                    UserScoreCard(
                        userName: "User 2",
                        profileImage: "user2",
                        sleepQuality: 6.5,
                        restingHR: 57,
                        hrv: 333,
                        activityLoad: 342
                    )
                    .frame(maxWidth: .infinity)
                }
                .frame(maxHeight: .infinity)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
    }
}

// MARK: - User Score Card
struct UserScoreCard: View {
    let userName: String
    let profileImage: String
    let sleepQuality: Double
    let restingHR: Int
    let hrv: Int
    let activityLoad: Int
    
    var body: some View {
        VStack(spacing: 0) {
            // Profile Picture
            Image(profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 3)
                )
                .padding(.top, 40)
                .padding(.bottom, 40)
            
            // Metrics Grid (2x2)
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                spacing: 20
            ) {
                // Row 1
                MetricCard(
                    icon: "moon.fill",
                    iconColor: .blue,
                    label: "Sleep Quality",
                    value: String(format: "%.1f", sleepQuality)
                )
                
                MetricCard(
                    icon: "heart.fill",
                    iconColor: .pink,
                    label: "Resting HR",
                    value: "\(restingHR)"
                )
                
                // Row 2
                MetricCard(
                    icon: "chart.bar.fill",
                    iconColor: .green,
                    label: "HRV",
                    value: "\(hrv)"
                )
                
                MetricCard(
                    icon: "dumbbell.fill",
                    iconColor: .orange,
                    label: "Activity Load",
                    value: "\(activityLoad)"
                )
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.white.opacity(0.2), lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.black)
                )
        )
    }
}

// MARK: - Metric Card
struct MetricCard: View {
    let icon: String
    let iconColor: Color
    let label: String
    let value: String
    @Environment(\.isFocused) var isFocused: Bool
    
    var body: some View {
        Button(action: {
            print("\(label): \(value) selected")
        }) {
            VStack(spacing: 16) {
                // Icon Circle
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 70, height: 70)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 32))
                            .foregroundColor(iconColor)
                    )
                
                // Label
                Text(label)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                
                // Value
                Text(value)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0.16, green: 0.16, blue: 0.16))
            )
        }
        .buttonStyle(MetricCardButtonStyle())
    }
}

// MARK: - Metric Card Button Style
struct MetricCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .brightness(configuration.isPressed ? 0.1 : 0)
            .animation(.easeInOut(duration: 0.3), value: configuration.isPressed)
    }
}

#Preview {
    AverageScoreView(currentView: .constant("Average Score"))
}
