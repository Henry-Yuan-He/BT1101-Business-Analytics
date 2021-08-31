# Introduction to R (DataCamp)

###########################
#Chapter 01 Basics基础知识#
###########################
'Calculation：+,-,*,/,^（power）,%%(modulo)'
1+1
3/2
2^5 
7%%6

'variable assignment：use"<-"or"="'
hello_try <- 5
hello_try2 = 6
hello_try + hello_try2 


'Data Type in R:数值类型numerical，整数类型integer，逻辑类型logical, 复数类型complex,字符串类型character'
#use class() function to test!

class(5) #numerical
class(as.integer(5)) #use as.integer() to transform
class(TRUE) #logical
class(1+2i) #complex number，用a+bi来表示
class("hello") #character
as.character(5) #as.character() function：force the stuff into String


#######################
#Chapter 02 Vector向量#
#######################

'前言：Vectors are everywhere in R. The basic and fundamental data structure.'

new_vector = c(3,4,5)
new_vector
###Note: all elements must be the same type！！！要么全是字符串，要么全是数字！不能混杂！！
扭曲本意 = c(1,3,4,5,"hello",TRUE)
扭曲本意



'Name the elements in the vector'
#mtd 1：name them at the birth
new_vector1 = c(name1 = "hello", name2 = "world") 
new_vector1 #two elements: "hello" 和 "world"，their names are name1 and name2

boy_and_girl = c(boy = "hello", girl = "world")
boy_and_girl



#mtd 2：use names() function to name the existing vector
some_vector = c("John Doe", "Poker Player") 
names(some_vector) = c("Name", "Professional")
some_vector


'Extract the element from vectors：use“[]”符号'


#1.by index (vector)
some_vector[2] 
poker_vector = c("a","b","c","d","e") #if we want to extract multiple items, then must input a vector
poker_vector[c(1,3,4)]
poker_vector[c(1,2,5)]
poker_vector[1:3] 
poker_vector[c(1:5)]


#2.by name
some_vector["Name"] 
some_vector[c("Name", "Professional")]
some_vector["Professional"]
some_vector[1]


#3.by Boolean (vector)
new_vector <- c(3,4,5)
new_vector[c(FALSE,TRUE,TRUE)]
new_vector[c(TRUE,FALSE,TRUE)]



'Vector Addition'
c(1,2,3) + c(4,5,6) #意味着相加的向量长度得相等，否则会报错！
c(2,5,6) + c(7,9,10)
'sum() function : add all elements'
sum(c(1,2,3))
sum(1:100) 

'mean() function'
mean(c(1,2,3))
mean(1:50)



'逻辑判断符logical comparison operators() <,>,==,<=,>=,!=), 返回TRUE或FALSE'
hello = (c(3,4,5) > 4) #返回一个向量，里面都是逻辑类型的元素（即TRUE或FALSE）
hello

'向量之间的拼接：把两个向量拼接成一个向量'
small_vector1 = c(1,5)
small_vector2 = c(2,3)
big_vector = c(small_vector1, small_vector2)
big_vector #最终生成一个新的拼接向量(1,5,2,3)，注意不是向量里面套向量！而是直接的元素的拼接！


########################
#Chapter 03 Matrix 矩阵#
########################
'前言：矩阵由向量们组成，two-dimensional rectangular layout。矩阵也是R中非常基础的数据类型'

'创建一个矩阵，我们利用matrix()函数（参数很多)'
new_matrix <- matrix(data = 1:9, 
                     nrow = 3, ncol = 3, byrow = TRUE, 
                     dimnames = NULL)
new_matrix
      #参数data:表示我要填入矩阵的数据是什么！（注意要以向量的形式来填入数据）
      #参数nrow和ncol：表示行数和列数，两个数字乘起来肯定要等于我们data里面元素的个数的
      #参数byrow:默认情况下这个是FALSE,意味着默认是竖着一个个排列的；若要横着排列则赋值为TRUE
      #参数dimnames：给矩阵的row和column命名的作用，默认是NULL。若要赋值，则利用list函数创建列表，第一个元素是row的名字向量，第二个是column的名字向量


'给矩阵的rows和columns来命名'
#第1种:在创建矩阵的时候就命名：利用matrix()函数中的dimnames参数
box_office <- c(460.998, 314.4, 290.475, 247.9, 309.306, 165.8)
star_wars <- matrix(box_office,  #第一个参数默认就是data参数
                    nrow = 3, ncol = 2, byrow = TRUE, 
                    dimnames = list(c("HOPE", "EMPIRE","RETURN"),c("US","NON-US"))) 
