//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Patryk Piwowarczyk on 19/02/2022.
//

import Foundation

class NetworkManager: ObservableObject{
    
    
    @Published var posts = [Post]()
    
    
    
    func fetchData(){
        
        if let url = URL(string: "https://newsapi.org/v2/everything?q=Ukraine&from=2022-02-24&sortBy=popularity&apiKey=45f398b987704e3c8f580ce6707170c1"){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        
                        do{
                            let results = try decoder.decode(Results.self, from: safeData )
                            DispatchQueue.main.async {
                                self.posts = results.articles
                            }
                            
                            
                            
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            
            
            task.resume()
            
            
            
        }
        
    }
    
    
}
