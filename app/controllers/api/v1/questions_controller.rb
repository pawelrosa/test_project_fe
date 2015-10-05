class Api::V1::QuestionsController < Api::V1::BaseController
  before_action :fetch_question, except: [:index, :create]

  def index
    @questions = Question.limit(params[:limit] || 1).order(created_at: :desc)
    expose @questions, each_serializer: QuestionSerializer, metadata: { more: Question.all.count - @questions.size }
  end

  def show
    expose @question, serializer: QuestionSerializer
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      expose @question, serializer: QuestionSerializer
    else
      error! :invalid_resource, @question.errors
    end
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

  def question_params
    params.require(:question).permit(:head, :body, :author_id)
  end
end