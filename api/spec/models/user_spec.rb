require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    FactoryBot.create(:user_yamada)
    FactoryBot.create(:user_satou)
  end

  describe '正常系の機能' do
    it 'ユーザーの登録' do
      user = User.first
      expect(user.name).to eq('山田太郎')
      expect(user.email).to eq('yamada@example.com')
      expect(user).to be_valid
    end
  end

  describe 'ユーザー登録の条件' do
    let(:yamada) { User.first }
    let(:satou) { User.find_by(name: '佐藤花子') }
    context '存在性の確認' do
      it 'ユーザーの名前がないと登録できないこと' do
        yamada.name = ''
        expect(yamada).not_to be_valid
      end
    end

    context '重複の確認' do
      it 'ユーザー名が重複しても登録できること' do
        satou.name = '山田太郎'
        expect(satou).to be_valid
      end
      it 'メールアドレスが重複しなければ登録できること' do
        expect(satou).to be_valid
      end
      it 'メールアドレスが重複すると登録できないこと' do
        satou.email = 'yamada@example.com'
        expect(satou).not_to be_valid
        expect(satou.errors[:email]).to include('はすでに存在します')
      end
    end

    context 'emailのフォーマットの確認' do
      it 'メールアドレスに@が含まれていなければ登録できないこと' do
        yamada.email = 'yamada.example.com'
        expect(yamada).not_to be_valid
      end
    end

    context '文字の長さの検証' do
      it 'ユーザー名が30文字以下であれば登録できること' do
        yamada.name = 'a' * 30
        expect(yamada).to be_valid
      end
      it 'ユーザー名が30文字より大きければであれば登録できないこと' do
        yamada.name = 'a' * 31
        expect(yamada).not_to be_valid
      end
    end
  end
end
