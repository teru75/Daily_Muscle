require 'rails_helper'

RSpec.describe 'Repモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗


  describe 'バリデーションのテスト' do
    let(:menu) { create(:menu) }
    let!(:rep) { build(:rep, menu_id: menu.id) }

    context 'weightカラム' do
      it '空欄でないこと' do
        rep.weight = ''
        expect(rep.valid?).to eq false;
      end
    end

    context 'countカラム' do
      it '空欄でないこと' do
        rep.count = ''
        expect(rep.valid?).to eq false;
      end
    end

    context 'set_countカラム' do
      it '空欄でないこと' do
        rep.set_count = ''
        expect(rep.valid?).to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'Menuモデルとの関係' do
      it 'N:1となっている' do
        expect(Rep.reflect_on_association(:menu).macro).to eq :belongs_to
      end
    end

  end
end
