//
//  SystemButton.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//


import SwiftUI

struct SystemButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(12)
            .padding(.horizontal, 30)
    }
}
