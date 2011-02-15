class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @button_submit = "Zarejestruj"
  end

  def edit
    @user = current_user
    @button_submit = "Zapisz"
  end
  
  def show
    @user = current_user
    @button_submit = "Zapisz"
  end

  def invitations
    @user = current_user
    @invitations = current_user.membership_invitations
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Rejestacja zakończona pomyślnie."
      redirect_to new_user_path
    else 
      @button_submit = "Zarejestruj"
      render :action => "new"
    end
  end

  def update
    @user = current_user
    @button_submit = "Zapisz"
    if @user.update_attributes(params[:user])
      flash[:notice] = "Pomyślnie zaktualizowano profil."
      render(:show) 
    else
      render :action => "edit"
    end
  end
end
