// DOM読み込みが完了したら実行
document.addEventListener('DOMContentLoaded', () => {
  // 公開鍵を登録し、起点となるオブジェクトを取得
  var payjp = Payjp('pk_test_d6ab5eda0ad632f2e194459f')
  // styleの指定
  var style = {
    base: {
      color: '#000000',
      '::placeholder': {
        fontStyle: 'italic',
        color: 'gray',
      },
    },
    invalid: {
      color: 'red',
    }
  }  
  // elementsを取得。
  var elements = payjp.elements()
  // element(入力フォームの単位)を生成
  var numberElement = elements.create('cardNumber', {style: style})
  var expiryElement = elements.create('cardExpiry', {style: style})
  var cvcElement = elements.create('cardCvc', {style: style})
  // elementをDOM上に配置
  numberElement.mount('#number-form')
  expiryElement.mount('#expiry-form')
  cvcElement.mount('#cvc-form')
  // ボタンが押されたらtokenを生成する関数を用意
  create_card.addEventListener("click", function(e) {
    e.preventDefault();
    payjp.createToken(numberElement).then(function(r) {
      if (r.error) {  // 登録失敗
        document.querySelector('#message').innerText = r.error.message
        regist_card.prop('disabled', false)
      } else {
        $("#card_token").append(
          `<input type="hidden" name="payjp_token" value=${r.id}>
          <input type="hidden" name="card_token" value=${r.card.id}>`
        );
        $("#card_form")[0].submit();
      }
    })
  });
});