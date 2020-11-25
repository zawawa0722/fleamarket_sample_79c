$(function(){
  
  $("#image-box").on("change", "#product_images_attributes_0_image", function(e) {
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
  
    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
  
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img0").attr("src", e.target.result);
        $("#img0").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  
  });

  $("#image-box").on("change", "#product_images_attributes_1_image", function(e) {
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
  
    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
  
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $("#image-box").on("change", "#product_images_attributes_2_image", function(e) {
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
  
    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
  
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img2").attr("src", e.target.result);
        $("#img2").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $("#image-box").on("change", "#product_images_attributes_3_image", function(e) {
    //ファイルオブジェクトを取得する
    console.log(this);
    var file = e.target.files[0];
    var reader = new FileReader();
  
    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
  
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img3").attr("src", e.target.result);
        $("#img3").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });  

});