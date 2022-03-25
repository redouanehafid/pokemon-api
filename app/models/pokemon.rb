class Pokemon < ApplicationRecord
    validates :name, presence: { message: "must be given please" }
    validates :name, uniqueness: true
end
