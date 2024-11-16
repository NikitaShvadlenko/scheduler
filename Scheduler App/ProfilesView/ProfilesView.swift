//
//  ProfilesView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 09.11.2024.
//
import SwiftUI
import SwiftData

struct ProfilesView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isPresentingAddProfile = false

    @Query(sort: \Profile.name, order: .forward)
    private var profiles: [Profile]

    var body: some View {
        NavigationView {
            List {
                ForEach(profiles) { profile in
                    NavigationLink(destination: ProfileDetailView(profile: profile)) {
                        Text(profile.name)
                    }
                }
                .onDelete(perform: deleteProfiles)
            }
            .navigationTitle("Profiles")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingAddProfile = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddProfile) {
                NavigationView {
                    ProfileDetailView(profile: nil)
                }
            }
        }
    }

    private func deleteProfiles(at offsets: IndexSet) {
        for index in offsets {
            let profile = profiles[index]
            modelContext.delete(profile)
        }
         try? modelContext.save()
    }
}
