$(document).on('change','input[type= "file"]', function(e) {
  let reader = new FileReader();  //画像を読み込む
  let file = e.target.files[0];   //inputから1つ目のfileを取得
  reader.readAsDataURL(file);     //画像ファイルのURLを取得

  //画像読み込みが完了したらプレビュー表示
  reader.onload = function(e) {
      :
  }
});

reader.onload = function(e) {
  //imgタグ
  if ($('.preview').length <= 4) { 
    $('.previews').append(previewImages(e.target.result));
  } else {
    $('.previews_2nd_row').append(previewImages(e.target.result));
  }
  let preview_count = $('.preview').length;
  let preview_unsave_count = $('.preview_unsave').length;
  let preview_save_count = $('.preview_saved').length;
  let preview_saved_count = $('.hidden-destroy').length;
  //データの入ったinputタグ
  if (preview_count <= 5) {
    $('.up-image__group__dropbox').removeClass('up-image__group__dropbox').addClass('image-preview').appendTo('.item_imgs');
  } else {
    $('.up-image__group__dropbox').removeClass('up-image__group__dropbox').addClass('image-preview').appendTo('.item_imgs_2nd_row');
  }
  //新しいinputタグを追加
  if (preview_count <= 4) {
    $('.item_imgs').prepend(nextInput(preview_count + 1, preview_unsave_count + 1));
  } else {

 $('.item_imgs_2nd_row').prepend(nextInput(preview_count + 1, preview_unsave_count + 1));
  }
  //プレビュー画像が５枚になったら１段目inputを消し、２段目にinputを表示
  if (preview_total_num == 5) {
    $('.item_imgs').css('display', 'none');
    $('.under_group').css('display', 'block');
    $('.item_imgs_2nd_row').css('display', 'block');
  }
  //プレビュー画像が10枚になったら2段目inputを消す
  if (preview_total_num == 10) {
    $('.item_imgs_2nd_row').css('display', 'none');
  }
  //識別のための管理番号をつけ直す
  $('.preview').each(function(i) {
    $(this).attr('data-index', (i+1));
  });
  $('.preview_unsave').each(function(i) {
    $(this).attr('index', (i+1));
  });
  $('.image-preview').each(function(i) {
    $(this).attr('index', (i+1));
    $(this).attr('data-index', (preview_save_count+i+1));
    $(this).children().attr('name', "item[item_imgs_attributes][" + (preview_saved_count+i) + "][src]");
    $(this).children().attr('data-index', (i+1));
  });
}