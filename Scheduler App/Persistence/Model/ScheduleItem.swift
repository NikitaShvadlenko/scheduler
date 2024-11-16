//
//  ScheduleItem.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//

import SwiftData
import Foundation

@Model
final class ScheduleItem {
    @Attribute(.unique) var id: UUID
    var name: String
    var time: String
    var itemDescription: String

    init(name: String, time: String, itemDescription: String) {
        self.id = UUID()
        self.name = name
        self.itemDescription = itemDescription
        self.time = time
    }
}
