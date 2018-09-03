#initial data
exam_list = [
	["Internal1","Nov-2015"],
	["Internal2","Jan-2016"],
	["Annual Exam","Aug-2016"]
] 
subjects =["Science", "Maths", "English"]
#Subject,topic,is_primary
topics = [
	["Science" ,"Organic chemistry",true],
	["Maths","Algebra",true],
	["English","Grammar",true]
]

chapters = [
	["Organic chemistry" ,"Alkenes and alkynes"],
	["Algebra" ,"Polynomials"],
	["Grammar" ,"Adjectives"]
] 
#chapters,questions,answers,correct answer
questions = [
	["Alkenes and alkynes","What would be the predicted shape for the carbon atoms in ethene, C2H4?",["Linear","Trigonal planar","Tetrahedral","Trigonal bipyramidal"],"Linear","easy"],
	["Polynomials","The number of zeros of x2 + 4x + 2",[1,2,3,0],2,"medium"],
	["Adjectives","Is a noun a person, place or thing",["All","people","person","place"],"All","hard"]
]


#Create test users
u = User.find_or_initialize_by(:email => 'test@adaptive_learning.com' )
u.password = 'test123' #for admin
u.save
1.upto(3) do |student_id|
	u = User.find_or_initialize_by(:email => "student_#{student_id}@adaptive_learning.com" )
	u.password = "testpwd#{student_id}"
	u.save
end

#Create exam and subjects 
exam_list.each do|exam_name,date_of_exam|
	exam = Exam.find_or_create_by(name: exam_name ,date_of_exam: date_of_exam)
	subjects.each do|sub_name|
		exam.subjects.find_or_create_by(:name => sub_name) 
	end
end

#Create topics
topics.each do|subject,topic,is_primary|
	subject = Subject.find_by_name subject
	subject.topics.find_or_create_by(:name => topic,:is_primary => is_primary)
end

#Create chapters
chapters.each do |topic,chapter|
	topic =Topic.find_by_name topic
	topic.chapters.find_or_create_by(:title => chapter)
end

#Create questions and answers
questions.each do|chapter,ques,ans,crt_ans,difficulty|
	topic = Chapter.find_by_title chapter
	question = topic.questions.new(:text => ques,:type => difficulty)
	ans.each do |answer|
		answer_ent = question.answers.new(:text => answer) 
		question.correct_answer = answer_ent if crt_ans == answer
	end
	question.save
end