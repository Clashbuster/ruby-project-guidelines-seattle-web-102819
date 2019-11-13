class User < ActiveRecord::Base
    has_many :definitions
    has_many :words, through: :definitions
end