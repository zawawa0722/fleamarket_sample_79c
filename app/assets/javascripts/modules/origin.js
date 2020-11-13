$(function() {
  var imglist = new Array(
    {"src":"/red.png","width": 80, "height": 110 },
    {"src":"/blue.png","width": 80, "height": 110 },
    {"src":"/yellow.png","width": 80, "height": 110 },
    );
    var selectnum = Math.floor(Math.random() * imglist.length);
    var output = "<img src='" + imglist[selectnum].src + "' width='"+ imglist[ selectnum ].width+ "' height='"+ imglist[ selectnum ].height+ "'>";
    document.write(output);
});