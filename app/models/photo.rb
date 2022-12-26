# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  acts_as_list
end
