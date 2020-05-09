//
//  ContentView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    @State private var showAddPerson = false
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color.yellow
                .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text("Welcome to your")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    Text("Snapchat Database")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    Image("snapchat")
                        .resizable()
                        .frame(width: 300, height: 300)
                    Button(action:{self.showAddPerson.toggle()})
                    {
                        Text("Add Person")
                            .foregroundColor(Color.blue)
                    }.sheet(isPresented: $showAddPerson, content: {AddPersonView()
                        .environment(\.managedObjectContext, self.manageObjectContext)
                    })
                    .padding()
                    NavigationLink(destination: ViewChatView())
                    {
                        Text("View Chat")
                            .foregroundColor(Color.blue)
                    }.padding()
//                    NavigationLink(destination: SettingsView())
//                    {
//                        Text("Settings")
//                            .foregroundColor(Color.blue)
//                    }.padding()
                    NavigationLink(destination: AppInfoView())
                    {
                        Text("ⓘ")
                            .foregroundColor(Color.blue)
                    }.padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
