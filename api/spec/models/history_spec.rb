# == Schema Information
#
# Table name: histories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_histories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    FactoryBot.create(:history_yamada_1)
  end

  describe '正常系の機能' do
    context 'urlを登録する' do
      it '正しく登録できること' do
        history = History.first
        expect(history.url).to eq('https://google.com')
        expect(history.title).to eq('Google')
        expect(history.user.name).to eq('山田太郎')
        expect(history).to be_valid
      end
    end

    describe 'History登録の条件' do
      let(:history_yamada_1) { History.first }

      context '存在性の確認' do
        it 'urlがないと登録できないこと' do
          history_yamada_1.url = ''
          expect(history_yamada_1).not_to be_valid
          expect(history_yamada_1.errors.full_messages).to include('Urlを入力してください' && 'Urlは不正な値です')
          expect(history_yamada_1.save).to be_falsey
        end

        it 'titleがないと登録できないこと' do
          history_yamada_1.title = ''
          expect(history_yamada_1).not_to be_valid
          expect(history_yamada_1.errors.full_messages).to include('Titleを入力してください')
          expect(history_yamada_1.save).to be_falsey
        end
      end

      context 'urlのフォーマットの検証' do
        it 'urlにはhttpかhttpsが含まれること' do
          history_yamada_1.url = 'htt://google.com'
          expect(history_yamada_1).not_to be_valid
          expect(history_yamada_1.errors.full_messages).to include('Urlは不正な値です')
          expect(history_yamada_1.save).to be_falsey
        end
      end

      context '文字の長さの検証' do
        it 'titleは100文字より大きいと登録できないこと' do
          history_yamada_1.title = 'a' * 101
          expect(history_yamada_1).not_to be_valid
          expect(history_yamada_1.errors.full_messages).to include('Titleは100文字以内で入力してください')
          expect(history_yamada_1.save).to be_falsey
        end
        it 'titleは100文字以下であれば登録できること' do
          history_yamada_1.title = 'a' * 100
          expect(history_yamada_1).to be_valid
          expect(history_yamada_1.save).to be_truthy
        end
      end
    end
  end
end
