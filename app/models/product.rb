class Product < ApplicationRecord
    include Notifications

    has_one_attached :featured_image
    has_rich_text :description
    validates :name, presence: true
    validates :inventory_count, numericality: {
        greather_than_or_equal_to: 0
    }

    after_update_commit :notify_subscribers, if: :back_in_stock?

end
