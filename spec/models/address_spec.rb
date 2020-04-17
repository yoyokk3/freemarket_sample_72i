require 'rails_helper'

describe Address do
  describe '#create' do

    it "first_nameがない場合は登録できないこと" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "last_nameがない場合は登録できないこと" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      address = build(:address, last_name_kana: nil)
      address.valid?
      expect(address.errors[:last_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "postal_codeが無い場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "prefecturesが無い場合は登録できないこと" do
      address = build(:address, prefectures: nil)
      address.valid?
      expect(address.errors[:prefectures]).to include("を入力してください")
    end

    it "municipalityが無い場合は登録できないこと" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    it "house_numberが無い場合は登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

  end
end