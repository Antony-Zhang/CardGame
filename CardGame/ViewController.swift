//
//  ViewController.swift
//  CardGame
//
//  Created by EastOS on 2023/4/13.
//

import UIKit

class ViewController: UIViewController {
    lazy var game Game(numberOfGoupsOfCards: ((cardButtons.count)/4))
    
    var characters = ["春","暖","花","开","万","紫","千","红","风","和","日","丽"]
    
    @IBOutlet var carButtons: [UIButton]!
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBOutlet weak var nationFlag: UILabel!
    @IBOutlet weak var victoryLabe: UILabel!
    
    var flipCount: Int = 0{
        didSet{
            flipCountLable.text = "点击次数：\(flipCount)次"
        }
    }
    @IBAction func touchCard(_ sender:UIButton)
    
    func updateViewFromMOdel(){
        
    }
}

