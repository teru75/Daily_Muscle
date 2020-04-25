require 'rails_helper'

RSpec.describe 'MyMenuItemモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:my_menu) { create(:my_menu) }
    let!(:my_menu_item) { build(:my_menu_item, my_menu_id: my_menu.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        my_menu_item.name = ''
        expect(my_menu_item.valid?).to eq false;
      end
      it '50文字以下であること' do
        my_menu_item.name = Faker::Lorem.characters(number:51)
        expect(my_menu_item.valid?).to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'MyMenuモデルとの関係' do
      it 'N:1となっている' do
        expect(MyMenuItem.reflect_on_association(:my_menu).macro).to eq :belongs_to
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(MyMenuItem.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

  end
end
