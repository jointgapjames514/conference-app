class Session < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	mount_uploader :detailed_avatar, DetailedAvatarUploader

	belongs_to :event
	belongs_to :session_type
	belongs_to :location

	has_and_belongs_to_many :persons, :join_table => "persons_sessions"
end
