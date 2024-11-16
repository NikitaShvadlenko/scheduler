//
//  MainScreenViewModel.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//
import Combine
import Foundation

final class MainScreenViewModel: ObservableObject {
    @Published var dateText: String = ""
    @Published var activeProfileName: String = "No active profile"

    private var profileManager: ProfileManager
    private var cancellables = Set<AnyCancellable>()

    init(profileManager: ProfileManager) {
        self.profileManager = profileManager
        setupBindings()
    }

    func updateDateText() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        dateText = dateFormatter.string(from: Date())
    }

    func startDay() {
        print("The day has started with \(activeProfileName)!")
    }

    func setActiveProfile(_ profile: Profile?) {
        profileManager.setActiveProfile(profile: profile)
    }

    private func setupBindings() {
        profileManager.$activeProfile
            .receive(on: DispatchQueue.main)
            .sink { [weak self] profile in
                self?.activeProfileName = profile?.name ?? "No active profile"
            }
            .store(in: &cancellables)
    }
}
