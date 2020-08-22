require 'rails_helper'

describe 'アバウトページのテスト' do
      let(:user) { create(:user) }
      before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit about_path
    end
  context '表示の確認' do
    it "アバウトページのテキストが正しく表示される" do
      expect(page).to have_content "このサイトでは"
    end
    it "アバウトページのテキスト（２）が正しく表示される" do
      expect(page).to have_content "スポーツジャンルごとに"
    end
    it "アバウトページのテキスト（３）が正しく表示される" do
      expect(page).to have_content "さあ、あなたも始めてみましょう"
    end
    it "アバウトページのテキスト（４）が正しく表示される" do
      expect(page).to have_content "Well come"
    end
  end
end