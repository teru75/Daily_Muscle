require 'rails_helper'

RSpec.describe 'EventTemplateモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:event_template) { build(:event_template) }
    
    context 'partカラム' do
      it '空欄でないこと' do
        event_template.part = ''
        expect(event_template.valid?).to eq false;
      end
    end

    context 'themeカラム' do
      it '空欄でないこと' do
        event_template.theme = ''
        expect(event_template.valid?).to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'MenuTemplateモデルとの関係' do
      it '1:Nとなっている' do
        expect(EventTemplate.reflect_on_association(:menu_templates).macro).to eq :has_many
      end
    end

  end
end
