//
//  Profile.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import Foundation
import SwiftData

@Model
final class Profile: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var profileDescription: String
    var schedule: [ScheduleItem] = []
    var isActive: Bool = false

    init(name: String, description: String, isActive: Bool = false) {
        self.id = UUID()
        self.name = name
        self.profileDescription = description
        self.isActive = isActive
    }
}

