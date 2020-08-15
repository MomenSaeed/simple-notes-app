class NoteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "note_channel_#{params[:note_id]}"
    # note = Note.find(params[:id])
    # stream_for note
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_stream_from "note_channel_#{params[:note_id]}"
  end

  def receive(data)
    ActionCable.server.broadcast("note_channel", data)
  end
end
