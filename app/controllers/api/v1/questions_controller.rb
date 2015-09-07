class Api::V1::QuestionsController < Api::V1::BaseController
  before_action :fetch_question, except: :index

  def index
    @questions = Question.all
    expose @questions, each_serializer: QuestionSerializer
  end

  def show
    expose @question, serializer: QuestionSerializer
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  def upvote
    if @question.increment!(:votes)
      expose @question, serializer: QuestionSerializer
    else
      error! :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  def downvote
    if @question.decrement!(:votes)
      expose @question, serializer: QuestionSerializer
    else
      error! :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  private

  def fetch_question
    @question = Question.find(params[:id])
  end
end