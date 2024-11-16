//
//  MainScreenViewModel.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//
import Combine
import Foundation
import SwiftUI

final class MainScreenViewModel: ObservableObject {
    @Published var dateText: String = ""
    @Published var activeProfileName: String = "No active profile"

    private var profileManager: ProfileManager
    private var cancellables = Set<AnyCancellable>()

    init(profileManager: ProfileManager) {
        self.profileManager = profileManager
        setupBindings()
    }
}

// MARK: - Public Methods
extension MainScreenViewModel {
    func updateDateText() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        dateText = dateFormatter.string(from: Date())
    }

    func startDay() {
        print("The day has started with \(activeProfileName)!")
    }
}

// MARK: - Private Methods
private extension MainScreenViewModel {
    func setupBindings() {
        profileManager.$activeProfile
            .receive(on: DispatchQueue.main)
            .sink { [weak self] profile in
                guard let self = self else { return }
                if let profile = profile {
                    self.activeProfileName = profile.name
                } else {
                    self.activeProfileName = "No active profile"
                }
            }
            .store(in: &cancellables)
    }
}
