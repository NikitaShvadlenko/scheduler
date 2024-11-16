//
//  CustomPickerView.swift
//  Scheduler App
//
//  Created by Nikita Shvad on 16.11.2024.
//


import SwiftUI

struct CustomPickerView: View {
    @State private var selectedProfile: Profile? = nil
    let profiles: [Profile] = [
        Profile(name: "Adze", description: "efw"),
        Profile(name: "As", description: "efw"),
        Profile(name: "Đặc", description: "efw")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("16 November")
                .font(.largeTitle)
                .bold()
            
            Menu {
                Button("Select a profile", action: { selectedProfile = nil })
                ForEach(profiles) { profile in
                    Button(profile.name) {
                        selectedProfile = profile
                    }
                }
            } label: {
                HStack {
                    Text(selectedProfile?.name ?? "Select a profile")
                        .font(.body)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button("Start Your Day") {
                // Action for the button
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding()
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView()
    }
}
