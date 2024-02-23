//
//  HomeView.swift
//  GithubSwiftUI
//
//  Created by A'zamjon Abdumuxtorov on 23/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State private var user: User?
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue.opacity(0.7),.green.opacity(0.5)], startPoint: .bottom, endPoint: .top)
                VStack{
                    if let user = user {
                        
                        
                        
                        Image("gith").resizable()
                            .frame(width: 150,height: 150)
                            .cornerRadius(100)
                        
                        Text("\(user.name ?? "N/A")")
                            .foregroundColor(.black)
                            .bold().font(.system(size: 24))
                        Text("\(user.login)")
                            .foregroundColor(.secondary)
                        HStack{
                            Image(systemName: "person.2")
                            Text("Followers \(user.followers)")
                            Text("Following \(user.following)")
                        }
                        HStack{
                            Text("Location:")
                            Spacer()
                            Text("\(user.location ?? "N/A")")
                        }.padding(.horizontal).padding(.top)
                        
                        
                        HStack{
                            Text("Company:")
                            Spacer()
                            Text("\(user.company ?? "N/A")")
                        }.padding(.horizontal).padding(.top,10)
                        HStack{
                            Text("Bio:")
                            Spacer()
                            Text("\(user.bio ?? "N/A")")
                        }.padding(.horizontal).padding(.top,10)
                        
                        
                        
                    }
                    Spacer()
                }.padding(.top,100)
            }.navigationBarTitle("Github", displayMode: .inline)
                .edgesIgnoringSafeArea(.all)
        }.onAppear {
            fetchUserInfo()
        }
        
    }
    func fetchUserInfo() {
        GithubAPI.getUserInfo { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    HomeView()
}
