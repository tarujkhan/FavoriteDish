class DishesController < ApplicationController


    def index
        @dishes = Dish.all
        # link_to("Click here", users_dishes_path(@dishes))
    end 

    def show
        @dish = Dish.find_by(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        dish = Dish.new
        
    end

    def create
        @dish = Dish.create(dishes_params)
        if @dish.valid?
            redirect_to @dish
        else 
            render :new
    end
end
    def update
        @dish = Dish.update(dishes_params)
        if @dish.valid?
            redirect_to @dish
        else 
            render :update
    end
end
    def delete
        @dish.destroy
    end

    private
    def dishes_params
        params.require(:dish).permit(:name, :rating)
    end

end
