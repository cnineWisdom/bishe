// var mainurl = 'http://chxz2018.iego.net/bishe/CI/index.php/Web/';
var mainurl = 'http://localhost:8080/bishe/CI/index.php/Web/';
function ajax(url,data,fn){
    $.ajax({
        url:mainurl+url,
        data:data,
        type:'post',
        // async:false,
        dataType:'json',
        success:fn
    })
}