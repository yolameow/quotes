//
//  quote.swift
//  gson
//
//  Created by Mac on 15.11.2020.
//
struct Quote: Decodable {
    let content: String?
    let author: String?
    
    init(quoteData: [String: Any]) {
        content = quoteData["content"] as? String
        author = quoteData["author"] as? String
    }
    
    static func getQuote(from data: Any) -> Quote? {
        guard let quoteData = data as? [String: Any] else { return nil }
        
        let quote = Quote(quoteData: quoteData)
        return quote
    }
    
}

enum URLaddress: String {
    case url = "https://api.quotable.io/random"
}


