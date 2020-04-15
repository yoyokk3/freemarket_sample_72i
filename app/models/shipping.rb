class Shipping < ActiveHash::Base
  self.data = [
      {id: 1, name: '簡単フリマパック(日本郵便)'}, {id: 2, name: '簡単フリマパック(ヤマト運輸)'},
      {id: 3, name: 'レターパックライト'},{id: 4, name: 'レターパックプラス'},{id: 5, name: 'クリックポスト'},
      {id: 6, name: '宅急便コンパクト'},{id: 7, name: 'ゆうパック元払い'},{id: 8, name: 'ヤマト宅急便'},
      {id: 9, name: 'ゆうパケット'},{id: 10, name: 'ゆうメール元払い'},{id: 11, name: 'スマートレター'},
      {id: 12, name: '普通郵便'},{id: 13, name: 'ヤマト便'}
  ]
end