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
        # cuisine = Cuisine.create(name: params[:cuisine])
        # @dish = Dish.create!(dishes_params(cuisine.id, current_user.id))
        # @dish = Dish.new(dishes_params(user_id: current_user.id, name: params[:dish][:name], rating: params[:dish][:rating], 
        # cuisine: params[:cuisine], cuisine_id: cuisine.id))
        @dish = Dish.new(dishes_params)
        @dish.user_id = current_user.id 
        # - hou do you set the cuisine id to user id
        
        #  byebug  - to save dish you need to save cuisine. in order to create cuisine we created a new instance and save it.
        # cuisine = Cuisine.new(name: params[:dish][:cuisine_id])
        #  byebug
        if @dish.save
            # byebug
            redirect_to user_dish_path(@dish.user.id)
        else 
            render :new
    end
end
    def update
        @dish = Dish.update(dishes_params)
        if @dish.save
            redirect_to @dish
        else 
            render :edit
    end
end
    def delete
        @dish.destroy
    end

    private
    def dishes_params
        params.require(:dish).permit(:name, :rating, :user_id, :cuisine_id)
        # params.require(:dish).permit(*args)
    end

end
 