# encoding: utf-8
load 'config.rb'

require 'selenium-webdriver'

module Reg
  class Registration

    # def initialize(name, age, weight)
    #   @name, @age, @weight = name, age, weight
    # end


    def site(site)
      @site = site
    end

    def namecof(namecof)
      @namecof = namecof
    end

    def login (login, password)
      # #логинимся
      Capybara.visit(@site)
      Capybara.click_link('Log')
      sleep 1
      Capybara.fill_in('login', :with => login) #Fongieunique
      Capybara.fill_in('password', :with => password)
      Capybara.click_button('Log')
    end

    def create
      Capybara.visit("#{SITE}en/admin/conferences") #.//*[@id='sub-menu']/li[2]/ul/li[2]/a
      # Capybara.click_link('Admin')
      # Capybara.visit Capybara.find('a', :text => 'Conferences admin')[:href]
      Capybara.click_link('as_admin__conferences-new--link')
      Capybara.fill_in('record_name_', :with => @namecof)
      Capybara.fill_in('record_start_date_', :with => '2020-11-30')
      Capybara.fill_in('record_finish_date_',:with => '2020-12-14')
      sleep 3
      Capybara.check('record_registration_opened_')
      Capybara.click_button('Create')
      Capybara.click_link('Log')
    end

    def reg_conference_first
      # #регимся в первый раз
      Capybara.click_link('Register to' + " " + @namecof) #заменить на XPath
      Capybara.fill_in('record_proposition_', :with => 'testing site')
      Capybara.fill_in('record_quantity_', :with => '5')
      Capybara.click_button('Create')
      Capybara.click_on('Logout')
      #bundle exec rake get_role:admin:logins "Darling"
    end

    def approve_user
      Capybara.visit(@site + 'en/admin/conference_registrations') #.//*[@id='sub-menu']/li[2]/ul/li[4]
      Capybara.click_link('as_admin__conference_registrations-edit-1-link') #сделать по имени
         #или апрув алл
      Capybara.find('#record_status_name').click
      Capybara.select('approved')
      Capybara.click_button('Update')
      Capybara.click_on('Logout')
    end

    def approve_all
      Capybara.visit(@site + 'en/admin/conference_registrations') #.//*[@id='sub-menu']/li[2]/ul/li[4]
      sleep 5
      Capybara.click_link('as_admin__conference_registrations-approve_all--link')
      Capybara.find('#conference_id').click
      Capybara.select(@namecof)
      Capybara.click_button('Approve all')
      sleep 5
      Capybara.click_on('Logout')
    end


    def two_anketa
      #вторая анкета
      Capybara.find(:xpath, '//*[@id="login-panel"]/ul/li[1]').click
      sleep 2
      Capybara.click_link('Confirm participation')
      #Capybara.find(:xpath, './/*[@id="article-bg"]/div[1]/p[5]/a[1]').click
      #Capybara.find(:a, :text => 'Confirm').click_link
      sleep 5
      Capybara.check('record_days_', match: :first)
      Capybara.fill_in('record[phone]', :with => '+375256279508')
      Capybara.check('record_floor')
      #Capybara.click_button('Select')
      Capybara.find('#record_transport_to').find(:xpath, 'option[2]').select_option
      Capybara.find('#record_transport_from').find(:xpath, 'option[2]').select_option
      Capybara.find('#record_tshirt_', match: :first).find(:xpath, 'option[2]').select_option
      Capybara.click_button('Update')

    end

  end
end


yes = Reg::Registration.new

yes.namecof('test5')
yes.site("#{SITE}")
yes.login('Darling2', 6279508)
yes.create
yes.login('User', 6279508)
yes.reg_conference_first
yes.login('Darling2', 6279508)
yes.approve_all
yes.login('User', 6279508)
yes.two_anketa

