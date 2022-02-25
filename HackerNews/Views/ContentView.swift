//
//  ContentView.swift
//  HackerNews
//
//  Created by Patryk Piwowarczyk on 19/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var refresh: Bool = false
    @State private var selectedItem: Int = 0
    @ObservedObject var networkManager = NetworkManager()
    //var language = "en"
   
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
            .toolbar {
                Menu(){
                    Button("English", action: switchEnglish)
                                Button("Polski", action: switchPolish)
                                Button("український", action: switchUkrainian)
                                    //print("Help tapped!")
                                }label: {
                                    Image(systemName: "ellipsis.circle")
                                }
                               
            }
        }
        
        .onAppear {
            self.networkManager.fetchData() 
        }
        
    }


    func switchEnglish() { let userDefaults = UserDefaults.standard
        
        userDefaults.set("en", forKey: "Language")
        self.networkManager.fetchData()
        print("fetched data again")
        refresh.toggle()
        
    }
    func switchPolish() { let userDefaults = UserDefaults.standard
        
        userDefaults.set("pl", forKey: "Language")
        var networkManager = NetworkManager()
        self.networkManager.fetchData()
        print("fetched data again")
        refresh.toggle()
        
    }
    func switchUkrainian() { let userDefaults = UserDefaults.standard
        
        userDefaults.set("ua", forKey: "Language")
        self.networkManager.fetchData()
        print("fetched data again")
        refresh.toggle()
    }


}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