star_wars


#第2种：创建矩阵以后才命名：利用rownames()函数和colnames()函数
row_names_vector = c("第一行", "第二行", "第三行") #元素个数要和row的个数一致
col_names_vector = c("第一列", "第二列", "第三列") #元素个数要和column的个数一致
rownames(new_matrix) = row_names_vector 
colnames(new_matrix) = col_names_vector
new_matrix


'矩阵中的计算：对row和col的计算'
#1.对矩阵中全部的row进行加和：利用rowSums()函数。产生的是一个新的vector（元素是每一个row的求和）
rowSums(star_wars)
rowSums(new_matrix)

#2.对矩阵中全部的column进行加和：利用colSums()函数。产生的是一个新的vector（元素是每一个col的求和）
colSums(star_wars)
colSums(new_matrix)


'在矩阵添加col和row的操作'
new_matrix2 = matrix(data=10:18, nrow = 3, ncol = 3, byrow = TRUE)
new_matrix2

#1.利用cbind()函数：将多个矩阵或者多个向量横着合并，最终返回一个大矩阵
  #比如：big_matrix <- cbind(matrix1, matrix2, ..., vector1, vector2,....)
  #当然，前提是这些矩阵和向量都有相同的rows
cbind(new_matrix,new_matrix2,c(100,1000,10000))
#2.利用rbind()函数：将多个矩阵或者多个向量竖着合并，最终返回一个大矩阵
  #当然，前提是这些矩阵和向量都有相同的columns
rbind(new_matrix,new_matrix2,c(100,1000,10000))


'简单的矩阵运算：+,-,*,/'
#乘法*： 2 * new_matrix的含义是：对矩阵中所有的元素分别乘以2
2 * new_matrix
#矩阵的乘法：利用符号 %*%
new_matrix %*% new_matrix

'提取/索引/切片矩阵中的row和column：利用[ ]符号'
#其实，和对向量元素的提取是类似的。矩阵和向量相比区别仅仅在于二维和一维
#方括号中，第一个参数对应row，第二个参数对应column

#1.用row和column的序号来提取
new_matrix[1,2] #选取第一个row,第二个column所对应的元素
new_matrix[1:2, 2:3] #选取一二两行，二三两列
new_matrix[c(1,3), 1] #选取一三两行，第一列
new_matrix[, 1] #选取第1列全部的元素
new_matrix[2, ] #选取第2行全部的元素


#2.用row和column的名字来提取
  #注意：名字要以字符串形式，多个名字要以向量的格式
star_wars["HOPE", "US"] #同样是遵循第一个参数是对应row,第二个参数是对应column
star_wars[c("HOPE", "RETURN"), c("US", "NON-US")]


########################
#Chapter 04 Factor 因子#
########################

'前言：因子是用于表示一组数据中的类别，可以记录这组数据中的类别名称以及类别数目。
R语言在，我们利用factor()函数来建立因子'

sex = factor(c("man","woman","man","man","woman")) #必须在vector的基础上来建立factor
class(sex)  #factor
levels(sex) #levels()函数：查看因子中具体有哪些类别
nlevels(sex) #因子里面具体有几个不同的类别

sex #print因子的时候，不仅会将所有的元素print出来，还会同时直接print出levels（有哪些类别）

#当我不想要因子类型，想强制转化成字符串时：利用as.character()函数强制转换
as.character(sex)

'改变因子中levels的名字:利用levels()函数'
#一定注意：在我们用levels()函数替换前，一定要看清楚原本levels的排列顺序是什么样子的！要一一对应！
levels(sex)
levels(sex) = c("boy","girl") #这个顺序很重要！要先看清楚！
sex #由于改变了因子类型的名字，因子中所有元素都会跟着一起改变


'快速浏览一个变量里面的内容:利用summary()函数'
#对因子处理summary：summary会给你按照level进行分类，然后统计频数
summary(sex)
#对普通向量处理summary
summary(c("man","woman","man","man","woman"))


'接下来，我们研究分类变量categorical variables。
categorical variables有两类：
   1.nominal categorical variable名义分类变量：没有implied order，比如大象，猴子，鸡...
   2.ordinal categorical variable序数分类变量：有natural order，比如low, medium, high
当然，计算机是不会天生就懂序数分类变量的顺序的，需要我们告诉它。'

#默认情况下，factor函数是把vector转化成unordered factor。如果要告诉它顺序，则需要改变两个参数
velocity_factor = factor(c("slow", "fast", "medium", "fast", "slow"), #第一个参数是vector
                          ordered = TRUE, #告诉计算机我要给因子的类别排序
                          levels = c("slow", "medium", "fast")) #以向量形式，从小到大对类别排序
