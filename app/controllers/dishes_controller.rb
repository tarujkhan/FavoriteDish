class DishesController < ApplicationController


    def index
        @dishes = Dish.all
        # link_to("Click here", users_dishes_path(@dishes))
    end 

    # def sort_a_to_z
    #     @dishes = Dish.sort_a_to_z
    #     render :index
    # end

    def show
        # byebug
        @user =  User.find(current_user.id)
        @dish = Dish.find(params[:dish][:id])
          
        # dish = Dish.find_by(params[:id])
        # @current_user.dishes = dish
    end

    def new
        # @user = User.find(params[:user_id])
        @dish = Dish.new
        # byebug
    end

    def create
        # byebug
        cuisine = Cuisine.create(name: params[:cuisine])
        @dish = Dish.new(user_id: current_user.id, name: params[:dish][:name], rating: params[:dish][:rating], 
        cuisine: params[:cuisine], cuisine_id: cuisine.id)
        # byebug
        # @dish.user_id = current_user.id - hou do you set the cuisine id to user id
        # @dish = Dish.create(dishes_params)
        #  byebug  - to save dish you need to save cuisine. in order to create cuisine we created a new instance and save it.
        # cuisine = Cuisine.new(name: params[:dish][:cuisine_id])
        # byebug
        if @dish.save
            # byebug
            redirect_to user_dish_path(@dish, current_user.id)
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
        params.require(:dish).permit(:name, :rating, :user_id, :cuisine, cuisine_attributes: [:id])
    end

end
 