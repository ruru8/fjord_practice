class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comments = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.create(comment_params)
    redirect_to @commentable, notice: t('create')
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: t('destroy')
  end

  private
    # URLからBookかReportを取得する
    # ex: /books/:id/comments
    # ex: /reports/:id/comments
    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
