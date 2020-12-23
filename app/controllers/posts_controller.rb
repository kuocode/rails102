class PostsController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create]
    before_action :find_group_and_post, only:[:edit, :update, :destroy]

    def new
        @group = Group.find(params[:group_id])
        @post = Post.new
    end

    def edit
    end

    def create
        @group = Group.find(params[:group_id])
        @post = Post.new(post_params)
        @post.group = @group
        @post.user = current_user

        if @post.save
            redirect_to group_path(@group)
        else
            render :new
        end
    end

    def update
        if @post.update(post_params)
            redirect_to account_posts_path, notice: "更新成功！"
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        # flash[:alert] = "群组已删除！"
        redirect_to account_posts_path, alert: "群组已删除！"
    end


    private

    def post_params
        params.require(:post).permit(:content)
    end

    def find_group_and_post
        @group = Group.find(params[:group_id])
        @post = @group.posts.find(params[:id])
    end

end
