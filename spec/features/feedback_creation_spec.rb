require 'rails_helper'

describe 'feedback creation' do
  before { visit root_path }
  scenario 'check elements', js: true do
    expect(page).to have_css('div.feedback-box-body')
    expect(page).to have_css('input#feedback_name')
    expect(page).to have_css('input#datemask')
    expect(page).to have_css('input#date')
    expect(page).to have_css('input#time')
    expect(page).to have_css('input#time')
    expect(page).to have_css('input#feedback_attachment')
    expect(page).to have_css('input#feedback_attachment')
    expect(page).to have_css('input.btn.btn-primary.btn-block.btn-flat')
  end

  scenario 'success', js: true do
    fill_in 'feedback_name', with: 'Test Test'
    find('#datemask').click
    fill_in 'datemask', with: '01011980'
    find('#date').click
    fill_in 'date', with: '10102080'
    find('#time').click
    fill_in 'time', with: '1020'
    find('input.btn.btn-primary.btn-block.btn-flat').click
    expect(page).to have_css('div.callout.callout-info')
    expect(page).to have_content('Мы ждем Вас в 10:20 10/10/2080')
  end

  scenario 'fail', js: true do
    find('input.btn.btn-primary.btn-block.btn-flat').click
    expect(page).to have_css('div.alert.alert-danger.alert-dismissible')
    expect(page).to have_content('Birthday возраст должен быть от 17 до 65 лет')
    expect(page).to have_content('Name должно содержать два слова с заглавных букв')
    expect(page).to have_content('Date дата должна быть в будущем')
  end
end
