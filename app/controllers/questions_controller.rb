class QuestionsController < ApplicationController
  include AuthorizeUser
  include QuestionsHelper
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  # Params: ques_type - Subject/Topic/Exam , ques_id - name of any of the above 
  def index
    questions = get_questions current_user.id,ques_type,
    render json: questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# POST /questions/1/answer
# answer_id can be null - taken as skip option
  def answer
    response = {:success => false}
    @answer = AnsweredQuestion.find_or_initialize_by(question_id: @question.id,user_id: current_user.id)
    @answer.answer_id = params[:answer_id]
    if @answer.save
      response[:success] = true
    else
      response[:errors] = @answer.errors.to_s
    end
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text,:serial_no,:chapter_id)
    end
end
