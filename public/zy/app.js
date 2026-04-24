function is_weixin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}

function downios(url) {
    if (is_weixin()) {
        var winHeight = typeof window.innerHeight != "undefined" ? window.innerHeight : document.documentElement.clientHeight;
        //兼容IOS，不需要的可以去掉
        var tip = document.getElementById("ios-weixin-tip");
        tip.style.height = winHeight + "px";
        //兼容IOS弹窗整屏
        tip.style.display = "block";
        tip.onclick = function () {
            tip.style.display = "none";
        }
    } else {
        window.location.href = url;
        return;
    }
}