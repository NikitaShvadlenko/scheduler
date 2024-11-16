//
//  ContentView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 09.11.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject
    private var profileManager = ProfileManager()

    var body: some View {
        TabView {
            Tab("Profiles", systemImage: "book.pages") {
                ProfilesView()
                    .environmentObject(profileManager)
            }
            Tab("Main", systemImage: "star.fill") {
                MainScreenView(profileManager: profileManager)
            }
            Tab("Settings", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
        .modelContainer(for: [Profile.self, ScheduleItem.self])
    }
}

#Preview {
    ContentView()
}
