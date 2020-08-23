require 'rails_helper'

describe "コメントのテスト" do
	let! (:user){create(:user)}
	let! (:comment_room){create(:comment_room, sport_id: sport.id)}
	let! (:comment){create(:comment, user_id: user.id, comment_room_id: comment_room.id)}
	let! (:like){create(:like, comment_id: comment.id, user_id: user.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
		visit "/comment_rooms/#{comment_room.id}/comments(" 
	end
	describe 'コメント一覧ページのテスト' do
		
	end
end