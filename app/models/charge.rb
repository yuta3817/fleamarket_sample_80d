class Charge < ActiveHash::Base
  self.data = [
      {id: 1, name: '無し（発送元負担）'},
      {id: 2, name: '有り（お客様負担）'},
  ]
end