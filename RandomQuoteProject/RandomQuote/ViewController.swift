//
//  ViewController.swift
//  RandomQuote
//
//  Created by Hasan Uysal on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getQuotes()
        
    }
    
    private func getQuotes(){
        Client.getRandomQuote { quotes, error in
            guard let firstQuote = quotes else { return }
            self.quoteLabel.text = firstQuote[0].en
        }
    }

    @IBAction func getRandomQuotesButtonPressed(_ sender: Any) {
        getQuotes()
    }
    
}

