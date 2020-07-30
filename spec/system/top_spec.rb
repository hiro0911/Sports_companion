require 'rails_helper'

describe 'トップページのテスト' do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
    visit root_path
  end
  context '表示の確認' do
    it 'チームメンバー募集へのリンクが表示される' do
      expect(page).to have_link href: prefectures_path
      
    end
    it 'メッセージルームへのリンクが表示される' do
      expect(page).to have_link href: sports_path
    end
    it 'トップページのテキストが正しく表示される' do
      expect(page).to have_content "このサイトは"
    end
  end
end