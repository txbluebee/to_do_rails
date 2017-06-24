require 'rails_helper'

describe "add a list process" do
  it "add a new list" do
    visit lists_path
    click_link 'New List'
    fill_in 'Name', :with => 'Home chores'
    click_on 'Create List'
    expect(page).to have_content 'Lists'
  end

  it 'gives error when no name is entered' do
    visit new_list_path
    click_on 'Create List'
    expect(page).to have_content 'errors'
  end
end
