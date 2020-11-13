$(function() {
  $('#cardCreateForm').on('submit', function(e) {
    e.preventDefault()
    var form = $("#cardCreateForm");
    // Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    Payjp.setPublicKey("pk_test_94ce8c98bfdbf3ebe7d41251");
    var card = {
      number: document.getElementById("card-number").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
      cvc: document.getElementById("cvc").value
    };
    // console.log(card)
    if (card.number == "" || card.cvc == "") {
      alert("入力もれがあります");
    } else {
      Payjp.createToken(card, function(status, response) {
        if (status === 200 ) {
          $("#card-number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          var token = response.id;
          form.append($('<input type="hidden" name="payjpToken"/>').val(token))
          $('#cardCreateForm').get(0).submit();
          alert("登録に成功しました");
        } else {
          alert("カード情報が正しくありません");
        }
      });
    }
  });
});