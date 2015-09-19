class Hardware < ActiveRecord::Base

	belong_to :user

	validates :name, presence: true,
                    length: { minimum: 1 }
end
