class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user =  User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])

    puts "INCOMING PARAMS: #{params}"

    @url = params["body-plain"]

    if @user.nil?
      @user = User.create(email: params[:sender], password: 'TemporaryPassword')
      @user.skip_confirmation!
      @user.save!
    end

    if @topic.nil?
      @topic = Topic.create(title: params[:subject], user_id: @user)
    end

    @bookmark = @topic.bookmarks.create(url: @url, user_id: @user.id)

    head 200
  end
end
