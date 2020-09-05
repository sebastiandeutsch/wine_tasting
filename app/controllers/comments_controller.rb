class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comments_params)

    if @comment.save
      flash.notice = "Kommentar gespeichert"
      redirect_to product_path(params[:product_id])
    else
      flash.alert = "Kommentar konnte nicht gespeichert"
      redirect_to product_path(params[:product_id])
    end
  end

private

  def comments_params
    params.require(:comment).permit(
      :name,
      :text
    )
  end
end
