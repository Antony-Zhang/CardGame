//
//  ViewController.swift
//  CardGame
//
//  Created by EastOS on 2023/3/5.
//

import UIKit

class ViewController: UIViewController {
    // 组件引用
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLable: UILabel!
    //@IBOutlet weak var nationalFlag: UILabel!
    @IBOutlet weak var victoryLable: UILabel!
   
    var flipCount: Int = 0{
        didSet{     // 【属性观察者】
            flipCountLable.text = "你已点击：\(flipCount)次"
        }
    }
    
    //  characters容纳文字，game.cards与其顺序对应; 二者同步id
    var characters = ["春","暧","花","开","万","紫","千","红","风","和","日","丽","锦","绣","河","山"]
    //  设定一个乱序的数组，其元素为元组 ——> 乱序index(可作为按钮id) + 对应id(card与文字)
    var map_Characters = [(randomID: Int, cardID: Int)]()

    lazy var game = Game(numberOfGroupOfCards: (cardButtons.count)/4)
        //  lazy关键字，表示对对象的初始化【延迟处理】。只有在它【第一次被引用】时才进行初始化。 ViewController未实例化，其成员cardButton的值未确定
    lazy var randomIDs = (0...characters.count-1).shuffled()
        //  shuffled()使range对象乱序
    
    
    @IBAction func touchCard(_ sender:UIButton){    // 翻牌
        var buttonID = cardButtons.firstIndex(of: sender)!   // 等效于randomID
            //firstIndex()返回参数of在数组中的索引值
        var cardID = 0
        for reg in map_Characters{      // 根据乱序的buttonID，找到对应的cardID
            if reg.randomID == buttonID{
                cardID = reg.cardID
            }
        }
        game.chooseCard(at: cardID)   // 调用chooseCard（）
        
        //  点击后效果
        cardButtons[buttonID].setTitle(characters[cardID], for: .normal)    // 修改文字
        cardButtons[buttonID].backgroundColor = UIColor.white   // 修改按钮背景为white
    }
    
    func updateViewFromModel(){     // 翻的牌与前面的牌是否构成同组关系
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        victoryLable.isHidden = true;
        // 洗牌
        for index in 0..<characters.count{
            map_Characters.append((randomIDs[index],index))
        }
    }
    
}
