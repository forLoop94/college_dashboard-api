class Api::V1::ChatsController < ApplicationController
  def create
    @chat = current_user.chats.build(chat_params)

    if @chat.save
      render json: {chat: @chat, message: "Chat created successfully"}, status: :created
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :lesson_area_id)
  end
end
