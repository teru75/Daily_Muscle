require 'rails_helper'

RSpec.describe 'MenuTemplateモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:event_template) { create(:event_template) }
    let!(:menu_template) { build(:menu_template, event_template_id: event_template.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        menu_template.name = ''
        expect(menu_template.valid?).to eq false;
      end

      it '50文字以下であること' do
        menu_template.name = Faker::Lorem.characters(number:51)
        expect(menu_template.valid?).to eq false;
      end
    end

  end

  describe 'アソシエーションのテスト' do
    context 'EventTemPlateモデルとの関係' do
      it 'N:1となっている' do
        expect(MenuTemplate.reflect_on_association(:event_template).macro).to eq :belongs_to
      end
    end

  end
end
