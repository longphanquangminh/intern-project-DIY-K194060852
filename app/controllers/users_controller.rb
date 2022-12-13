class UsersController < DeviseController
    
    def show 
    end
    def edit 
        self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    end
    def update
        # update a user and redirect to index
        @user = User.find(current_user.id)
        @user.update(user_params)
        if @user.save
            flash[:notice] = 'You have successfully updated your account info'
            render :edit
        else
            flash.now[:notice] = 'There is an error in your form'
            render :edit

            # flash[:notice] = 'There is an error in your form'
            # redirect_to edit_user_path
        end
    end
    private

    def user_params
      params.permit(:full_name, :email, :cv)
    end
end
