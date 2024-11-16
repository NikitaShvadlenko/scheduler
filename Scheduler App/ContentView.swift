//
//  ContentView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 09.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Profiles", systemImage: "book.pages") {
                ProfilesView()
            }
            Tab("Main", systemImage: "star.fill") {
                MainScreenView()
            }
            Tab("Settings", systemImage: "gearshape.fill") {
                SettingsView()
            }



        }
    }
}

#Preview {
    ContentView()
}
