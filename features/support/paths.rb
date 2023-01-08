# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    when /^the login\s?page$/
      :login
    when /^the logout\s?page$/
      :logout
    when /^the search\s?page$/
      representatives_path
    when /^the California\s?page$/
      search_representatives_path("California")
    when /^the Article\s?page$/
      :new_my_news_item

    when /^the profile\s?page$/
      user_profile_path
      
    when /^the events\s?page$/
      events_path
    when /^the Alameda County\s?page$/
      events_path
    when /^the events2\s?page$/
      events_path(2)
    when /^the article1\s?page$/
      representative_news_items_path(1)
    else

      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
