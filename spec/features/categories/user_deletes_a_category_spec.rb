require 'rails_helper'

  describe "User deletes existing category" do
    scenario "a user can delete a category" do
      category = Category.create!(title: "Tech")

      visit categories_path

      within(".category_#{category.id}") do
        click_link "Delete"
      end

      expect(page).to have_content("Tech was successfully deleted!")
    end
  end
