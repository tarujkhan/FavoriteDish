class DishesController < ApplicationController


    def index
        @dishes = Dish.all
        # link_to("Click here", users_dishes_path(@dishes))
    end 

    def new
    end

    def create
    end

    def update
    end

    def delete
    end

    private
    def dishes_params
        params.require(:dish).permit(:name, :rating)
    end

end
