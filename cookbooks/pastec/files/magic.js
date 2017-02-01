// magic.js
function reqListener () {
  var oReq2 = new XMLHttpRequest();
  oReq2.open("DELETE", "/index/images/50");
  oReq2.send();//this.responseText);
}

var oReq = new XMLHttpRequest();
oReq.addEventListener("load", reqListener);
oReq.open("GET", "dray_photo.jpg", false);
oReq.overrideMimeType("application/octet-stream");
oReq.send();
