require 'rails_helper'

RSpec.describe 'MyMenuモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:customer) { create(:customer) }
    let!(:my_menu) { build(:my_menu, customer_id: customer.id) }

    context 'partカラム' do
      it '空欄でないこと' do
        my_menu.part = ''
        expect(my_menu.valid?).to eq false;
      end
    end
    
  end
  describe 'アソシエーションのテスト' do
    context 'MyMenuItemモデルとの関係' do
      it '1:Nとなっている' do
        expect(MyMenu.reflect_on_association(:my_menu_items).macro).to eq :has_many
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(MyMenu.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

  end
end
