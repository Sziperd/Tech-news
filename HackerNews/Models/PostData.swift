//
//  PostData.swift
//  HackerNews
//
//  Created by Patryk Piwowarczyk on 19/02/2022.
//

import Foundation

struct Results: Decodable{
    
    
    let articles: [Post]
    
}
struct Post: Decodable, Identifiable{
    var id: String {
        return title
    }
    let urlToImage: String?
    
    //let source: String
    let title: String
    let url: String?
    
}
