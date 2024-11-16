//
//  MainScreenViewModel.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import Foundation
import SwiftUI

final class MainScreenViewModel: ObservableObject {
    @Published var dateText: String = ""
}

extension MainScreenViewModel {
    func updateDateText() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        dateText = dateFormatter.string(from: Date())
    }
}
