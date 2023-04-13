//
//  ViewController.swift
//  CardGame
//
//  Created by EastOS on 2023/3/5.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Game(numberOfGroupOfCards: (cardButtons.count)/4)
        // lazy关键字，表示对对象的初始化【延迟处理】。只有在它【第一次被引用】时才进行初始化。 ViewController未实例化，其成员cardButton的值未确定
    
    var characters = ["春","暧","花","开","万","紫","千","红","风","和","日","丽"]
    
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
    
    
    @IBAction func touchCard(_ sender:UIButton){    // 翻牌，调用chooseCard（）
        //sender指向触发该方法的对象
        game.chooseCard(at: cardButtons.firstIndex(of: sender)!)
        //firstIndex()返回参数of在数组中的索引值
        
        // 如何变成字呢？？？？？？？？？？？？？？？？
    }
    
    func updateViewFromModel(){     // 翻的牌与前面的牌是否构成同组关系
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        victoryLable.isHidden = true;
        
        // 洗牌
        
    }
    
}
