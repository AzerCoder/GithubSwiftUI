//
//  ContentView.swift
//  GithubSwiftUI
//
//  Created by A'zamjon Abdumuxtorov on 23/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var username = "AzerCoder"
    @State private var isLoading = false
    @State var sheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue.opacity(0.7),.green.opacity(0.5)], startPoint: .bottom, endPoint: .top)
                VStack{
                    Image("gith").resizable()
                        .frame(width: 150,height: 150)
                        .cornerRadius(100)
                       
                    TextField("Enter a Github username", text: $username)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        sheet.toggle()
                        GithubAPI.username = username
                    }, label: {
                        Text("Get User Data")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    })
                    .sheet(isPresented: $sheet) {
                        HomeView()
                    }
                }
            }.navigationBarTitle("Github", displayMode: .inline)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
       
   
}


#Preview {
    ContentView()
}
