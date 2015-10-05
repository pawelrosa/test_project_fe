class Api::V1::AnswersController < Api::V1::BaseController
  before_action :fetch_answer, except: [:create]

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      expose @answer.question, serializer: QuestionSerializer
    else
      error! :invalid_resource, @answer.errors
    end
  end

  def upvote
    if @answer.increment!(:votes)
      expose @answer.question, serializer: QuestionSerializer
    else
      error! :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  def downvote
    if @answer.decrement!(:votes)
      expose @answer.question, serializer: QuestionSerializer
    else
      error! :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  private

  def fetch_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:question_id, :parent_id, :author_id, :body)
  end
end