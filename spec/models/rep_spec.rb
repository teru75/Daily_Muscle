require 'rails_helper'

RSpec.describe 'Repモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:rep) { build(:rep) }
    subject { test_rep.valid? }
    context 'nameカラム' do
      let(:test_rep) { rep }
      it '空欄でないこと' do
        test_rep.weight = ''
        is_expected.to eq false;
      end
    end

    context 'countカラム' do
      let(:test_rep) { rep }
      it '空欄でないこと' do
        test_rep.count = ''
        is_expected.to eq false;
      end
    end

    context 'set_countカラム' do
      let(:test_rep) { rep }
      it '空欄でないこと' do
        test_rep.set_count = ''
        is_expected.to eq false;
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
