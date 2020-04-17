$(function(){
  function appendOption(category){ 
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ 
    var childSelectHtml = '';
      childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                            <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_category" name="categories_id">
                            <option value="---" data-prefecture="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>`;
    $('.main__form__category__text__children').append(childSelectHtml);
  }
  function appendgrandChidrenBox(insertHTML){ 
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                                <div class='listing-select-wrapper__box'>
                                  <select class="listing-select-wrapper__box--select" id="grandchild_category"  name="product[categories_id]">
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
    $('.main__form__category__text__grandchildren').append(grandchildrenSelectHtml);
  }
 
  $(document).on('change', '#category_select', function(){ 
    var productcategory = document.getElementById('category_select').value; 
    if (productcategory != ''){
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){  
        var insertHTML = '';
        children.forEach(function(child){  
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
        $(document).on('change', '#category_select', function(){
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
 
  $(document).on('change', '#child_category', function(){
    var productcategory = document.getElementById('child_category').value;
    if (productcategory != ''){
     
    $.ajax ({
      url: 'category_grandchildren',
      type: 'GET',
      data: { productcategory: productcategory },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          })
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });
});