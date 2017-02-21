# encoding: utf-8
require 'choice'
load 'config.rb'
Choice.options do
  option :login do
    short '-l'
    long '--category=CATEGORY'
    desc 'Link to category'
    default 'Test'
  end

  option :password do
    short '-p'
    long '--file=FILE'
    desc 'Output file name'
    default "6279508"

   option :email do
     short '-e'
     long '--file=FILE'
     desc 'Output file name'
     default "1_11@tut.by"
  end
end

Capybara.visit("#{SITE}")
Capybara.find(:xpath, '//*[@id="login-panel"]/ul/li[3]/a').click
Capybara.fill_in('record_login_', :with => "#{Choice[:login]}")
Capybara.fill_in('record_password_', :with => "#{Choice[:password]}")
Capybara.fill_in('record_password_confirmation_', :with => "#{Choice[:password]}")
Capybara.fill_in('record_email_', :with => "#{Choice[:email]}")
Capybara.fill_in('record_first_name_', :with => 'Galina')
Capybara.fill_in('record_last_name_', :with => 'Test')
Capybara.find('#record_country_').find(:xpath, 'option[2]').select_option #first Belarus
#Capybara.select("Albania", :from => 'record_country') # except duplicated countries
Capybara.fill_in('record_city_', :with => 'Minsk')
Capybara.fill_in('record_occupation_', :with => 'OfrAMammjWB4fZhN46eYQghegKm7GD12gx7Z25hыошдвоыдлволфыовшфыгузшыщофущшфоывгфыyOWl88GhGjvStckXFANXTU4E3F3E9ojVaLMGkLA7LxJwLaNwjYpX0hxUsELC7WiwDunSpSa86IkJcbUtyCMjtenslkmAe542DJn1MZpz9CAxPsnjkSWsSq4rdnboRuJI2Zh2gGTt7iLRopfIGJfvslw1B8aqiq50VgULqAC8u4hTTE6BQXNcWuM5HeIIbMmn2GkgyjckwuJ7mOH8QxWSpSNon')
#Capybara.check('record_subscribed_')
#Capybara.check('record_subscribed_talks_')
Capybara.click_button('Create')
sleep 3
  end

