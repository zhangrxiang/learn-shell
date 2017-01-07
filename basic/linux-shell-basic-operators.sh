#!/usr/bin/env bash


val=`expr 2 + 2`
echo "sum : $val"


#运算符	说明	举例
#+	加法	`expr $a + $b` 结果为 30。
#-	减法	`expr $a - $b` 结果为 -10。
#*	乘法	`expr $a \* $b` 结果为  200。
#/	除法	`expr $b / $a` 结果为 2。
#%	取余	`expr $b % $a` 结果为 0。
#=	赋值	a=$b 将把变量 b 的值赋给 a。
#==	相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
# !=	不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。



a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [[ $a == $b ]]
then
    echo "a == b"
fi

if [ $a != $b ]
then
    echo "a != b"
fi

#关系运算符

#运算符	说明	举例
#-eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
#-ne	检测两个数是否相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
#-gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
#-lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
#-ge	检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
#-le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

if [ $a -eq $b ]
then
    echo "$a -eq $b : a == b"
else
    echo "$a -eq $b: a != b"
fi
if [ $a -ne $b ]
then
    echo "$a -ne $b: a != b"
else
    echo "$a -ne $b : a == b"
fi
if [ $a -gt $b ]
then
    echo "$a -gt $b: a > b"
else
    echo "$a -gt $b: a <= b"
fi
if [ $a -lt $b ]
then
    echo "$a -lt $b: a < b"
else
    echo "$a -lt $b: a >= b"
fi
if [ $a -ge $b ]
then
    echo "$a -ge $b: a >= b"
else
    echo "$a -ge $b: a < b"
fi
if [ $a -le $b ]
then
    echo "$a -le $b: a <= b"
else
    echo "$a -le $b: a > b"
fi



#布尔运算符
#运算符	说明	举例
# !	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
#-o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
#-a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。

if [ $a != $b ]
then
    echo "$a != $b : a != b"
else
    echo "$a != $b: a == b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
    echo "$a -lt 100 -a $b -gt 15 : return true"
else
    echo "$a -lt 100 -a $b -gt 15 : return false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
    echo "$a -lt 100 -o $b -gt 100 : return true"
else
    echo "$a -lt 100 -o $b -gt 100 : return false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
    echo "$a -lt 100 -o $b -gt 100 : return true"
else
    echo "$a -lt 100 -o $b -gt 100 : return false"
fi


#逻辑运算符
#运算符	说明	举例
#&&	逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
#||	逻辑的 OR	[[ $a -lt 100 || $b -gt 100 ]] 返回 true

if [[ $a -lt 100 && $b -gt 100 ]]
then
    echo "[ $a -lt 100 && $b -gt 100 ] return true"
else
    echo "[ $a -lt 100 && $b -gt 100 ] return false"
    echo "wocao"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
    echo "[ $a -lt 100 || $b -gt 100 ] return true"
else
    echo "[ $a -lt 100 || $b -gt 100 ] return false"
fi

bool=true
bool=false
if [ $bool == true ];then
    echo true
elif [ $bool == false ];then
    echo false
fi


#字符串运算符
#下表列出了常用的字符串运算符，假定变量 a 为 "abc"，变量 b 为 "efg"：
#运算符	说明	举例
#=	检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
# !=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
#-z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
#-n	检测字符串长度是否为0，不为0返回 true。	[ -n $a ] 返回 true。
#str	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。

a="abc"
b="efg"

if [ $a = $b ]
then
    echo "$a = $b : a == b"
else
    echo "$a = $b: a != b"
fi
if [ $a != $b ]
then
    echo "$a != $b : a != b"
else
    echo "$a != $b: a == b"
fi
if [ -z $a ]
then
    echo "-z $a : str length 0"
else
    echo "-z $a : str length not 0"
fi
if [ -n $a ]
then
    echo "-n $a : str length not  0"
else
    echo "-n $a : str length 0"
fi
if [ $a ]
then
    echo "$a : str not null"
else
    echo "$a : null"
fi


#文件测试运算符
#文件测试运算符用于检测 Unix 文件的各种属性。
#属性检测描述如下：
#操作符	说明	举例
#-b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
#-c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
#-d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
#-f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
#-g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
#-k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
#-p file	检测文件是否是有名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
#-u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
#-r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
#-w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
#-x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
#-s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
#-e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。



file="./linux-shell-basic-operators.sh"
if [ -r $file ]
then
    echo "file readable"
else
    echo "file not readable"
fi
if [ -w $file ]
then
    echo "file writable"
else
    echo "file not writable"
fi
if [ -x $file ]
then
    echo "file executable"
else
    echo "file not executable"
fi
if [ -f $file ]
then
    echo "common file"
else
    echo "special file"
fi
if [ -d $file ]
then
    echo "file is directory"
else
    echo "file is not directory"
fi
if [ -s $file ]
then
    echo "file is not null"
else
    echo "file is null"
fi
if [ -e $file ]
then
    echo "file exists"
else
    echo "file not exists"
fi


if true; then
    if true; then
        echo "wocao"
    else
        echo "false"
    fi
fi

