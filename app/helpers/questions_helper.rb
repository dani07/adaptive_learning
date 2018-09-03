module QuestionsHelper

	def get_custom_ques user_id,ques_type=nil,ques_id=nil
		if ques_type.present?
			table_name = ques_type.tableize
			questions = Question.joins({:chapter=>{:topic=>{:subject=>:exam}}}).where("#{table_name}.id = #{ques_id}")
		else
			questions = Question.all
		end
		questions = questions.joins("left join answered_questions on answered_questions.question_id = questions.id and answered_questions.user_id = #{user_id}")
		#Pick unanswered/unattempted questions
		unanswered = questions.where("answered_questions.id is NULL")
		#Pick skipped questions if no questions found
		questions = unanswered.empty? ? questions.where("answered_questions.answer_id is NULL") : unanswered
		#Pick random question
		questions.order("rand()").first
	end


end
