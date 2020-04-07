//日期转换
function getDate(timestamp) {
    // timestamp是整数，否则要parseInt转换
    var time = new Date(timestamp);
    var y = time.getFullYear();
    var m = time.getMonth() + 1;
    var d = time.getDate();
    return y + '-' + m + '-' + d;
}

// 时间戳转换
function getDateTime(timestamp) {
    // timestamp是整数，否则要parseInt转换
    var time = new Date(timestamp);
    var y = time.getFullYear();
    var m = time.getMonth() + 1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    if (h < 10) {
        h = '0' + h;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    if (s < 10) {
        s = '0' + s;
    }
    return y + '-' + m + '-' + d + ' ' + h + ':' + mm + ':' + s;
}