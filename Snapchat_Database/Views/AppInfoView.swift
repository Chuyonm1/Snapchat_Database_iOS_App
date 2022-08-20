//
//  AppInfoView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct AppInfoView: View
{
    var body: some View
    {
        ZStack
        {
            Color.yellow
            .edgesIgnoringSafeArea(.all)
            VStack
            {
                VStack
                {
                    Text("App created by Dark Assassins Inc.")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Text("Copyright © 2022 Dark Assassins Inc.")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Text("All rights reserved.")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }.offset(y:-150)
                ButtonImage(image: Image("DAIlogo2"), url: "https://darkassassinsinc.com", width: 350, height: 250)
                
                Text("Version 1.1.2")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .offset(y:150)
                
            }
        }
        
    }
}
struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