velocity_factor

######################
#Chapter 05 List 列表#
######################

'前言：list和vector是比较相似的，都是存放一堆东西在里面。
但是重大区别：vector中的所有元素，都必须是相同的数据类型；
            但是list中的元素的数据类型可以各不相同。（可以使matrices, vector, data frames...）
我们利用list()函数来建立列表'

my_list = list(velocity_factor, new_vector1, new_matrix2, star_wars) #随便放不同类型的东西进来
my_list


'给列表中的元素命名'
#第1种：在创建列表时，同时命名
my_list2 = list(velocity = velocity_factor, new_vec = new_vector1, 
                 new_matr = new_matrix2, star_w = star_wars)
my_list2  #这样列表里四个元素分别叫：velocity, new_vec, new_matr, star_w


#第2种：创建一个列表后，再对components来命名：利用names()函数
names(my_list) = c("velocity", "new_vec", "new_matr", "star_w")
my_list


'提取/索引/切片list中的元素：利用[[ ]]符号' #注意是双括号！貌似不能多个元素提取。
#第1种：直接用序号来提取
my_list[[2]]
my_list[[4]]


#第2种：用名字来提取
my_list[["new_matr"]]
my_list[["new_vec"]]
my_list[["star_w"]]

#第3种：用$符号结合名字
my_list$star_w
my_list$velocity
my_list$new_matr


'在已有list中要添加新元素：利用append函数'
new_ele = as.vector(c(1,2,999))
my_list_add = append(my_list, new_ele, 2) #（append的第三个参数可以选插入位置

my_list_add[[3]] #1
my_list_add[[4]] #2
my_list_add[[5]] #999
my_list_add[[6]]

##############################
#Chapter 06 Data Frame 数据框#
##############################

'前言：矩阵中的元素都必须是相同的数据类型，但是在现实中，当我们在做survey的时候，所研究的数据
不可能都是数字或者字符串。因此，我们接下来要研究data frame：data sets that contains different
data types'

#数据框：a list of vectors of equal length。 
'我们利用data.frame()函数来建立数据框。括号里放入相等长度的向量们。放进括号的向量们会作为columns
向量的名字会显示在第1行'

mtcars #我们引入一个Bulit-in R的data frame
head(mtcars) #让你看看头
head(mtcars, 3) #前8行
tail(mtcars) #让你看看尾
str(mtcars)  #利用str()函数，可以展现数据框的框架structure
View(mtcars)

'自己创建一个data frame'
# Definition of vectors
name = c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type = c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter = c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation = c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings = c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df = data.frame(name, type, diameter, rotation, rings) #输入的变量的名字自动变成了column的名字!神奇！
planets_df

head(planets_df,8)
str(planets_df) 
View(planets_df)

'提取/索引/切片数据框中的元素：利用[ ，]' #第一个是row，第二个是column
planets_df[1:3, 2:4]    #提取1-3的row和2-4的column
planets_df[1,]          #提取第1行全部元素
planets_df[1:3, "type"] #提取名字为type的那个column的1-3的row
planets_df$diameter     #提取diameter这整个column
planets_df$rotation




'通过设定特定的条件来提取data frame的子集：利用subset()函数'
#subset函数的第一个参数是你想提取的data frame，第二个参数是条件，返回出的也是data frame
subset(planets_df, diameter < 1)
subset(planets_df, rotation > 0)
subset(planets_df, planets_df$rings == TRUE)
subset(planets_df, planets_df$type == "Gas giant")


library(dplyr)
#方法2：利用dplyr库中的filter函数
planets_df %>% filter(`diameter` < 1)
planets_df %>% filter(`rotation` > 0)
planets_df %>% filter(`rings` == TRUE)
planets_df %>% filter(`type` == "Gas giant")

planets_df %>% filter(planets_df$diameter < 1)
planets_df %>% filter(planets_df$rotation > 0)
planets_df %>% filter(planets_df$rings == TRUE)
planets_df %>% filter(planets_df$type == "Gas giant")



'给向量中的元素排名：利用排序函数order()'
a = c(100,10,1000)
b = c(3,12,9)
order(a) #返回的是一个整数向量，里面是向量a元素的大小排名

#利用order()函数给向量洗牌reshuffle
a[order(a)] #返回一个新向量，里面是a向量的元素从小到大排列
b[order(a)] #返回一个新向量，不过它是以a中元素的大小排列顺序，来排列b中的元素



