extends Node
var dict = {"key1": "value1", "key2": "value2"}
func _ready() -> void:
    for key in dict:
        print(key)
        print(dict[key])
    var reverse_key =dict.keys()
    reverse_key.reverse()
    for key in reverse_key:
        print(key)
        print(dict[key])
    
    for index in range(get_children().size()):
        print(get_child(index).get_name())
    
    for index in get_children().size():
        print(get_child(index).get_name())

    for child in get_children():
        print(child.get_name())
        child.queue_free()
