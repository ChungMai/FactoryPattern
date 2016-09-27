## Factory Pattern in Swift
  This pattern is very well-known pattern and one of the most used pattern in software designer. Its purpose is to abstract the
  creation of the object. The factory method lets a class defer a instantiation to a subclass. The instantiation is done in the 
  factory class that depend on the type that we need to return to the client.
  
  With Swift, instead of interface, we'll code with the "protocol".


## Implementation
  * Define a abstract object. Here we'll define a Card Interface:
  ```swift
  protocol Card{
      var name : String? {get set}
      var attack : Int? {get set}
      var defense : Int? {get set}
      var mana : Int? {get set}
      func clone() -> Card
      func toString() -> String
  }
  ```
  
  * Create the concrete object that confirm to the above interface:
  ```swift
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
  ```
  * Create the concrete Card that inherited from Abstract Class
  ```swift
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
  ```
  * Implement the factory class - Depend what we need, this class return an instance of appropriate object
  ```swift
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
  ```
  
  ## Usage
  To simulate to the use factory pattern by a client, we create a card as follows:
  
  ```swift
  var c = CardFactory.createCard(cardType: CardType.FacelessManipulator)
  let msg = c?.toString()
  print(msg)
  ```
  To simulate our client, we simply tell *CardFactory* method that we want to create a *FacelessManipulator* card. To do this, we invoke *createCard* method(our factory method), and this method will delegate the instantiation of the card that was asked. *The c variable has Card type, not FacelessManipulator type*
  
  **Note:** we see that our client won't know exactly how to contruct the card. They only tell to create a **FacelessManipulator** card, Our client doesn't need to know that **FacelessManipulator** card need fives manas, so it provide three points of attacks and three points of defence.
  
