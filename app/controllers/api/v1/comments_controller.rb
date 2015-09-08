class Api::V1::CommentsController < Api::V1::BaseController
  before_action :fetch_comment

  def upvote
    if @comment.increment!(:votes)
      expose @comment.parent.question, serializer: QuestionSerializer
    else
      error! :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  def downvote
    if @comment.decrement!(:votes)
      expose @comment.parent.question, serializer: QuestionSerializer
    else
      error! :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  private

  def fetch_comment
    @comment = Answer.find(params[:id])
  end
end