class Post < ApplicationRecord
    validates :title, :presence => true
    validates :content, length: { :minimum => 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait

    def title_is_clickbait
        # click_baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        # Ruby all?, any?, none?
        # https://www.rubyguides.com/2018/10/any-all-none-one/#Ruby_None_Method
        click_baits = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    if click_baits.none? {|click_bait| click_bait.match title}
    errors.add(:title, "must be clickbait")
    end

    end
end
