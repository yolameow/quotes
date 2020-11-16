//
//  ViewController.swift
//  gson
//
//  Created by Mac on 14.11.2020.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    let URLAddress = "https://api.quotable.io/random"
    
    @IBAction func startButton() {
        
        guard let url = URL(string: URLAddress) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let quoteData = try JSONDecoder().decode(Quote.self, from: data)
                DispatchQueue.main.async {
                    self.quoteLabel.text = "\(quoteData.content)"
                    self.authorLabel.text = quoteData.author
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}
