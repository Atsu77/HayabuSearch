# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    FactoryBot.create(:tag)
  end

  describe '正常系の機能' do
    let(:tag) { Tag.first }
    it 'タグが登録できること' do
      expect(tag).to be_valid
      expect(tag.tag_name).to eq('Google')
    end
  end

  describe 'Tag登録の条件' do
    let(:tag) { Tag.first }
    context '文字の大きさの条件' do
      it '30文字より大きいと登録できないこと' do
        tag.tag_name = 'a' * 31
        expect(tag).not_to be_valid
        expect(tag.errors.full_messages).to include('Tag nameは30文字以内で入力してください')
      end

      it '30文字以下であれば登録できること' do
        tag.tag_name = 'a' * 30
        expect(tag).to be_valid
      end
    end
  end
end
