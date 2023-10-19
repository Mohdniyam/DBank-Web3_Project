import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
// import Array "mo:base/Array";
actor {
  stable var currentValue : Int = 1000;
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func currentBalance() : async Int{
      return currentValue;
  };

  public func increValue(amount : Int) : async Int {
    currentValue += amount;
    return currentValue;

  };

  public func withdrawl(amount : Int) : async Int {
    currentValue -= amount;
    if (currentValue >= 0 ){
      return currentValue;
    }
    else {
      Debug.print(debug_show ("This is amount is too large, Please Enter larger value"));
    };
    return 8;
  };

    public func compoundInterest(principal: Float, rate: Float, time: Int, frequency: Int) : async Float {
        let n = frequency;
        let r = rate / (100.0 * Float.fromInt(n));
        let nt = n * time;
        
        let compondValue : Float = principal * (1.0 + r) ** Float.fromInt(nt);

        return compondValue;
    };

    public func powerBy2 (value : Nat) : async Int {
      let poweredValue : Int = value ** 2;
      return poweredValue;
    }
};
