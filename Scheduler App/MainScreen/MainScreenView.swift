//
//  MainScreenView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 09.11.2024.
//
import SwiftUI

struct MainScreenView: View {

    @StateObject var viewModel: MainScreenViewModel

    init(profileManager: ProfileManager) {
        _viewModel = StateObject(wrappedValue: MainScreenViewModel(profileManager: profileManager))
    }

    var body: some View {
        VStack {
            Text(viewModel.dateText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 30)
            Text(viewModel.activeProfileName)
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Spacer()
            SystemButton(title: "Start Your Day") {
                viewModel.startDay()
            }
            .padding(.bottom, 34)
        }
        .onAppear {
            viewModel.updateDateText()
        }
    }
}

#Preview {
    let profileManager = ProfileManager()
    let viewModel = MainScreenViewModel(profileManager: profileManager)

    MainScreenView(profileManager: profileManager)
        .onAppear {
            profileManager.setActiveProfile(
                profile: Profile(
                    name: "Profile 1",
                    description: "This is the active profile"
                )
            )
        }
}
