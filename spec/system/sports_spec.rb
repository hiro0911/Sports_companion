require 'rails_helper'

describe "スポーツページのテスト" do
	let! (:sport){create(:sport)}
	let! (:prefecture){create(:prefecture)}
	let! (:team){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:user){create(:user)}
	let! (:room){create(:room, user_id: user.id)}
	let! (:applicant){create(:applicant, user_id: user.id, team_id: team.id)}
	let! (:team_member){create(:team_member,user_id: user.id, team_id: team.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe "スポーツ一覧ページのテスト" do
		before do
			visit sports_path
		end
   	context '表示の確認' do
   		it 'タイトルが正しく表示される' do
   			expect(page).to have_content "スポーツを選択してください"
   		end
   		it 'スポーツジャンル追加 ボタンが表示される' do
   			expect(page).to have_link href: new_sport_path
   		end
   		it '編集 ボタンが表示される' do
   			expect(page).to have_link href: edit_sport_path(sport)
   		end
   		it '投稿画像が正しく表示される' do
   			expect(page).to have_css("img[src*='image']")
   		end
   		it '投稿スポーツ名が正しく表示される' do
   			expect(page).to have_content(sport.sport_genre)
   		end
   	end
  end
  describe 'スポーツジャンル追加ページのテスト' do
  	before do
  		visit new_sport_path
  	end
  	context '表示の確認' do
	  	it 'タイトルが正しく表示される' do
	  		expect(page).to have_content "スポーツジャンル追加"
	  	end
	  	it '画像が正しく表示される' do
	  		expect(page).to have_css("img[src*='image']")
	  	end
	  	it '画像投稿フォームが表示される' do
   			expect(page).to have_field 'sport[image]'
   		end
	  	it 'スポーツ名入力フォームが表示される' do
	  		expect(page).to have_field 'sport[sport_genre]'
	  	end
	  	it '新規作成 ボタンが表示される' do
	  		expect(page).to have_button "新規作成"
	  	end
	  	it 'トップに戻る ボタンが表示される' do
	  		expect(page).to have_link href: root_path
	  	end
  	end
  	context 'スポーツジャンル追加のテスト' do
  		it 'スポーツジャンル追加に成功する' do
	  		fill_in 'sport[sport_genre]', with: "test"
	  		click_on "新規作成"
	  		expect(page).to have_content "スポーツジャンルを作成しました。"
  		end
  		it 'スポーツジャンル追加に失敗する' do
  			click_on "新規作成"
  			expect(page).to have_content "Sport genreが入力されていません。"
  		end
  	end
  end
  describe 'スポーツジャンル編集のテスト' do
  	before do
  		visit edit_sport_path(sport.id)
  	end
  	context '表示の確認' do
  		it 'タイトルが正しく表示される' do
  			expect(page).to have_content sport.sport_genre + "画像編集"
  		end
  		it '画像投稿のフォームが表示される' do
  			expect(page).to have_field 'sport[image]'
  		end
  		it 'スポーツ名の入力フォームが表示される' do
  			expect(page).to have_field 'sport[sport_genre]'
  		end
  		it '更新 ボタンが表示される' do
  			expect(page).to have_button "更新"
  		end
  		it 'トップに戻る ボタンが表示される' do
  			expect(page).to have_link href: root_path
  		end
  		it 'スポールジャンルを削除 ボタンが表示される' do
  			expect(page).to have_link href: "/sports/" + sport.id.to_s
  		end
  	end
  	context '編集のテスト' do
  		it '更新が成功する' do
  			click_on "更新"
  			expect(page).to have_content "スポーツジャンルを更新しました。"
  		end
  		it '更新に失敗する' do
  			fill_in 'sport[sport_genre]', with: ""
  			click_on "更新"
  			expect(page).to have_content "Sport genreが入力されていません。"
  		end
  	end
  	context '削除のテスト' do
  		it '削除に成功する' do
  			click_on "スポーツジャンルを削除"
  			expect(page).to have_content "スポーツジャンルを削除しました。"
  		end
  	end
  end
end