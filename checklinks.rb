load 'config.rb'
i=0
["main", "conference", "conference", "conference/history", "conference/press", "conference/place",
 "conference/payment", "conference/attribution", "conference/linux", "statistics", "reports", "reports",
 "reports/program", "reports/abstract", "reports/materials_lvee_2011", "reports/materials_lvee_2010",
 "reports/materials_lvee_2009", "reports/materials_lvee_2008", "reports/materials_lvee_2007",
 "reports/materials_lvee_2006", "reports/materials_lvee_2005", "users/current", "users/current",
 "wiki_pages", "conference_registrations/LVEE%202012", "users/volunteers", "sponsors", "contacts",
 "contacts/official", "contacts/organizers", "contacts/lug", "reports/materials_lvee_2012",
 "conference/place_winter", "reports/materials_lvee_2012", "conference/payment_winter",
 "reports/materials_lvee_winter_2012", "conference/attribution_winter",
 "conference_registrations/LVEE%20Winter%202013", "reports/materials_lvee_winter_2013",
 "conference_registrations/LVEE%202013", "reports/materials_lvee_2013",
 "conference_registrations/LVEE%20Winter%202014", "reports/materials_lvee_winter_2014",
 "conference_registrations/LVEE%202014", "reports/materials_lvee_2014",
 "conference_registrations/LVEE%202015", "statistics/conference/LVEE%202015",
 "reports/materials_lvee_2015", "conference_registrations/LVEE%20Winter%202016",
 "reports/materials_lvee_2016", "conference_registrations/LVEE%202016", "statistics/conference/LVEE%202016"].each do |x|
	Capybara.visit("#{SITE}en/#{x}")
	Capybara.save_screenshot("./screenshots/#{i+=1}.png")
end