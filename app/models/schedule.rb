class Schedule < ActiveRecord::Base
  has_many :blocks, :autosave => true

  accepts_nested_attributes_for :blocks

  
end