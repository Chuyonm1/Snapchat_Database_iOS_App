//
//  TextView.swift
//  Snapchat Database
//
//  Created by Will  Jones on 3/23/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable
{
    typealias UIViewType = UITextView
    @Binding var text:String
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView
    {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 20)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>)
    {
        uiView.text = text
        uiView.delegate = context.coordinator
    }
    
    //Sets the number of lines for the textView
    func frame(numLines: CGFloat) -> some View
    {
        let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> TextView.Coordinator
    {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate
    {
        var parent: TextView
        init(_ parent: TextView)
        {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView)
        {
            parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if(textView.text=="Chat..."||textView.text=="Name...")
            {
                textView.text = ""
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {

        }
    }
}
