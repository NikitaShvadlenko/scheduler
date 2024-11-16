//
//  ProfileManager.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import SwiftUI
import SwiftData

final class ProfileManager: ObservableObject {
    @Published var activeProfile: Profile?

    @Query(sort: \Profile.name, order: .forward)
    var profiles: [Profile]

    func addProfile(name: String, description: String) {
        let newProfile = Profile(name: name, description: description)
        newProfile.modelContext?.insert(newProfile)
    }

    func updateProfile(profile: Profile, name: String, description: String) {
        profile.name = name
        profile.profileDescription = description
    }

    func deleteProfile(profile: Profile) {
        guard let context = profile.modelContext else { return }
        context.delete(profile)
        if activeProfile == profile {
            activeProfile = nil
        }
    }

    func setActiveProfile(profile: Profile) {
        activeProfile = profile
    }
}
