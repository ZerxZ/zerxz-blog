extends Node

var _name:String = ""; # [!code focus:6]
var person_name : String:
    get:
        return _name
    set(value):
        _name = value

var test = ""

var _age:int = 18; # [!code focus:4]
var person_age : int:
    get:
        return _age