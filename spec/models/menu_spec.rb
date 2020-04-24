require 'rails_helper'

RSpec.describe 'Menuモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:event) { create(:event) }
    let!(:menu) { build(:menu, event_id: event.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        menu.name = ''
        expect(menu.valid?).to eq false;
      end

      it '50文字以下であること' do
        menu.name = Faker::Lorem.characters(number:51)
        expect(menu.valid?).to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'Repモデルとの関係' do
      it '1:Nとなっている' do
        expect(Menu.reflect_on_association(:reps).macro).to eq :has_many
      end
    end

    context 'Eventモデルとの関係' do
      it 'N:1となっている' do
        expect(Menu.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end

  end
end
