$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <label class="img_upload" for="product_images_attributes_${num}_image">
                      <span>画像を選択</span>
                      <input class="js-file" type="file"
                      name="product[images_attributes][${num}][image]"
                      id="product_images_attributes_${num}_image"><br>
                    </label>
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="230px" height="230px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else if($(`.js-file`).length < 4) {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.file_groups').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    } else if($(`.js-file`).length == 4){
      // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
    } else {
      ;
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });


  $(function() {
    $('#new_product').on('submit', function(e){
      flag = 0;
      if(document.getElementById('product_images_attributes_0_image').value == "" ){
        flag = 6;
      }
      if(document.getElementById('product_price').value == "" ){
        flag = 5;
      }
      if(document.getElementById('product_sending').value == "" ){
        flag = 4;
      }
      if(document.getElementById('category_select').value == "" ){
        flag = 3;
      }
      if(document.getElementById('product_description').value == "" ){
        flag = 2;
      }
      if(document.getElementById('product_name').value == "" ){
        flag = 1;
      }
      if(flag == 1){
        window.alert( '商品名を入力してください。' );
        return false;
      }else if(flag == 2){
        window.alert( '商品説明を入力してください。' );
        return false;
      }else if(flag == 3){
        window.alert( 'カテゴリーを選んでください。' );
        return false;
      }else if(flag == 4){
        window.alert( '発送日の目安を入力してください。' );
        return false;
      }else if(flag == 5){
        window.alert( '商品の値段を入力してください。' );
        return false;
      }else if(flag == 6){
        window.alert( '商品の画像を最低1枚入力してください。' );
        return false;
      }else{
        return true;
      }
    });
  });

});