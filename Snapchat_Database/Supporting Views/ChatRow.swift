//
//  ChatRow.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct ChatRow: View {
    var name:String = "Name"
    
    var body: some View
    {
        VStack
        {
            Text(name)
                .font(.headline)
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(name: "Test Boi")
    }
}
