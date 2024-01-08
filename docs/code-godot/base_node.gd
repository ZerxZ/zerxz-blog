# 自定义节点图片
@icon("res://icon.svg")
# 自定义节点类名
class_name MyNode
# 继承节点类型
extends Node

# 节点变量
var a = 5 # 整数
var s = "Hello" # 字符串
var arr = [1, 2, 3] # 数组
var dict = {"key": "value", 2: 3} # 字典
var other_dict = {key = "value", other_key = 2}  # 另外写法字典
var typed_var: int # 类型标注
var inferred_type := "String" # 类型推断

# 获取节点
@onready var child_node = get_node("child_node") as Node
@onready var child_node2 = $child_node as Node
# 获取唯一化节点
@onready var unique_child_node = get_node("%child_node") as Node
@onready var unique_child_node2 = %child_node as Node

# 节点常量 不能修改
const ANSWER = 42
const THE_NAME = "Charly"

# 节点枚举 默认从0开始
enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# 内置Vector类型
var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

# 声明函数
func some_function(param1, param2, param3):
	const local_const = 5

	# 条件语句
	if param1 < local_const:
		print(param1)
	elif param2 > 5:
		print(param2)
	else:
		print("Fail!")

	# 循环语句
	for i in range(20):
		print(i)
	
	# while循环
	while param2 != 0:
		param2 -= 1

	# match语句
	match param3:
		3:
			print("param3 is 3!")
		1,2:
			print("param3 is 1 or 2!")
		_:
			print("param3 is not 3!")

	var local_var = param1 + 3
	return local_var
