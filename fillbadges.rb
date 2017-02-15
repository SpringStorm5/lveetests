# encoding: utf-8
load 'config.rb'

require 'selenium-webdriver'

class Badges

  def login (login, password)
    # #логинимся
    Capybara.visit("#{SITE}")
    Capybara.click_link('Log')
    sleep 2
    Capybara.fill_in('login', :with => login) #Fongieunique
    Capybara.fill_in('password', :with => password)
    Capybara.click_button('Log')
  end

  def fill_badges
    Capybara.click_link('Badges')
    Capybara.fill_in('badges__tags', :with => 'OfrAMammjWB4fZhN46eYQghegKm7GD12gx7Z25hyOWl88GhGjvStckXFANXTU4E3F3E9ojVaLMGkLA7LxJwLaNwjYpX0hxUsELC7WiwDunSpSa86IkJcbUtyCMjtenslkmAe542DJn1MZpz9CAxPsnjkSWsSq4rdnboRuJI2Zh2gGTt7iLRopfIGJfvslw1B8aqiq50VgULqAC8u4hTTE6BQXNcWuM5HeIIbMmn2GkgyjckwuJ7mOH8QxWSpSNon')
    #Capybara.find(:xpath, "//*[@id='badges__tags']").fill_in(:with => 'OfrAMammjWB4fZhN46eYQghegKm7GD12gx7Z25hyOWl88GhGjvStckXFANXTU4E3F3E9ojVaLMGkLA7LxJwLaNwjYpX0hxUsELC7WiwDunSpSa86IkJcbUtyCMjtenslkmAe542DJn1MZpz9CAxPsnjkSWsSq4rdnboRuJI2Zh2gGTt7iLRopfIGJfvslw1B8aqiq50VgULqAC8u4hTTE6BQXNcWuM5HeIIbMmn2GkgyjckwuJ7mOH8QxWSpSNon')
    Capybara.fill_in('badges__top', :with => 'test')
    Capybara.fill_in('badges__bottom', :with => 'test')
    Capybara.click_button('Save')
    sleep 5
    Capybara.save_and_open_screenshot('screenshot.png')
  end

  s = Badges.new
  s.login('User', 6279508)
  s.fill_badges
end
