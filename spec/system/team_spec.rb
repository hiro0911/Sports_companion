require 'rails_helper'

describe "チームのテスト" do
	let! (:sport){create(:sport)}
	let! (:prefecture){create(:prefecture)}
	let! (:team){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:team2){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:user){create(:user)}
	let! (:user2){create(:user)}
	let! (:applicant){create(:applicant, user_id: user2.id, team_id: team.id)}
	let! (:team_member){create(:team_member,user_id: user.id, team_id: team.id)}
	let! (:team_comment_room){create(:team_comment_room,team_id: team.id)}
	let! (:team_comment_room2){create(:team_comment_room,team_id: team2.id)}
	let! (:team_comment){create(:team_comment, user_id: user.id, team_comment_room_id: team_comment_room.id)}
	let! (:team_comment2){create(:team_comment, user_id: user2.id, team_comment_room_id: team_comment_room2.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe 'チームメンバー募集一覧ページのテスト' do
		before do
			visit "/prefectures/#{prefecture.id}/sports/#{sport.id}/teams"
		end
		context '表示の確認' do
			it '選択した都道府県名が表示される' do
				expect(page).to have_content prefecture.content
			end
			it '選択したスポーツ名が表示される' do
				expect(page).to have_content sport.sport_genre
			end
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "チームメンバー募集一覧"
			end
			it '新規チーム作成 ボタンが表示される' do
				expect(page).to have_link href: "/prefectures/#{prefecture.id}/sports/#{sport.id}/teams/new" 
			end
			it 'チームの画像が表示される' do
				expect(page).to have_css('img.image')
			end
			it 'チーム名が表示される' do
				expect(page).to have_content team.team_name
			end
			it '活動地域が表示される' do
				expect(page).to have_content team.area
			end
			it '募集人数が表示される' do
				expect(page).to have_content team.applicant
			end
			it '活動スタンスが表示される' do
				expect(page).to have_content team.stance
			end
		end
	end
	describe 'チーム新規作成ページのテスト' do
		before do
			visit new_prefecture_sport_team_path(prefecture_id: prefecture.id, sport_id: sport.id)
		end
		context '表示の確認' do
			it '画像が正しく表示される' do
				expect(page).to have_css('img.image')
			end
			it '画像投稿フォームが表示される' do
				expect(page).to have_field 'team[image]'
			end
			it 'チーム名入力フォームが表示される' do
				expect(page).to have_field 'team[team_name]'
			end
			it '活動地域入力フォームが表示される' do
				expect(page).to have_field 'team[area]'
			end
			it '募集人数入力フォームが表示される' do
				expect(page).to have_field 'team[applicant]'
			end
			it '活動スタンス入力フォームが表示される' do
				expect(page).to have_field 'team[stance]'
			end
			it 'チーム説明入力フォームが表示される' do
				expect(page).to have_field 'team[explanation]'
			end
			it '確定 ボタンが表示される' do
				expect(page).to have_button "確定する"
			end
		end
		# context 'チーム作成のテスト' do
		# 	it 'チーム作成に成功する' do
		# 		fill_in 'team[team_name]', with: "テスト"
		# 		fill_in 'team[area]', with: "テスト"
		# 		click_on "確定する"
		# 		expect(page).to have_content "チームを作成しました。"
		# 	end
		# 	it 'チーム作成に失敗する' do
		# 		fill_in 'team[team_name]', with: ""
		# 		fill_in 'team[area]', with: ""
		# 		click_on "確定する"
		# 		expect(page).to have_content "Areaが入力されていません。"
		# 	end
		# end
	end
	describe 'チーム詳細編集ページのテスト' do
		before do
			visit "/teams/#{team.id}/edit"
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "チーム詳細編集"
			end
			it '画像が正しく表示される' do
				expect(page).to have_css('img.image')
			end
			it '画像投稿フォームが表示される' do
				expect(page).to have_field 'team[image]'
			end
			it 'チーム名入力フォームが表示される' do
				expect(page).to have_field 'team[team_name]'
			end
			it '活動地域入力フォームが表示される' do
				expect(page).to have_field 'team[area]'
			end
			it '募集人数入力フォームが表示される' do
				expect(page).to have_field 'team[applicant]'
			end
			it '活動スタンス入力フォームが表示される' do
				expect(page).to have_field 'team[stance]'
			end
			it 'チーム説明入力フォームが表示される' do
				expect(page).to have_field 'team[explanation]'
			end
			it '確定 ボタンが表示される' do
				expect(page).to have_button "変更を保存"
			end
			it '削除 ボタンが表示される' do
				expect(page).to have_link "チームを削除", href: "/teams/#{team.id}"
			end
		end
		# context 'チーム編集のテスト' do
		# 	it '編集に成功する' do
		# 		fill_in 'team[team_name]', with: "テスト"
		# 		fill_in 'team[area]', with: "テスト"
		# 		click_on "変更を保存"
		# 		expect(page).to have_content "チーム情報を更新しました。"
		# 	end
		# 	it '編集に失敗する' do
		# 		fill_in 'team[team_name]', with: ""
		# 		fill_in 'team[area]', with: ""
		# 		click_button "変更を保存"
		# 		expect(page).to have_content "Areaが入力されていません。"
		# 	end
		# end
		context 'チーム削除のテスト' do
			it '削除に成功する' do
				click_on "チームを削除"
				expect(page).to have_content "チームを削除しました。" 
			end
		end
	end
	describe 'チームコミュニティページのテスト' do
		before do
			visit "/team_comment_rooms/#{team.id}"
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content team.team_name + "のコミュニティページです"
			end
			it '連絡事項が表示される' do
				expect(page).to have_content team.information
			end
			it '編集する ボタンが表示される' do
				expect(page).to have_link "編集する", href: "/teams/information/#{team.id}"
			end
			it 'チーム詳細ページ ボタンが表示される' do
				expect(page).to have_link "チーム詳細ページ", href: team_path(team)
			end
			it 'コメント入力フォームが表示される' do
				expect(page).to have_field 'team_comment[content]'
			end
			it '名前、コメント、コメント日時が表示される' do
				expect(page).to have_content team_comment.user.name
				expect(page).to have_content team_comment.content
				expect(page).to have_content team_comment.created_at.strftime('%Y年 %m月 %d日 %H時 %M分 %S秒')
			end
			it 'コメントの削除ボタンが表示される' do
				expect(page).to have_link "削除", href: "/team_comment_rooms/#{team.id}/team_comments/#{team_comment.id}"
			end
			it 'コメントの投稿者じゃない場合、削除ボタンが表示されない' do
				visit "/team_comment_rooms/#{team2.id}"
				expect(page).to have_no_link "削除", href: "/team_comment_rooms/#{team2.id}/team_comments/#{team_comment2.id}"
			end
		end
		# context 'コメント作成のテスト' do
		# 	it 'コメントに成功する' do
		# 		fill_in 'team_comment[content]', with: "テスト"
		# 		click_on 'コメントする'
		# 		expect(page).to have_content "テスト"
		# 	end
		# end
	end
	describe '連絡事項編集ページのテスト' do
		before do
			visit "/teams/information/#{team.id}"
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "チーム" + team.team_name + "の連絡事項編集ページです。"
			end
			it '連絡事項入力フォームが表示される' do
				expect(page).to have_field 'team[information]'
			end
			it '変更を保存する ボタンが表示される' do
				expect(page).to have_button "変更を保存する"
			end
			it 'コミュニティページに戻る ボタンが表示される' do
				expect(page).to have_link "コミュニティページに戻る", href: "/team_comment_rooms/#{team.id}"
			end
		end
		context '連絡事項編集のテスト' do
			it "編集に成功する" do
				fill_in 'team[information]', with: "テスト"
				click_on "変更を保存する"
				expect(page).to have_content "チーム情報を更新しました。"
			end
		end
	end
	describe 'チーム加入申請者一覧ページのテスト' do
		before do
			visit "/teams/#{team.id}/applicants"
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "チーム加入申請者一覧"
			end
			it 'チーム加入申請者の年齢、性別、名前が表示される' do
				expect(page).to have_content applicant.user.age
				expect(page).to have_content applicant.user.sex
				expect(page).to have_content applicant.user.name
			end
			it 'チーム加入許可 ボタンが表示される' do
				expect(page).to have_link "チーム加入許可", href: "/teams/#{applicant.team.id}/applicants/#{applicant.id}"
			end
			it 'チーム加入拒否 ボタンが表示される' do
				expect(page).to have_link "チーム加入拒否", href: "/teams/#{applicant.team.id}/applicants/#{applicant.id}"
			end
			it 'チーム詳細に戻る ボタンが表示される' do
				expect(page).to have_link "チーム詳細に戻る", href: team_path(team)
			end
		end
		context 'チーム加入のテスト' do
			it 'チーム加入許可に成功する' do
				click_on "チーム加入許可"
				expect(page).to have_content "#{applicant.user.name}さんがチームに加入しました！"
			end
			it 'チーム加入拒否に成功する' do
				click_on "チーム加入拒否" 
				expect(page).to have_content "チーム加入を取り消しました。"
			end
		end
	end
	describe 'チームメンバー一覧のテスト' do
		before do
			visit "/teams/#{team.id}/team_members"
		end
		context '表示の確認' do
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "#{team.team_name}のメンバー一覧"
			end
			it 'チームメンバーの年齢、性別、名前が表示される' do
				expect(page).to have_content team_member.user.age
				expect(page).to have_content team_member.user.sex
				expect(page).to have_content team_member.user.name
			end
			it 'ユーザー詳細へのリンク先が正しい' do
				expect(page).to have_link href: user_path(team_member.user.id)
			end
			it 'チーム詳細へ戻る ボタンが表示される' do
				expect(page).to have_link href: team_path(team)
			end
		end
	end
end