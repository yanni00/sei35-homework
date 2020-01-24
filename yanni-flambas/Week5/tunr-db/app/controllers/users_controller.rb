class UsersController < ApplicationController

  # Certain pages are visible only to logged in users:
  before_action :check_if_logged_in, except: [ :new ]

  # Lock down admin pages
  before_action :check_if_admin, only: [ :index ]

  def new
    @user = User.new
  end

  def create

    @user = User.create user_params  # strong params

    if @user.persisted?
      # account created successfully
      session[:user_id] = @user.id  #log them in automatically
      redirect_to user_path(@user.id)
    else
      # There was an error, so show the signup for again
      # BUT - we want the form to be prefilled, so let's
      # not redirect to the login form, byt just render
      # the 'new' form template again. This way, the template
      # can see our @user variable from above, and prefill
      # the form.

      # Set up our flash variable with appropriate errors
      # show on the template:

      # NOPE! beacause of the rendering, instead of rediecting, the flash message will #live for ANOTHER page reload.
      #Let's just use @user.errors in our template directly/
      # flash[:errors] = @user.errors.full_messages # ActiveRecord has set these errors

      render :new

    end
  end #Create

  def index
    @users = User.all
  end #Index

  def show

    # Show pages can ONLY be seen by logged-in users
    @user = User.find params[:id]

  end #Show

  def edit
  end #Edit

  def update
  end #Update

  def destroy
  end #Destroy

  private
  def user_params

    params.require(:user).permit( :name, :email, :password, :password_confirmation )

  end

end #UsersController
