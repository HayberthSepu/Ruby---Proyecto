FactoryBot.define do
    factory :client do
      name { 'John' }
      last_name { 'Doe' }
      email { 'john.doe@example.com' }
      b_date { '1990-01-01' }
      status { :active }
      contact_means { :facebook }
      phone { '1234567890' }
      address { '123 Main St' }
      personal_description { 'This is a detailed personal description with more than 500 characters.
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                              tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' }
      is_old { false }
    end
  end
