class Video < ApplicationRecord
	validates_presence_of :nome, :url
	validates :url, presence: true, format: { with: /(http.*?\.m3u8)/}
	belongs_to :user
end
