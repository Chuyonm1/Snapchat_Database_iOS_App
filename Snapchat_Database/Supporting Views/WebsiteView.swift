//
//  WebsiteView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct WebsiteView: View
{
    var website: String
    var body: some View
    {
        ZStack
        {
            VStack(alignment: .leading)
            {
                WebView(url: self.website)
            }
        }
        //Makes page take up the whole screen
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WebsiteView_Previews: PreviewProvider {
    static var previews: some View {
        WebsiteView(website: "https://www.apple.com")
    }
}
