class ChatsController < ApplicationController

  before_action :authenticate_user!
  
	def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    unless user_rooms.nil?
      @room = user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end

    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @current_user_chat = current_user.chats.new(chat_params)
    @current_user_chat.save

    @user_rooms = UserRoom.where(room_id: @current_user_chat.room_id)
    @user_rooms.each do |user_room|
      if user_room.user != current_user
        @user = user_room.user
      end
    end

    @chat = Chat.new(room_id: @current_user_chat.room_id)
    @chats = UserRoom.find_by(user_id: current_user.id, room_id: @current_user_chat.room_id).room.chats

  end

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
