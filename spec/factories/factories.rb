FactoryBot.define do
  factory :post do
    title "Birthday Wish"
    author  "Madhav Paudel"
    content "Happy Birthday Ganga. All the best wishes. Be happy always... Have a nice journey of life!"
    factory :invalid_post do
    	content "Short Content"
    end
  end
end