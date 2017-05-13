# 3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
select * from peoples where school != GDUFS or school is NULL;

#3-2.查找计算机系每次考试学生的平均成绩(最终显示学生姓名, 平均分)。
select student.name,avg(exam.grade) 
from student,exam
where exam.student_ID = student.ID and student.dept_name = 'computer'
group by exam.exam_name;

#3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）。
select student.name,avg(exam.grade)
from student,exam
where student.ID = exam.student_ID and students.sex = 'f'
group by students.name
having avg(exam.grade) >= 80;

#3-4.找出人数最少的院系以及其年度预算。

#3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。
update department set dept_name='computer.sci.'
where dept_name='computer';

#3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。
update department b,
(select dept_name,cout(ID) as mun from student group by dept_name) tmp
set b.budget = b.budget + tmp.num * 2000

#3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.

#3-8. 删除计算机系中考试成绩平均分低于70的学生.
delete from T2
from (
        select ID
	from student
    ) as T2
left join (
        select student_ID,avg(grade)
	from exam
) as T1
on T2.ID = T1.student_ID
where T1.avg(grade) <= 70

#3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.
update students s,
(select student_ID, avg(grade) as a from exam group by student_ID) T
set s.emotion_state='single'
where s.ID =T1.student_ID and T.a < 75;


