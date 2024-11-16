//
//  ProfileDetailView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import SwiftUI
import SwiftData

struct ProfileDetailView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name: String
    @State private var description: String

    var profile: Profile?

    init(profile: Profile?) {
        self.profile = profile
        _name = State(initialValue: profile?.name ?? "")
        _description = State(initialValue: profile?.profileDescription ?? "")
    }

    var body: some View {
        Form {
            Section(header: Text("Profile Info")) {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
        }
        .navigationTitle(profile == nil ? "Add Profile" : "Edit Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveProfile()
                    dismiss()
                }
            }
        }
    }

    private func saveProfile() {
        if let profile = profile {
            profile.name = name
            profile.profileDescription = description
        } else {
            let newProfile = Profile(name: name, description: description)
            modelContext.insert(newProfile)
        }
        try? modelContext.save()
    }
}

#Preview {
    NavigationView {
        ProfileDetailView(profile: nil)
            .modelContainer(for: [Profile.self, ScheduleItem.self])
    }
}
