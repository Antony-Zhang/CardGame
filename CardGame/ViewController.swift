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
    
    //  属性观察
    var flipCount: Int = 0{
        didSet{
            flipCountLable.text = "你已点击：\(flipCount)次"
        }
    }
    var completedGroup: Int = 0{    // 完成的组数
        didSet{
            if(oldValue == 3){
                victoryLable.isHidden = false
            }
        }
    }
    
    //  characters容纳文字，game.cards与其顺序对应; 二者同步id
    var characters = ["春","暧","花","开","万","紫","千","红","风","和","日","丽","锦","绣","河","山"]
    //  设定一个乱序的数组，其元素为元组 ——> 乱序index(可作为按钮id) + 对应id(card与文字)
    var map_Characters = [(randomID: Int, cardID: Int)]()
    //  设定一个结构一致的寄存容器，用来暂存被点击的同组按钮
    var mapsReg = [(randomID: Int, cardID: Int)]()
    
    lazy var game = Game(numberOfGroupOfCards: (cardButtons.count)/4)
        //  lazy关键字，表示对对象的初始化【延迟处理】。只有在它【第一次被引用】时才进行初始化。 ViewController未实例化，其成员cardButton的值未确定
    lazy var randomIDs = (0...characters.count-1).shuffled()
        //  shuffled()使range对象乱序
    
    // 翻牌
    @IBAction func touchCard(_ sender:UIButton){
        flipCount += 1
        let buttonID = cardButtons.firstIndex(of: sender)!   // 等效于randomID
            //firstIndex()返回参数of在数组中的索引值
        var cardID = 0
        for reg in map_Characters{      // 根据乱序的buttonID，找到对应的cardID
            if reg.randomID == buttonID{
                cardID = reg.cardID
            }
        }
        
        if(isSameGoup((buttonID,cardID)) && mapsReg.count == 3){           // 若已经点击了3个同组按钮
            completedGroup += 1
            mapsReg.append((buttonID,cardID))
            for reg in mapsReg{
                cardButtons[reg.randomID].setTitle("🌟", for: .normal)
                cardButtons[reg.randomID].backgroundColor = UIColor.black
            }
            mapsReg.removeAll() //  清空寄存器
        }else{
            if(!isSameGoup((buttonID,cardID))){     //  若与已点击的按钮不是同组
                //  恢复之前的按钮
                for reg in mapsReg{
                    cardButtons[reg.randomID].setTitle("🇨🇳", for: .normal)
                    cardButtons[reg.randomID].backgroundColor = UIColor.orange
                }
                mapsReg.removeAll() //  清空寄存器
            }
            cardButtons[buttonID].setTitle(characters[cardID], for: .normal)    // 修改文字
            cardButtons[buttonID].backgroundColor = UIColor.white   // 修改按钮背景为white
            mapsReg.append((buttonID,cardID))
        }
//        game.chooseCard(at: cardID, reg: &mapsReg)   // 调用chooseCard（）
    }
    
    // 翻的牌与前面的牌是否构成同组关系
    func isSameGoup(_ sender: (buttonID:Int, cardID:Int)) -> Bool{
        if(mapsReg.isEmpty){
            return true
        }
        let now_groupID = game.cards[mapsReg[0].cardID].groupID //  寄存器内的组号
        if(game.cards[sender.cardID].groupID == now_groupID){
            return true
        }else{
            return false
        }
    }
    
    // 重开洗牌
    @IBAction func touchRemake(_ sender:UIButton){
        flipCount = 0
        completedGroup = 0
        flipCountLable.text = "点击次数"
        victoryLable.isHidden = true
        randomIDs = (0...characters.count-1).shuffled() //  再次乱序
        //  盖上所有牌
        for index in 0..<characters.count{
            cardButtons[index].setTitle("🇨🇳", for: .normal)
            cardButtons[index].backgroundColor = UIColor.orange
        }
        //  清空容器
        mapsReg.removeAll()
        map_Characters.removeAll()
        
        //  重新初始化
        for index in 0..<characters.count{
            map_Characters.append((randomIDs[index],index))
        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        victoryLable.isHidden = true;
        //  map赋值
        for index in 0..<characters.count{
            map_Characters.append((randomIDs[index],index))
        }
    }
    
}
