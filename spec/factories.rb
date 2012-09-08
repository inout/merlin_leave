FactoryGirl.define do

  factory :user do
    first_name "test"
    last_name  "user"
  end

  factory :attendance do

    ignore do
      entry_date { Time.now }
    end

    trait :today do
      entry_date {0.day.ago}
    end

    trait :previous_day do
      entry_date {1.day.ago}
    end

    trait :in_but_no_out do
      time_in {entry_date}
      time_out {nil}
    end

    trait :out_but_no_in do
      time_out {entry_date}
      time_in {nil}
    end

    trait :in_and_out do
      time_in {entry_date}
      time_out {entry_date + 8*60*60}
    end

    factory :previous_day_in_but_no_out, traits: [:previous_day, :in_but_no_out]
    factory :previous_day_out_but_no_in, traits: [:previous_day, :out_but_no_in]
    factory :previous_day_in_and_out, traits: [:previous_day, :in_and_out]
    factory :today_in_but_no_out, traits: [:today, :in_but_no_out]
    factory :today_out_but_no_in, traits: [:today, :out_but_no_in]
    factory :today_in_and_out, traits: [:today, :in_and_out]

  end

end
