require 'rails_helper'

describe "コメントルームのテスト" do
	let! (:sport){create(:sport)}
	let! (:user){create(:user)}
	let! (:comment_room){create(:comment_room, sport_id: sport.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe 'コメントルーム一覧ページのテスト' do
		context '表示の確認' do
			before do
				visit "/sports/#{sport.id}/comment_rooms"
			end
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "コメントルームを選択してください"
			end
			it 'コメントルーム新規作成 ボタンが表示される' do
				expect(page).to have_link href: "/sports/#{sport.id}/comment_rooms/new"
			end
			it 'コメントルーム名が表示される' do
				expect(page).to have_content comment_room.title
			end
		end
	end
	describe 'コメントルーム作成ページのテスト' do
		before do
			visit "sports/#{sport.id}/comment_rooms/new"
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "コメントルーム作成"
			end
			it 'ルーム名の入力フォームが表示される' do
				expect(page).to have_field "comment_room[title]"
			end
		end
		# context 'コメントルーム作成のテスト' do
		# 	it '作成に成功する' do
		# 		fill_in 'comment_room[title]', with: "テスト"
		# 		click_on "作成する"
		# 		expect(page).to have_content "コメントルームを作成しました。"
		# 	end
		# 	it '作成に失敗する' do
		# 		fill_in 'comment_room[title]', with: ""
		# 		click_on "作成する"
		# 		expect(page).to have_content "Titleが入力されていません。"
		# 	end
		# end
	end
end