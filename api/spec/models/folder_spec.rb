# == Schema Information
#
# Table name: folders
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_folders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Folder, type: :model do
  before do
    FactoryBot.create(:folder)
  end
  describe '正常系の機能' do
    let(:folder) {Folder.first}
    it '登録できること' do
      expect(folder).to be_valid
      expect(folder.name).to eq('YouTube')
    end
  end

  describe 'folder登録の条件' do
    let(:folder){Folder.first}
    context '文字の大きさの条件' do
      it '30文字より大きいと登録できないこと' do
        folder.name = 'a'*31
        expect(folder).not_to be_valid
        expect(folder.errors.full_messages).to include('Nameは30文字以内で入力してください')
      end
      it '30文字以下であれば登録できること' do
        folder.name = 'a'*30
        expect(folder).to be_valid
      end
    end
  end

end
