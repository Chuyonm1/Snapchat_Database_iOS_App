//
//  Chats.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import Foundation
import CoreData

//Same name as the entity name in the data model entity
public class Chats: NSManagedObject, Identifiable
{
    //Same type and names as those found in data model entity
    @NSManaged public var changedAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var chat: String?
}

extension Chats
{
    static func getAllChatData() -> NSFetchRequest<Chats>
    {
        //fetches the data from the data model and converts it to a Chats data type
        let request: NSFetchRequest<Chats> = Chats.fetchRequest() as! NSFetchRequest<Chats>
        //sort descriptor sorts the data via the date/time it was created
        let sortDescriptor = NSSortDescriptor(key: "changedAt",ascending: false)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
