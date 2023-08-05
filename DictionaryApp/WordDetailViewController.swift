//
//  WordDetailViewController.swift
//  DictionaryApp
//
//  Created by Merve Nur Nerkis on 4.08.2023.
//

import UIKit

class WordDetailViewController: UIViewController {
    

    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var turkishLabel: UILabel!
    
    var kelime:Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kelime {
            englishLabel.text = k.ingilizce
            turkishLabel.text = k.turkce
        }
    }
    



}
