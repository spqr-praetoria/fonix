class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    @message.channel_id = Channel.first.id # As specified, we only have 1 channel

    respond_to do |format|
      if @message.save
        format.turbo_stream
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