class Word < ActiveRecord::Base
    has_many :definitions
    has_many :users, through: :definitions
end