//
//  ButtonImage.swift
//  Snapchat Database
//
//  Created by Will  Jones on 3/23/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI
/*
 *Class that creates a button image with a clickable url
 *takes in 4 variables
 @image - the image being used
 @url - the url, in string format, being used
 @width - the width of the image
 @height - the height of the image
 */
struct ButtonImage: View {
    var image: Image
    var url: String
    var width: CGFloat
    var height: CGFloat
    var body: some View
    {
        
        //Utilizes WebView to open websites inside the app natively
        //rather than opening safari
        NavigationLink(destination: WebsiteView(website: self.url))
        {
            image
            .renderingMode(.original) //makes image render correctly
            .resizable()
                .frame(width: self.width, height: self.height)
        }
    }
}

struct ButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImage(image: Image("DAIlogo"), url: "https://www.darkassassinsinc.com", width: 350, height: 250)
    }
}
