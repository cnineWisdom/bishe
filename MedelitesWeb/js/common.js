var mainurl = 'http://chxz2018.iego.net/bishe/CI/index.php/Web/';
// var mainurl = 'http://localhost/bishe/CI/index.php/Web/';
function ajax(url,data,fn){
    $.ajax({
        url:mainurl+url,
        data:data,
        type:'post',
        dataType:'json',
        success:fn
    })
}
function checklogin(){
    var user = JSON.parse(localStorage.getItem('user'))
    if(user){
        var time = new Date();
    if(time.getTime()  > user.time){
        alert('登录验证已超时，请重新登录');
        localStorage.removeItem('user');
        location.href = 'http://chxz2018.iego.net/bishe/MedelitesWeb/index.html';
        // location.href = 'http://localhost/bishe/MedelitesWeb/index.html';
        $('.login-wrap').show();
    }else{
        // $('#session').show();
        // $('#user').html(user.username);
        
    }
    }else{
        alert('登录验证已超时，请重新登录');
        console.log(1);
        location.href = 'http://chxz2018.iego.net/bishe/MedelitesWeb/index.html';
        // location.href = 'http://localhost/bishe/MedelitesWeb/index.html';
        // $('.login-wrap').show();
    }
    
}
function getUrlParam(name)
{
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
var r = window.location.search.substr(1).match(reg);  //匹配目标参数
if (r!=null) return unescape(r[2]); return null; //返回参数值
} 

function getusername(){
    checklogin();
    if(localStorage.getItem('user')){
        var user = JSON.parse(localStorage.getItem('user'));
        return user.username;
    }else{
        return false;
    }
    
}

function loginout(){
    if(confirm('确定要退出吗？')){
        localStorage.removeItem('user');
        location.href = 'index.html';
    }else{
        // $('.login-wrap').show();
    }   
    
}