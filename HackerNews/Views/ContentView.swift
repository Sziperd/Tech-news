//
//  ContentView.swift
//  HackerNews
//
//  Created by Patryk Piwowarczyk on 19/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        
        
        
        
        NavigationView{
            
            
            List(networkManager.posts){
                
                post in
                NavigationLink(destination: DetailView(url: post.url)) {
                   
                        //Text(String("✩\(post.source)"))
                        
                        Text(post.title)
                    
                }
                
                
            }
            
            .navigationBarTitle("Ukraine conflict news")
        }
        
        .onAppear {
            self.networkManager.fetchData() 
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





