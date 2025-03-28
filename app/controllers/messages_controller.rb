class MessagesController < ApplicationController
  def create
    @message = build_message

    respond_to do |format|
      if save_and_broadcast_message
        format.turbo_stream { head :ok }
        format.html { redirect_back(fallback_location: root_path, notice: "Message sent successfully.") }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("message_form", partial: "shared/send_message_form", locals: { error: @message.errors.full_messages.join(", ") }) }
        format.html { redirect_back(fallback_location: root_path, alert: @message.errors.full_messages.join(", ")) }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def build_message
    message = current_user.messages.build(message_params)
    message.channel_id = Channel.first.id
    message
  end

  def save_and_broadcast_message
    if @message.save
      broadcast_message
      true
    else
      false
    end
  end

  def broadcast_message
    Turbo::StreamsChannel.broadcast_append_to(
      "messages_channel",
      target: "messages",
      partial: "messages/message",
      locals: { message: @message }
    )
  end
end
