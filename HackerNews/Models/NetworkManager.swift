//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Patryk Piwowarczyk on 19/02/2022.
//

import Foundation

class NetworkManager: ObservableObject{
    
    
    @Published var posts = [Post]()
    
    func closeSession(){
        
        
    }
    
    func fetchData(){
       let userDefaults = UserDefaults.standard
        //userDefaults.set("en", forKey: "Language")
        let base1 = "https://newsapi.org/v2/everything?q=Ukraine&from=2022-02-24&sortBy=datey"
        let base4 = UserDefaults.standard.string(forKey: "Language")
        let base2 = "en"
        let base3 = "45f398b987704e3c8f580ce6707170c1"
        var finalUrl: String
        if (base4 == "ua"){
            finalUrl = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=45f398b987704e3c8f580ce6707170c1"
        }else if (base4 == nil) {finalUrl = "\(base1)&language=\(base2)&apiKey=\(base3)"
        }else {
            finalUrl = "\(base1)&language=\(base4!)&apiKey=\(base3)"
        }
       if let url = URL(string: "\(finalUrl)"){
           //if let url = URL(string: "https://newsapi.org/v2/everything?q=Ukraine&from=2022-02-24&sortBy=datey&language=pl&apiKey=45f398b987704e3c8f580ce6707170c1"){
            print(url)
            //  if let url = URL(string: "https://newsapi.org/v2/everything?q=Ukraine&from=2022-02-24&sortBy=datey&apiKey=45f398b987704e3c8f580ce6707170c1"){
            
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
