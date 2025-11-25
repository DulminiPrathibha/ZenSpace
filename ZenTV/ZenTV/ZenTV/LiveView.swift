//
//  LiveView.swift
//  ZenTV
//
//  Created by Supuni Nethsarani on 2025-11-25.
//

import SwiftUI

struct LiveView: View {
    @State private var focusedTab: String? = nil
    @State private var activeTab: String = "Live"
    @Binding var currentView: String
    @State private var countdownValue: Int = 27
    
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
                        LiveContentArea(countdownValue: $countdownValue)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            startCountdown()
        }
    }
    
    // Countdown timer function
    private func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countdownValue > 0 {
                countdownValue -= 1
            } else {
                timer.invalidate()
            }
        }
    }
}

// MARK: - Live Content Area
struct LiveContentArea: View {
    @Binding var countdownValue: Int
    
    var body: some View {
        VStack(spacing: 0) {
            // Page Title
            Text("Live")
                .font(.system(size: 56, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 50)
                .padding(.bottom, 50)
            
            // Live Workout Video Container
            GeometryReader { geometry in
                ZStack(alignment: .topTrailing) {
                    // Background Video/Image
                    Image("live_banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                    // Exercise Title Overlay (Top-Right)
                    Text("Jumping Jacks")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.8), radius: 8, x: 2, y: 2)
                        .padding(.top, 40)
                        .padding(.trailing, 40)
                    
                    // Countdown Timer (Bottom-Right)
                    VStack(alignment: .trailing) {
                        Spacer()
                        
                        CountdownTimerView(countdownValue: countdownValue)
                            .padding(.bottom, 40)
                            .padding(.trailing, 40)
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 40)
        }
    }
}

// MARK: - Countdown Timer View
struct CountdownTimerView: View {
    let countdownValue: Int
    
    var body: some View {
        VStack(spacing: 8) {
            // "Countdown" Label
            Text("Countdown")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
            
            // Timer Number
            Text("\(countdownValue)")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(Color.white.opacity(0.9))
                .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 4)
        )
        .scaleEffect(countdownValue <= 5 ? 1.1 : 1.0)
        .animation(.easeInOut(duration: 0.3), value: countdownValue)
    }
}

// MARK: - Live Session Model
struct LiveSession {
    let title: String
    let backgroundImage: String
    var countdownValue: Int
    let isLive: Bool
}

#Preview {
    LiveView(currentView: .constant("Live"))
}
