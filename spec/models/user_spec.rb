require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("はパスワードと一致しません。")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "birthday_yearがない場合は登録できないこと" do
      user = build(:user, birthday_year: nil)
      user.valid?
      expect(user.errors[:birthday_year]).to include("を入力してください")
    end

    it "birthday_manthがない場合は登録できないこと" do
      user = build(:user, birthday_manth: nil)
      user.valid?
      expect(user.errors[:birthday_manth]).to include("を入力してください")
    end

    it "birthday_dayがない場合は登録できないこと" do
      user = build(:user, birthday_day: nil)
      user.valid?
      expect(user.errors[:birthday_day]).to include("を入力してください")
    end

  end
end