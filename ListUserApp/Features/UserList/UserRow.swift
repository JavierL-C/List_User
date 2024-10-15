//
//  UserRow.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import SwiftUI

struct UserRow: View {
    let user: UserListElement

    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .strokeBorder(color(for: user), lineWidth: 3)
                    .frame(width: 60, height: 60)
                Text(getInitials(from: user.name))
                    .font(.title3)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private func getInitials(from name: String) -> String {
        let words = name.split(separator: " ")
        let initials = words.prefix(2).map { $0.prefix(1) }
        return initials.joined()
    }
    
    private func color(for user: UserListElement) -> Color {
        let colors: [Color] = [.red, .green, .blue, .orange, .purple, .pink, .yellow, .teal]
        let index = abs(user.id.hashValue) % colors.count
        return colors[index]
    }
}
