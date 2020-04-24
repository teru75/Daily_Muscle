require 'rails_helper'

RSpec.describe 'EventTemplateモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:event_template) { build(:event_template) }
    subject { test_event_template.valid? }
    context 'partカラム' do
      let(:test_event_template) { event_template }
      it '空欄でないこと' do
        test_event_template.part = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_event_template.part = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_event_template.part = Faker::Lorem.characters(number:51)
        is_expected.to eq false;
      end
    end

    context 'themeカラム' do
      let(:test_event_template) { event_template }
      it '空欄でないこと' do
        test_event_template.theme = ''
        is_expected.to eq false;
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
