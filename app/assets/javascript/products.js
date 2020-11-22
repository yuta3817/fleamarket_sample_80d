$(function(){
  
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<label class="Listing__Main__ListingImage__picture__field"
                    for="product_product_images_attributes_${num}_image">
                    <div data-index="${num}" class="js-file_group">
                      <input class="file-field js-file" type="file"
                      name="product[product_images_attributes][${num}][image]"
                      id="product_product_images_attributes_${num}_image"><br>
                      こちらをクリックして画像アップロードしてください
                    </div>
                  </label>`;
    return html;
  }
  // 6個目の画像が投稿できないよう隠す
  const buildhiddenFileField = (num)=> {
    const html = `<label class="Listing__Main__ListingImage__picture__field"
                    for="product_product_images_attributes_${num}_image">
                    <div data-index="${num}" class="js-file_group hidden-input">
                      <input class="file-field js-file" type="file"
                      name="product[product_images_attributes][${num}][image]"
                      id="product_product_images_attributes_${num}_image"><br>
                      こちらをクリックして画像アップロードしてください
                    </div>
                  </label>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="preview">
                    <div class="img_box" data-index="${index}">
                      <img data-index="${index}" src="${url}" class="preview_image">
                      <div class="js-remove">削除</div>
                    </div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    
    const targetIndex = $(this).parent().data('index');
    
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // インプットが5以上にならないよう
    if ($('.js-file').length == 5 ) {
      $('.Listing__Main__ListingImage__picture__field').addClass("hidden-class");
      $('.previews').append(buildImg(targetIndex, blobUrl));
      // 6個目の画像インプットできないよう隠す用のインプットボタン
      $('.previews').append(buildhiddenFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);

    } else {  // 新規画像追加の処理
      $('.Listing__Main__ListingImage__picture__field').addClass("hidden-class");
      $('.previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.previews').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    // プレビュー画像消す
    $(this).parent().parent().remove();
    
    // 同じindexのfield_forを消す
    $($(`div[data-index="${targetIndex}"]`)[0]).parent().remove();

    // 隠していた画像選択ボタンがあれば表示させる
    $(".hidden-input").removeClass("hidden-input");

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  // product編集ページ開いた時に動作
  if(document.URL.match(/products/) && document.URL.match(/edit/)){

    // DBから呼び出した画像のfield_forを隠す
    $('.Listing__Main__ListingImage__picture__field').addClass("hidden-class");
    // 入力用フォーム追加
    $('.previews').append(buildFileField(fileIndex[0]));
    // 使った数字に1をたす
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  }
});