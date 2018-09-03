class UserService
	class << self
	  def get_summary user_id
	  	# Query formation
	  	summary_data = Question.joins("left join answered_questions on answered_questions.question_id = questions.id and answered_questions.user_id = #{user_id}") #Pick user's answer
	  	summary_data = summary_data.joins({:chapter=>{:topic=>{:subject=>:exam}}})
	  	summary_data = summary_data.group("chapters.id,topics.id,subjects.id,exams.id")
	  	summary_data = summary_data.select("#{user_id} user_id,exams.name exam_name,subjects.name subject_name,topics.name topics_name,chapters.title chapters_title")
	  	# Pick Correct answers
	  	summary_data = summary_data.select("(sum(if(answered_questions.id is not NULL and answered_questions.answer_id = questions.answer_id,1,0))/count(*)) * 100 correct_answers")
	  	# Pick Wrong answers
	  	summary_data = summary_data.select("(sum(if(answered_questions.id is not NULL and answered_questions.answer_id != questions.answer_id,1,0))/count(*)) * 100 wrong_answers")
	  	# Pick unanswered 
	  	summary_data = summary_data.select("(sum(if(answered_questions.id is NULL or answered_questions.answer_id is NULL,1,0))/count(*)) * 100 unseen_or_skipped")
	  	summary_data.as_json
	  end
	end
end
