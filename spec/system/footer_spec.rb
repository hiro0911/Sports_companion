require 'rails_helper'
describe 'フッターのテスト' do
	let! (:user){create(:user)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
		visit root_path
	end
	context '表示の確認' do
		it 'トップに戻るリンクが表示される' do
			expect(page).to have_link "トップに戻る", href: root_path
		end
		it 'お問い合わせリンクが表示される' do
			expect(page).to have_link "お問い合わせ", href: new_inquiry_path
		end
	end
end