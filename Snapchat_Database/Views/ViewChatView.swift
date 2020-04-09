//
//  ViewChatView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct ViewChatView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    
    //calls a fetch request on the getAllToDoItems from Chats.swift
    @FetchRequest(fetchRequest: Chats.getAllChatData()) var chats:FetchedResults<Chats>
    @State private var numChats:Int = 0
    
    init()
    {
        //clears tables color presets so the background can be changed
        UITableView.appearance().backgroundColor = .clear // tableview background
        UITableViewCell.appearance().backgroundColor = .clear // cell background
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View
    {
        ZStack
        {
            Color.yellow.edgesIgnoringSafeArea(.all)
            List
            {
                //generates list of all the data stored in core data
                //puts all that into a navigationlink to open up each chat
                ForEach(self.chats)
                {
                    chat in NavigationLink(destination: ChatView(name: chat.name!, chat: chat.chat!))
                    {
                        ChatRow(name: chat.name!)
                    }
                } //deletes items form the list and database
               .onDelete{
                   indexSet in let deleteItem = self.chats[indexSet.first!]
                   self.manageObjectContext.delete(deleteItem)
                   
                   //saves deletions for future
                   do
                   {
                       try self.manageObjectContext.save()
                   }
                   catch
                   {
                       print(error)
                   }
                }
            }.background(Color.yellow)
            .navigationBarTitle("Chats")
            .navigationBarItems(trailing:  EditButton())
        }
    }
}

struct ViewChatView_Previews: PreviewProvider {
    static var previews: some View {
        ViewChatView()
    }
}
