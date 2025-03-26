class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    @message.channel_id = Channel.first.id

    respond_to do |format|
      if @message.save
        Turbo::StreamsChannel.broadcast_append_to(
          "messages_channel",
          target: "messages",
          partial: "messages/message",
          locals: { message: @message }
        )
        format.turbo_stream { render turbo_stream: turbo_stream.append("messages", partial: "messages/message", locals: { message: @message }) }
        format.html { redirect_back(fallback_location: root_path) }
      else
        format.html { redirect_back(fallback_location: root_path, alert: 'Failed to send message.') }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end 