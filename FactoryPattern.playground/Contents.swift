//: Playground - noun: a place where people can play

import UIKit

protocol Card{
    var name : String? {get set}
    var attack : Int? {get set}
    var defense : Int? {get set}
    var mana : Int? {get set}
    func clone() -> Card
    func toString() -> String
}

class AbstractCard: NSObject, Card{
    private var _name: String?
    private var _mana: Int?
    private var _attack: Int?
    private var _defense: Int?
    
    init(name:String?, mana: Int?, attack: Int?, defense:Int?){
        self._name = name
        self._attack = attack
        self._defense = defense
        self._mana = mana
        super.init()
    }
    override init(){
        super.init()
    }
    //property name
    var name: String?{
        get{ return _name }
        set{ _name = newValue }
    }
    //property mana
    var mana: Int? {
        get{ return _mana }
        set{ _mana = newValue }
    }
    //property attack
    var attack: Int? {
        get{ return _attack }
        set{ _attack = newValue }
    }
    //property attack
    var defense: Int? {
        get{ return _defense }
        set{ _defense = newValue }
    }
    func clone() -> Card {
        return AbstractCard(name: self.name, mana: self.mana, attack:
            self.attack, defense: self.defense)
    }
    func toString() -> String{
        return ("\(self.name, self.mana, self.attack,self.defense)")
    }
}
enum CardType {
    case FacelessManipulator, RaidLeader
}

class CardFactory{
    class func createCard(cardType: CardType) -> Card?{
        switch cardType{
        case .FacelessManipulator:
            return FacelessManipulatorCard()
        case .RaidLeader:
            return RaidLeaderCard()
        default:
            return nil
        }
    }
}

class RaidLeaderCard : AbstractCard{
    override init()
    {
        super.init()
        self.mana = 3
        self.attack = 2
        self.defense = 2
        self.name = "Raid Leader"
    }
}

class FacelessManipulatorCard: AbstractCard {
    override init()
    {
        super.init()
        self.mana = 5
        self.attack = 3
        self.defense = 3
        self.name = "Faceless Manipulator"
    }
}

var c = CardFactory.createCard(cardType: CardType.FacelessManipulator)
let msg = c?.toString()

print(msg)