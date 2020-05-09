//
//  AddPersonView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    
    //calls a fetch request on the getAllToDoItems from Chats.swift
    @FetchRequest(fetchRequest: Chats.getAllChatData()) var chats:FetchedResults<Chats>

    //Allows you to dismiss view on a button click
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var name = ""
    @State private var missingFields: Bool = false
    @State private var showingAlert = false
    @State private var chat = ""
    @State private var keyboardHeight:CGFloat = 0.0
    
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
            VStack()
            {
                Text("Add Person")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .padding()
    
                HStack
                {
                    Text("Name:")
                        .foregroundColor(Color.black)
                    TextField("",text: $name)
                        .background(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1.0))
                        .foregroundColor(Color.black)

                }.padding()
                
                HStack
                {
                    Text("Chat: ")
                        .foregroundColor(Color.black)
                        .padding(2)
                    TextView(text: $chat)
                    .frame(numLines: 6)
                }.padding()

                Button(action:
                {
                    self.showingAlert = true
                    if(self.name=="" || self.chat=="")
                    {
                        self.missingFields = true
                    }
                    else
                    {
                        //creats a new chat with the provided name,
                        //chat, and given date and adds it to the
                        //core data then resets the name and chat fields
                        self.missingFields = false
                        let newChat = Chats(context: self.manageObjectContext)
                        newChat.name = self.name
                        newChat.chat = self.chat
                        newChat.changedAt = Date()
                        do
                        {
                            try self.manageObjectContext.save()
                        }
                        catch
                        {
                            print(error)
                        }
                        self.name = ""
                        self.chat = ""
                    }
                }) {
                    Text("Add Chat")
                }.alert(isPresented: $showingAlert)
               {
                   //If the user entered new info
                   //alert displays the chat was updated
                   if(self.missingFields)
                   {
                       return Alert(title: Text("Chat was not added"), message: Text("You have not filled out all the fields. Make sure to fill them out and try again"), dismissButton: .default(Text("ok")))
                   }
                   //If the user did not enter new info
                   //alert displays the chat was not updated
                   else
                   {
                        return Alert(title: Text("Chat added successfully"), dismissButton: .default(Text("ok"), action: {self.presentationMode.wrappedValue.dismiss()}))                   }
               }
                
                
            }//Moves vstack up once keyboard is activated via TextView
            .offset(y:-self.keyboardHeight)
                .animation(.spring())
            .onAppear{
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main)
                {
                    (notification) in guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
                        return
                    }
                    var height = keyboardFrame.height
                    height = height - 150
                    self.keyboardHeight = height
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main)
                {
                    (notification) in
                    self.keyboardHeight = 0
                }
            }
        }.onTapGesture
        {
            self.endEditing(true)
        }
    }
}


struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
