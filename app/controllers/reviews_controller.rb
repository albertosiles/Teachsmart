class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @resource = Resource.find(params[resource:id])
    end

    def create
      @review = Review.new(review_params)
      @resource = Resource.find(params[resource:id])
      @review.resource_id = @resource.id
      @review.user = current_user
      if @review.save
      redirect_to resource_path(@resource)
      else
      render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to resource_path(@review.resource_id), status: :see_other
    end

private

def review_params
  params.require(:review).permit(:rating, :content)
end

end
