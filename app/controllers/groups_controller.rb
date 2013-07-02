class GroupsController < ApplicationController

  def create
    @group = Group.new
    @user = create_user(@group, params)
    render json: {
      group: {password: @group.password},
      user: {id: @user.id}
    }
  end

  def join
    @group = Group.where(password: params[:password]).first
    return render(json: "nogroup") unless @group
    @user = create_user(@group, params)
    render json: {
      user: {id: @user.id}
    }
  end

  def update
    @group = Group.where(password: params[:password]).first
    return render(json: "nogroup") unless @group
    @user = @group.users.where(id: params[:user]).first
    return render(json: "nouser") unless @user
    @user.latitude = params[:lat]
    @user.longitude = params[:lon]
    saved = @user.save
    @group.touch if saved
    render json: saved
  end

  def retrieve
    @group = Group.where(password: params[:password]).first
    return render(json: "nogroup") unless @group
    render json: {
      group: @group
    }
  end

  private
  def create_user(group, params)
    user = User.create(
      name: params[:user],
      latitude: params[:lat],
      longitude: params[:lon]
    )
    group.users << user
    group.save
    user
  end


end
