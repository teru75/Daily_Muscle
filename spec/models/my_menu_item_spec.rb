require 'rails_helper'

RSpec.describe 'MyMenuItemモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:my_menu_item) { build(:my_menu_item) }
    subject { test_my_menu_item.valid? }
    context 'nameカラム' do
      let(:test_my_menu_item) { my_menu_item }
      it '空欄でないこと' do
        test_my_menu_item.name = ''
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_my_menu_item.name = Faker::Lorem.characters(number:51)
        is_expected.to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'MyMenuモデルとの関係' do
      it 'N:1となっている' do
        expect(MyMenuItem.reflect_on_association(:my_menu).macro).to eq :belongs_to
      end
    end

  end
end
