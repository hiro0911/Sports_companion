require 'rails_helper'

describe "都道府県ページのテスト" do
	let! (:prefecture){create(:prefecture)}
	let! (:user){create(:user)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe '都道府県一覧ページのテスト'	 do
		before do
			visit prefectures_path
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "都道府県を選択してください"
			end
			it '都道府県別のリンクが表示される' do
				expect(page).to have_link "北海道", href: prefecture_sports_path(prefecture)
			end
		end
	end
end