require 'rails_helper'

describe "コメントのテスト" do
	let! (:sport){create(:sport)}
	let! (:user){create(:user)}
	let! (:user2){create(:user)}
	let! (:comment_room){create(:comment_room, sport_id: sport.id)}
	let! (:comment_room2){create(:comment_room, sport_id: sport.id)}
	let! (:comment){create(:comment, user_id: user.id, comment_room_id: comment_room.id)}
	let! (:comment2){create(:comment, user_id: user2.id, comment_room_id: comment_room2.id)}
	let! (:like){create(:like, comment_id: comment.id, user_id: user.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
		visit "/comment_rooms/#{comment_room.id}/comments" 
	end
	describe 'コメント一覧ページのテスト' do
		context '表示の確認' do
			it "スポーツジャンルが表示される" do
				expect(page).to have_content "ジャンル：" + sport.sport_genre
			end
			it 'ルームタイトルが表示される' do
				expect(page).to have_content "ルームタイトル：" + comment_room.title
			end
			it 'コメント入力フォームが表示される' do
				expect(page).to have_field "comment[sentence]"
			end
			it 'コメントする ボタンが表示される' do
				expect(page).to have_button "コメントする"
			end
			it 'コメント投稿者の名前が表示される' do
				expect(page).to have_content user.name
			end
			it 'コメント内容が表示される' do
				expect(page).to have_content comment.sentence
			end
			it 'コメント投稿日が表示される' do
				expect(page).to have_content comment.created_at.strftime('%Y年 %m月 %d日 %H時 %M分 %S秒')
			end
			it 'いいねの数が表示される' do
				expect(page).to have_content comment.liked_users.count
			end
			it '投稿者のみ削除ボタンが表示される' do
				expect(page).to have_link "削除", href: "/comment_rooms/" + comment_room.id.to_s + "/comments/" + comment.id.to_s
			end
			it '投稿者じゃない場合削除ボタンが表示されない' do
				visit "/comment_rooms/#{comment_room2.id}/comments"
				expect(page).to have_no_link "削除", href: "/comment_rooms/" + comment_room.id.to_s + "/comments/" + comment.id.to_s
			end
		end
		# context 'コメントのテスト' do
		# 	it 'コメントに成功する' do
		# 		fill_in 'comment[sentence]', with: "テスト"
		# 		click_on "コメントする"
		# 		expect(page).to have_content "テスト"
		# 	end
		# end
	end
end