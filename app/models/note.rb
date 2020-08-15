class Note < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :creator, class_name: 'User' , foreign_key: 'creator_id'

  # == Validations ==========================================================

  validates_presence_of :title

  # == Scopes ===============================================================

  # == Callbacks ============================================================
  # after_commit :stream_action_cable

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  # == Private Methods ======================================================
  private

    # def stream_action_cable
    #   ActionCable.server.broadcast("note_channel_#{self.id}", id: self.id, title: self.title, body: self.body)
    # end
end
