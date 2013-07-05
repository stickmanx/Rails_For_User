class UsersController < ApplicationController
  def index
  	@users = User.all
  	@message = "Message Test"
  end

  def new

  end

  def show
  	@user = User.find(params[:id])

 #  	respond_to do |format|
	#   	format.html # show.html.erb
	#   	format.json { render json: @user }
	# end
  end

  def create
  	# add to db
  	@user = User.new(params[:user])
  	
   # respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render json: @user, status: :created, location: @user }
        flash[:success] = "You have successfully created a user!"

      else
        # format.html { redirect_to @user, @user.errors.full_messages}
        puts "Errors:"
        puts @user.errors.full_messages

        flash[:errors] = @user.errors.full_messages

        # format.json { render json: @user.errors, notice: 'errors!!!'}
      end
      	render "new"
        # render :action => :new
      	# redirect_to :action => "new"
    # end
  end

  def edit
  	puts "edit page!"
  	@user = User.limit(params[:id]).last

  end

  def update
  	puts "Hello!!!!!"
  	@user = User.find(params[:id])

  	puts params[:user]

  	if @user.update_attributes(params[:user])
  		puts "updated!"
  	else
  		puts "not updated!"
  	end

  	render "edit"
  end

  def destroy
  	puts "DESTROY!!!"
  	@user = User.find(params[:id])
  	@user.destroy
  	puts @user.id

  	@users = User.all
  	render "index"
  end
end
