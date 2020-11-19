//
//  ViewController.swift
//  gson
//
//  Created by Mac on 14.11.2020.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButton() {
        AF.request(URLaddress.url.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case.success(let data):
                    self.quoteLabel.text = Quote.getQuote(from: data)?.content
                    self.authorLabel.text = Quote.getQuote(from: data)?.author
                case.failure(let error):
                    print(error)
                }
            }
    }
}
