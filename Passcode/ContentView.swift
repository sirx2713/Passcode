//
//  ContentView.swift
//  Passcode
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    var body: some View {
        VStack{
            if isAuthenticated{
                VStack {
                    Spacer()
                    HStack {
                        Text("Welcome to")
                            .foregroundColor(.gray)
                        Text("iSAD!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundColor(.orange)
                    }.scaleEffect(2)
                    Text("'I Started Application Development'")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .bold()
                        .padding(1)
                    Spacer()
                    Button(action: {
                        isAuthenticated = false
                    }, label: {
                        Text("Log out")
                    })
                }
            }
            else{
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
