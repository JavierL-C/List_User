//
//  UserListDetailView.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import SwiftUI

struct UserListDetailView: View {
    var viewModel: UserListDetailVideModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Personal info
                cardView(iconName: "person.fill") {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        infoRow(title: "Username", value: viewModel.user.username)
                        infoRow(title: "Email", value: viewModel.user.email)
                        infoRow(title: "Phone", value: viewModel.user.phone)
                        infoRow(title: "Website", value: viewModel.user.website)
                    }
                }
                
                // MARK: - Address
                cardView(iconName: "house.fill") {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        infoRow(title: "Street", value: viewModel.user.address.street)
                        infoRow(title: "Suite", value: viewModel.user.address.suite)
                        infoRow(title: "City", value: viewModel.user.address.city)
                        infoRow(title: "Zipcode", value: viewModel.user.address.zipcode)
                    }
                }
                
                // MARK: - Company
                cardView(iconName: "building.2.fill") {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        infoRow(title: "Name", value: viewModel.user.company.name)
                        infoRow(title: "Catch Phrase", value: viewModel.user.company.catchPhrase)
                        infoRow(title: "BS", value: viewModel.user.company.bs)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .navigationTitle(viewModel.user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func cardView<Content: View>(iconName: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 10) {
                Image(systemName: iconName)
                    .font(.title2)
                    .foregroundColor(.blue)
                Text(iconTitle(for: iconName))
                    .font(.title2)
                    .bold()
            }
            
            content()
        }
        .padding()
        .frame(maxWidth: cardWidth(), alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        )
    }
    
    @ViewBuilder
    private func infoRow(title: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .fontWeight(.bold)
            Text(value)
                .multilineTextAlignment(.leading)
        }
        .font(.body)
    }
    
    private func cardWidth() -> CGFloat {
        let maxWidth: CGFloat = 400
        let screenWidth = UIScreen.main.bounds.width - 40
        return min(maxWidth, screenWidth)
    }
    
    private func iconTitle(for iconName: String) -> String {
        switch iconName {
        case "person.fill":
            return "Personal Info"
        case "house.fill":
            return "Address"
        case "building.2.fill":
            return "Company"
        default:
            return ""
        }
    }
}

#Preview {
    let data = UserListMock.makeUserListJsonFake()
    let user = try? JSONDecoder().decode(UserList.self, from: data)
    let viewModel = UserListDetailVideModel(user: user!.first!)
    UserListDetailView(viewModel: viewModel)
}
