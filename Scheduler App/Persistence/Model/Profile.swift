//
//  Profile.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import Foundation
import SwiftData

@Model
final class Profile {
    @Attribute(.unique) var id: UUID
    var name: String
    var profileDescription: String
    var schedule: [ScheduleItem] = []

    init(name: String, description: String) {
        self.id = UUID()
        self.name = name
        self.profileDescription = description
    }
}
