// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  LaunchScreen.swift
//  ShoppingListApp


import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Text("Shopping List App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Team Members:")
                .font(.title)
                .padding()
            
            TeamMemberView(name: "Eva Wang", id: "101381503", crn: "50492")
            TeamMemberView(name: "Luis Rodrigo Procopio Andrada", id: "101356043", crn: "50497")
            TeamMemberView(name: "Koichi Kumo", id: "101354361", crn: "50492")

            Spacer()
        }
        .navigationBarTitle("Launch Screen", displayMode: .inline)
    }
}

struct TeamMemberView: View {
    let name: String
    let id: String
    let crn: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
            Text("ID: \(id), CRN: \(crn)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}
