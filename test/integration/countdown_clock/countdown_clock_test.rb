require 'test_helper'
require 'capybara-screenshot/minitest'

class countdown_clock < ActionDispatch::IntegrationTest
  setup do
    @user = users :one
    
    user_sign_in @user
    
    visit root_path 
  end

  test 'header text' do
    assert page.has_css? '.col-md-4 col-md-offset-1 col-xs-11'
  end

  test 'days, hours, minutes, and sceonds text' do
    assert page.has_css? '.days'
    assert page.has_css? '.hours'
    assert page.has_css? '.minute'
    assert page.has_css? '.seconds'
    assert page.has_css? '.smalltext'
  end

  test 'next event' do
    assert_equal "link_to @name, event_path(@events.first.id), title: @description", current path
    assert_equal "link_to @host.name, @host.permalink", current path
  end
end
