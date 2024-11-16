//
//  MainScreenView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 09.11.2024.
//
import SwiftUI

struct MainScreenView: View {

    @StateObject var viewModel = MainScreenViewModel()

    var body: some View {
        VStack {
            Text(viewModel.dateText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 30)
            Text("Babki")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Spacer()
            SystemButton(title: "Start Your Day") {
                print("Hello, World!")
            }
            .padding(.bottom, 34)
        }
        .onAppear() {
            viewModel.updateDateText()
        }
    }
}

#Preview {
    MainScreenView()
}
