class ArticlesController < ApplicationController

  def index
    @articles = Article.visible.order(released_at: :desc)
    @articles = @articles.open_to_the_public unless current_member
    @articles = @articles.paginate(page: params[:page], per_page: 4)
  end

  def show
    article = Artcle.visible
    article = articles.open_to_the_public unless current_member
    @article = articles.find(params[:id])
  end
end
