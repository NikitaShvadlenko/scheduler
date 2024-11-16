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
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                MainScreenView()
            }
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                ProfilesView()
            }
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                SettingsView()
            }



        }
    }
}

#Preview {
    ContentView()
}
