// DOM読み込みが完了したら実行
document.addEventListener('DOMContentLoaded', (e) => {
  // 公開鍵を登録し、起点となるオブジェクトを取得します
  var payjp = Payjp('pk_test_d6ab5eda0ad632f2e194459f')

  // elementsを取得します。ページ内に複数フォーム用意する場合は複数取得ください
  var elements = payjp.elements()

  // styleの指定
  var style = {
    base: {
      color: '#198fcc',
      '::placeholder': {
        fontStyle: 'italic',
        color: 'green',
      }
    },
    invalid: {
      color: 'red',
    }
  }

  // element(入力フォームの単位)を生成します
  var numberElement = elements.create('cardNumber', {style: style})
  var expiryElement = elements.create('cardExpiry', {style: style})
  var cvcElement = elements.create('cardCvc', {style: style})
  // elementをDOM上に配置します
  numberElement.mount('#number-form')
  expiryElement.mount('#expiry-form')
  cvcElement.mount('#cvc-form')
  
  // ボタンが押されたらtokenを生成する関数を用意します
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