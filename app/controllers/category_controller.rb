class CategoryController < ApplicationController

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.create(category_params)
        redirect_to @category
    end

private
    def category_params
        params.require(:category).permit(:title, :body)
    end
end
