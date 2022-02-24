//
//  DetailView.swift
//  HackerNews
//
//  Created by Patryk Piwowarczyk on 19/02/2022.
//

import SwiftUI
import WebKit
struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        
        
        
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) ->  WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView , context: UIViewRepresentableContext<WebView>) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
