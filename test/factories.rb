FactoryGirl.define do

	factory :user do
		sequence :email do |n|
			"walleytest#{n}@gmail.com"
		end
		password "password"
		password_confirmation "password"
	end

	factory :place do
		association :user
		name "Test Place"
		address "123 Test Address"
		description "Test description"
		latitude "27.930738"
		longitude "-82.482849"
	end

	factory :comment do
		association :user
		association :place
    	message "Awesome test"
    	rating "5_stars"
	end

end
