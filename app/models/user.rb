class User < ApplicationRecord
  # == Extensions ===========================================================

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================

  has_many :created_notes , class_name: 'Note', foreign_key: 'creator_id'

  # == Validations ==========================================================

  validates_presence_of :email

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  # == Private Methods ======================================================
end
