require 'rails_helper'

describe "ヘッダーのテスト" do
	let! (:user){create(:user)}
	context 'ヘッダーの表示とリンク先が正しい' do
		before do
			visit root_path
		end
		it 'アプリケーションのタイトルが表示される' do
			expect(page).to have_link "Sports companion", href: root_path
		end
		it 'aboutページのリンクが表示される' do
			expect(page).to have_link "about", href: about_path
		end
		it 'ログインページのリンクが表示される' do
			expect(page).to have_link "ログイン", href: new_user_session_path
		end
		it '新規登録ページのリンクが表示される' do
			expect(page).to have_link "新規登録", href: new_user_registration_path
		end
	end
	context 'ログイン後のヘッダーの表示とリンク先が正しい' do
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_button 'ログイン'
			visit root_path
		end
		it 'ウェルカムメッセージが表示される' do
			expect(page).to have_content "ようこそ#{user.name}さん！"
		end
		it 'マイページのリンクが表示される' do
			expect(page).to have_link "マイページ", href: user_path(user)
		end
		it 'ログアウトのリンクが表示される' do
			expect(page).to have_link "ログアウト", href: destroy_user_session_path
		end
	end
end