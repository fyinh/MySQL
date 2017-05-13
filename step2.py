# coding: utf-8
import MySQLdb
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
if __name__ == '__main__':

    # 连接数据库
    conn = MySQLdb.connect(
        host='localhost',
        port=3306,
        user='root',
        passwd='123',
        charset = "utf8",
        db='university',
    )

    # 获取数据库执行游标
    cur = conn.cursor()

    # 插入数据
    # department
    sql = "insert into department values('computer','Building_A',12000);"
    #print sql #测试
    cur.execute(sql)
    conn.commit()  #提交
    li = (('biology','Building_B',24000),('physics','Building_C',28000),('new','Building_D',8000),('math','Buding_E',35000))

    sql2 = "insert into department values(%s,%s,%s);" # 利用占位符插入数据
    cur.executemany(sql2,li)     # 一次执行多次插入
    conn.commit()  #提交
    # print sql2 #测试

    li2 = list()

    # 打开student.txt 经过一系列处理将其变为元组，便于使用executemany()这个函数
    with open('student.txt') as f:
        for i in f.readlines():
            list = i.split(" ")
            #print list #测试
            ID = list[0]
            name = list[1]
            sex = list[2]
            age = list[3]
            emotion_state = list[4]
            dept_name = list[5].replace('\n','')
            li2.append((ID,name,sex,age,emotion_state,dept_name))
    #print li2 #测试

    sql3 = "insert into student values(%s,%s,%s,%s,%s,%s);"
    cur.executemany(sql3,li2)
    conn.commit()
    print "OK"

    #同student
    li3 = list()
    with open('exam.txt') as f1:
        for i1 in f1.readlines():
            list1 = i1.split(" ")
            student_ID = list1[0]
            exam_name = list1[1]
            grade = list1[2].replace('\n','')
            li3.append((student_ID,exam_name,grade))

    sql4 = "insert into exam values(%s,%s,%s);"
    cur.executemany(sql4,li3)
    conn.commit()
    print 'OK'

