//
//  ProfilesView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 09.11.2024.
//
import SwiftUI
import SwiftData

import SwiftUI
import SwiftData

struct ProfilesView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = ProfilesViewModel()
    @State private var isPresentingAddProfile = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.profiles) { profile in
                    NavigationLink(destination: ProfileDetailView(profile: profile)) {
                        Text(profile.name)
                    }
                }
                .onDelete(perform: viewModel.deleteProfiles)
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
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
    }
}

