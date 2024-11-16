//
//  ProfilesViewModel.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import SwiftUI
import SwiftData
import Observation

@Observable
final class ProfilesViewModel {
    var profiles: [Profile] = []

    private var modelContext: ModelContext?

    func setModelContext(_ modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchProfiles()
    }

    func fetchProfiles() {
        guard let modelContext else { return }
        let descriptor = FetchDescriptor<Profile>()
        do {
            profiles = try modelContext.fetch(descriptor)
        } catch {
            print("Error fetching profiles: \(error)")
        }
    }

    func deleteProfiles(at offsets: IndexSet) {
        guard let modelContext else { return }
        for index in offsets {
            let profile = profiles[index]
            modelContext.delete(profile)
        }
        do {
            try modelContext.save()
            profiles.remove(atOffsets: offsets)
        } catch {
            print("Error deleting profiles: \(error)")
        }
    }
}
