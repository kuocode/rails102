class WelcomeController < ApplicationController
    def index
        # flash[:notice] = "早安！您好！"
        flash[:warning] = "晚安！该睡了！"
        # flash[:alert] = "早安！您好！"

    end
end
