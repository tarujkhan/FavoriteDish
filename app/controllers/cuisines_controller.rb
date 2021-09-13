class CuisinesController < ApplicationController
    def index
        @cuisines = Cuisine.all
    end

    def show
    end 

    def new
        @cuisine = Cuisine.new
        @cuisine.dishes.build
    end

    def create
        @cuisine = Cuisine.create(new_cuisine)
        if @cuisine.valid?
            redirect_to @cuisine
        else
            @cuisine.dishes.build
            render :new 
        end
    end

    def edit 
    end

    def update 
        @cuisine.update(new_cuisine)
        if @cuisine.valid?
            redirect_to @cuisine
        else
            render :edit 
        end
    end

    def destroy
        if @cuisine.destroy
            redirect_to cuisines_path
        else
            redirect_to @cuisine 
        end 
    end 
    
end

    private
    def new_cuisine
    params.require(:cuisine).permit(:name)
    end 