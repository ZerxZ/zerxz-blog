# 自定义节点图标
@icon("res://icon.svg")
# 自定义节点类名
class_name MyNode
# 继承节点类型
extends Node
# 信号
signal my_signal(param1, param2)

# 变量成员
var a = 5 # 整数
var s = "Hello" # 字符串
var arr = [1, 2, 3] # 数组
var dict = {"key": "value", 2: 3} # 字典
var other_dict = {key = "value", other_key = 2}  # 另外写法字典
var typed_var: int # 类型标注
var inferred_type := "String" # 类型推断

# 获取节点
@onready var child_node = get_node("child_node")
@onready var child_node2 = $child_node 
# 获取唯一化节点
@onready var unique_child_node = get_node("%child_node") 
@onready var unique_child_node2 = %child_node

# 常量成员 不能修改
const ANSWER = 42
const THE_NAME = "Charly"

# 节点枚举 默认从0开始
enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}
# 枚举类型 从1开始
enum Season { SPRING= 1, SUMMER, AUTUMN, WINTER }

# 内置Vector类型
var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

# 函数
func some_function(param1, param2, param3):
	const local_const = 5
	
	# 条件语句
	if param1 < local_const:
		print(param1)
	elif param2 > 5:
		print(param2)
	else:
		print("失败!")

	# 循环语句
	for i in range(20):
		print(i)
	
	# while循环
	while param2 != 0:
		param2 -= 1

	# match语句
	match param3:
		# 匹配到3
		3:
			print("param3值是3！")
		# 匹配到1或2
		1,2:
			print("param3值是1或2！")
		# 匹配到其他
		_:
			print("param3值不是3或2或1！")
	# 赋值变量
	var local_var = param1 + 3
	# 返回值
	return local_var


# 在子类中，可以重载（override）与基类(base)/父类(super)中相同名称的函数。
# 如果你仍然想调用它们，可以使用 "super"来调用相同函数名。
func something(p1, p2):
	# 调用基类/父类的something函数
	super(p1, p2)

# 也可以调用基类/父类中的另一个函数
func other_something(p1, p2):
	# 调用父类的something函数
	super.something(p1, p2)

# 构造函数
func _init():
	# 调用当前类的实例函数
	self.something(1,2)
	# 上下两种写法等价 默认调用优先级: 
	# 内置全局函数(GlobalScope Functions (print 等等)) > 当前实例方法
	# 冷知识: 内置原生的方法无法重载（get_class 等等）
	# 除了内置虚拟方法可以重载 _XXX 
	# 比如：_init _ready _process _physics_process 等等
	# 如果想调用当前实例方法，就使用上面self.的写法 
	something(2,4)

	print("Constructed!")
	# 创建一个新的Something类的实例
	var lv = Something.new()
	# 访问其成员 输出结果为10
	print(lv.a)

# 内部的类
class Something:
	var a = 10

