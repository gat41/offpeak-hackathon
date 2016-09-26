class UsersController < Clearance::UsersController

  def index
  end

  def show
    #@user = User.find(params[:id])
  end

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
	end

	def edit
	end

private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    gender = user_params.delete(:gender)
    #image_url = user_params.delete(:image_url)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.gender = gender
     # user.image_url = image_url
    end
	end

	def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
	end

end