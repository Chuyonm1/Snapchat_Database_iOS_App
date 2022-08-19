//
//  ChatView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    
    //calls a fetch request on the getAllToDoItems from Chats.swift
    @FetchRequest(fetchRequest: Chats.getAllChatData()) var chats:FetchedResults<Chats>
    
    @State private var showingAlert = false
    @State private var didChange = false
    @State private var keyboardHeight: CGFloat = 0
    @State var name:String
    @State var chat:String
    
    //Dismisses keyboard on tap
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
    
    var body: some View
    {
        ZStack
        {
            Color.yellow
            .edgesIgnoringSafeArea(.all)
            VStack
            {
                Text(name)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .padding()
                
                TextView(text: $chat)
                    .frame(numLines: 6)
                    .padding()
                Button(action:
                {
                    self.showingAlert = true
                    //loops through the chats and if the chat has been updated
                    //it updates the chat and saves the data
                    for c in self.chats
                    {
                        if(c.name==self.name && c.chat==self.chat)
                        {
                            self.didChange = false
                        }
                        else if(c.name==self.name && !(c.chat==self.chat))
                        {
                            self.didChange = true
                            c.chat = self.chat
                            c.changedAt = Date()
                            do
                            {
                                try self.manageObjectContext.save()
                            }
                            catch
                            {
                                print(error)
                            }
                            break
                        }
                    }
                })
                {
                    Text("Update")
                }.alert(isPresented: $showingAlert)
                {
                    //If the user entered new info
                    //alert displays the chat was updated
                    if(self.didChange)
                    {
                        return Alert(title: Text("Chat updated successfully"), dismissButton: .default(Text("ok")))
                    }
                    //If the user did not enter new info
                    //alert displays the chat was not updated
                    else
                    {
                        return Alert(title: Text("Chat did not update"), message: Text("You have not updated your chat. No update was made"), dismissButton: .default(Text("ok")))
                    }
                }
            }//Moves vstack up once keyboard is activated via TextView
            .offset(y:-self.keyboardHeight)
                .animation(.spring())
            // Outdated for new versions of iOS
//            .onAppear{
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main)
//                {
//                    (notification) in guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
//                        return
//                    }
//                    var height = keyboardFrame.height
//                    height = height - 100
//                    self.keyboardHeight = height
//                }
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main)
//                {
//                    (notification) in
//                    self.keyboardHeight = 0
//                }
//            }
        }.onTapGesture
        {
            self.endEditing(true)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(name: "John", chat: "Chat about stuff")
    }
}
