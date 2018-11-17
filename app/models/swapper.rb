class Swapper < ApplicationRecord
  has_and_belongs_to_many :groups

  has_one :partner, class_name: "Swapper", foreign_key: "partner_id"
  has_one :child, class_name: "Swapper", foreign_key: "child_id"
end
