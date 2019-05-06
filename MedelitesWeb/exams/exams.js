// alert(1);


function checklogin(){
    var user = JSON.parse(localStorage.getItem('user'))
    if(user){
        var time = new Date();
    if(time.getTime()  > user.time){
        alert('登录验证已超时，请重新登录');
        localStorage.removeItem('user');
        location.href = 'index.html';
        $('.login-wrap').show();
    }else{
        // $('#session').show();
        // $('#user').html(user.username);
        
    }
    }else{
        alert('登录验证已超时，请重新登录');
        location.href = '../index.html';
        // $('.login-wrap').show();
    }
    
}
checklogin();
consttestID = 0; 
gettest();

arrquestion = [];
function gettest(){
    var testID = getUrlParam('testID');
    consttestID = testID;
    
    var data = {
        'testID':testID
    }
  
    ajax('gettest',data,function(res){
        var tatolscore = 0;
        $('.rt_content_tt_radio i').html(res.radio.length);
        $('.test_content_title_radio .content_lit').html(res.radio.length);
        for(var p = 0 ; p < res.radio.length; p++){
            tatolscore = parseInt(tatolscore) + parseInt(res.radio[p].score)
        }
        $('.test_content_title_radio .content_fs').html(tatolscore);
        for(var i = 0 ; i < res.radio.length; i++){
            // var str = 
            
            if(res.radio.length == 0){
                $('.answerSheet_radio_word').css('display','block');

                
            }else{
                $('.answerSheet_radio ul').append(
                    "<li><a href='#qu_0_"+i+"'>"+(i+1)+"</a></li>"
                );
            }
            
            $('.test_radio .test_radio_div').append(
                "<li id='qu_0_"+i+"' class='div'>"
                +"<div class='test_content_nr_tt'>"
                +"    <i>"+(i+1)+"</i><span>("+res.radio[i].score+"分)</span><font>"+res.radio[i].question+"</font>"
                +"    <input type='hidden' class='answer' value='"+res.radio[i].right_answer+"'/>"
                +"    <input type='hidden' class='choice' value=''/>"
                +"    <input type='hidden' class='scroediv' value='"+res.radio[i].score+"'/>"
                +"    <input type='hidden' class='questionID' value='"+res.radio[i].questionID+"'/>"
                +"    <input type='hidden' class='testID' value='"+res.test[0].testID+"'/>"
                +"    <input type='hidden' class='type' value='"+res.radio[i].type+"'/>"
                +"    <img src='../image/jiexi.png' class='jiexi' style='display:none' onclick='alert(\""+res.radio[i].jiexi+"\")' />"
                +"</div>"
                +"<div class='test_content_nr_main'>"
                +"    <ul>"
                +"        <li class='option option1' style='display:none'>"
                +"            <input type='radio' class='radioOrCheck'  name='answer"+(i+1)+"' id='0_answer_"+(i+1)+"_option_1' />"
                +"            <label for='0_answer_"+(i+1)+"_option_1'>A.<p class='ue' style='display: inline;'>"+res.radio[i].choiceA+"</p></label>"
                +"        </li>"
                +"        <li class='option option2' style='display:none'>"
                +"            <input type='radio' class='radioOrCheck'  name='answer"+(i+1)+"' id='0_answer_"+(i+1)+"_option_2' />"
                +"            <label for='0_answer_"+(i+1)+"_option_2'>B.<p class='ue' style='display: inline;'>"+res.radio[i].choiceB+"</p></label>"
                +"        </li>"
                +"        <li class='option option3' style='display:none'>"
                +"            <input type='radio' class='radioOrCheck' name='answer"+(i+1)+"' id='0_answer_"+(i+1)+"_option_3' />"
                +"            <label for='0_answer_"+(i+1)+"_option_3'>C.<p class='ue' style='display: inline;'>"+res.radio[i].choiceC+"</p></label>"
                +"        </li>"
                +"        <li class='option option4' style='display:none'>"
                +"            <input type='radio' class='radioOrCheck' name='answer"+(i+1)+"' id='0_answer_"+(i+1)+"_option_4' />"
                +"            <label for='0_answer_"+(i+1)+"_option_4'>D.<p class='ue' style='display: inline;'>"+res.radio[i].choiceD+"</p></label>"
                +"        </li>"
                +"        <li class='option option5' style='display:none'>"
                +"            <input type='radio' class='radioOrCheck' name='answer"+(i+1)+"' id='0_answer_"+(i+1)+"_option_5' />"
                +"            <label for='0_answer_"+(i+1)+"_option_5'>E.<p class='ue' style='display: inline;'>"+res.radio[i].choiceE+"</p></label>"
                +"        </li>"
                +"        <li class='option option6' style='display:none'>"
                +"            <input type='radio' class='radioOrCheck' name='answer"+(i+1)+"' id='0_answer_"+(i+1)+"_option_6' />"
                +"            <label for='0_answer_"+(i+1)+"_option_6'>F.<p class='ue' style='display: inline;'>"+res.radio[i].choiceF+"</p></label>"
                +"        </li>"
                    
                +"    </ul>"
                +"</div>"
                +"    </li>    "
            )
            for(var j = 0 ; j < 6 ; j++){
                // var textcontent = "";
                textcontent = $('#qu_0_'+i+' .option'+(j+1)+' p').html();
        
                if(textcontent != "null" && textcontent != ""){
                   
                    $('#qu_0_'+i+' .option'+(j+1)).css('display','block')
                }
            }
            
            
        }
       var totalscorecheckbox = 0;
       for(var b = 0 ; b < res.checkbox.length; b++){
        totalscorecheckbox = parseInt(totalscorecheckbox) + parseInt(res.checkbox[b].score)
    }
        for(var a = 0 ; a < res.checkbox.length; a++){
            // var str = 
            
            if(res.checkbox.length == 0){
                $('.answerSheet_checkbox_word').css('display','block');

                
            }else{
                $('.answerSheet_checkbox ul').append(
                    "<li><a href='#qu_1_"+a+"'>"+(a+1)+"</a></li>"
                );
            }
        }
        $('.test_content_checkbox .content_lit').html(res.checkbox.length);
        $('.test_content_checkbox .content_fs').html(totalscorecheckbox);
        // $('li.option label').on('click',function(){
            
        // })
        for(var c = 0 ; c < res.checkbox.length ; c++){
            $('.test_content_nr_div').append(
                " <li id='qu_1_"+c+"' class='div_checkbox'>"
                +"<div class='test_content_nr_tt'>"
                +"<input type='hidden' class='answer_checkbox' value='"+res.checkbox[c].right_answer+"'>"
                +"<input type='hidden' class='choice_checkbox' value=''>"
                +"<input type='hidden' class='score_checkbox' value='"+res.checkbox[c].score+"'>"
                +"<input type='hidden' class='questionID_checkbox' value='"+res.checkbox[c].questionID+"'>"
                +"    <input type='hidden' class='testID' value='"+res.test[0].testID+"'/>"
                +"    <input type='hidden' class='type' value='"+res.checkbox[c].type+"'/>"
                +"    <i>"+(c+1)+"</i><span>("+res.checkbox[c].score+"分)</span><font>"+res.checkbox[c].question+"</font>"
                +"    <img src='../image/jiexi.png' style='display:none' class='jiexi' onclick='alert(\""+res.checkbox[c].jiexi+"\")' />"
                +"</div>"
    
                +"<div class='test_content_nr_main'>"
                +"    <ul class='test_content_nr_main_checkbox'>"
    
                +"        <li class='option option1'  style='display:none'>"
    
    
                +"            <input type='checkbox' class='radioOrCheck' name='answer"+(c+1)+"'"
                +"                   id='1_answer_"+(c+1)+"_option_1' />"
    
                +"            <label for='1_answer_"+(c+1)+"_option_1'>"
                +"                A."
                +"                <p class='ue' style='display: inline;'>"+res.checkbox[c].choiceA+"</p>"
                +"            </label>"
                +"        </li>"
    
                +"        <li class='option option2' style='display:none'>"
    
    
                +"            <input type='checkbox' class='radioOrCheck' name='answer"+(c+1)+"'"
                +"                   id='1_answer_"+(c+1)+"_option_2' />"
    
                +"            <label for='1_answer_"+(c+1)+"_option_2'>"
                +"                B."
                +"                <p class='ue' style='display: inline;'>"+res.checkbox[c].choiceB+"</p>"
                +"            </label>"
                +"        </li>"
                +"        <li class='option option3' style='display:none'>"
    
    
                +"            <input type='checkbox' class='radioOrCheck' name='answer"+(c+1)+"'"
                +"                   id='1_answer_"+(c+1)+"_option_3' />"
    
                +"            <label for='1_answer_"+(c+1)+"_option_3'>"
                +"                C."
                +"                <p class='ue' style='display: inline;'>"+res.checkbox[c].choiceC+"</p>"
                +"            </label>"
                +"        </li>"
                +"        <li class='option option4' style='display:none'>"
    
    
                +"            <input type='checkbox' class='radioOrCheck' name='answer"+(c+1)+"'"
                +"                   id='1_answer_"+(c+1)+"_option_4' />"
    
                +"            <label for='1_answer_"+(c+1)+"_option_4'>"
                +"                D."
                +"                <p class='ue' style='display: inline;'>"+res.checkbox[c].choiceD+"</p>"
                +"            </label>"
                +"        </li>"
                +"        <li class='option option5' style='display:none'>"
    
    
                +"            <input type='checkbox' class='radioOrCheck' name='answer"+(c+1)+"'"
                +"                   id='1_answer_"+(c+1)+"_option_5' />"
    
                +"            <label for='1_answer_"+(c+1)+"_option_5'>"
                +"                E."
                +"                <p class='ue' style='display: inline;'>"+res.checkbox[c].choiceE+"</p>"
                +"            </label>"
                +"        </li>"
                +"        <li class='option option6' style='display:none'>"
    
    
                +"            <input type='checkbox' class='radioOrCheck' name='answer"+(c+1)+"'"
                +"                   id='1_answer_"+(c+1)+"_option_6' />"
    
                +"            <label for='1_answer_"+(c+1)+"_option_6'>"
                +"                F."
                +"                <p class='ue' style='display: inline;'>"+res.checkbox[c].choiceF+"</p>"
                +"            </label>"
                +"        </li>"
               
                +"    </ul>"
                +"</div>"
            +"</li>"
            );
            for(var d = 0 ; d < 6 ; d++){
                // var textcontent = "";
                textcontent = $('#qu_1_'+c+' .option'+(d+1)+' p').html();
        
                if(textcontent != "null" && textcontent != ""){
                   
                    $('#qu_1_'+c+' .option'+(d+1)).css('display','block')
                }
            }
        }
        
       


        $('.alt-1').html(res.test[0].time);
        $('.alt-2').html(res.test[0].time);
       
        window.jQuery(function ($) {
            "use strict";

            $('time').countDown({
                with_separators: false
            });
            $('.alt-1').countDown({
                css_class: 'countdown-alt-1'
            });
            $('.alt-2').countDown({
                css_class: 'countdown-alt-2'
            });

        });
        $('li.option').click(function () {
  
            var arr = {
                1:"A",
                2:"B",
                3:"C",
                4:"D",
                5:"E",
                6:"F"
            }
            var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
            var choice = $(this).parents('.div').find('.choice'); // 得到题目ID

            var choice_checkbox = $(this).parents('.div_checkbox').find('.choice_checkbox'); // 得到题目ID

            var choice_checkbox_div = $(this).parents('.div_checkbox').find('.test_content_nr_main .radioOrCheck');
            var type = $(this).parents('.div').find('.type').val();
            var choiceindex = $(this).index();
            if(type == 'radio'){
                choice.val(arr[choiceindex+1])
                var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
            // 设置已答题
            if (!cardLi.hasClass('hasBeenAnswer')) {
                cardLi.addClass('hasBeenAnswer');
            }
            }else{
                var choice_answer = '';
                 
                 choice_checkbox_div.each(function(index,item){
                    if($(this).is(":checked")){
                        choice_answer = choice_answer + arr[index+1]
                        choice_checkbox.val(choice_answer);
                     
           
                    }
                    
                })
                var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
                // 设置已答题
                if (choice_answer != '') {
                    cardLi.addClass('hasBeenAnswer');
                }else{
                    cardLi.removeClass('hasBeenAnswer');
                }
            }
               
               
           
            
            
            
            

        });
        
    })
}   
function j(){
    var obj = $('.answerSheet_radio ul li a');
    obj.each(function(){
        if(!$(this).hasClass('hasBeenAnswer')){
            if(confirm('您有未完成题目，是否确定提交？')){
                alert('提交成功,等待分析答案');
                
                $('.alt-1').html("00:00:00");
                $('.alt-2').html("00:00:00");
                $('.radioOrCheck').attr('disabled','disabled');
                $('.jiexi').css("display","block");
                checkanswer();
                $('.score').show();
                $('li.option').unbind('click');
                $('.jiaojuan').unbind('click')
                return false;
            }else{
                return false;
            }
        }else{
            if(confirm('是否确定提交试卷?')){
                alert('提交成功,等待分析答案');
                
                $('.alt-1').html("00:00:00");
                $('.alt-2').html("00:00:00");
                $('.radioOrCheck').attr('disabled','disabled');
                $('.jiexi').css("display","block");
                checkanswer();
                $('.score').show();
                $('li.option').unbind('click');
                $('.jiaojuan').unbind('click')
                return false;
            }else{
                return false;
            }
        }
    })
}
function checkanswer(){
    var obj = $('.test_radio_div .test_content_nr_tt');
    var totalscore = 0;
    var totalscore3 = 0;
    arrquestion = [];
    obj.each(function(index,item){
        var score = $(this).find('.scroediv').val();
       
        var answer = $(this).find('.answer');
        var examId = $(this).parents('li').attr('id');
        var cardLi = $('a[href=#' + examId + ']');
        var questionID = $(this).find('.questionID');
     
        var choice = $(this).find('.choice');
        if(answer.val() == choice.val()){
            score = parseInt(score);
            cardLi.attr('class',"");
            cardLi.addClass('right');

        }else{
            score = 0;
            cardLi.attr('class',"");
            cardLi.addClass('wrong');
            arrquestion.push(questionID.val());
        }
        totalscore = totalscore + score;
        
    });

    var obj_checkbox = $('.test_content_nr_div .test_content_nr_tt');
    var totalscore_checkbox = 0;
    
    obj_checkbox.each(function(index,item){
        var score_checkbox = $(this).find('.score_checkbox').val();
       
        var answer_checkbox = $(this).find('.answer_checkbox');
        var examId_checkbox = $(this).parents('li').attr('id');
        var cardLi_checkbox = $('a[href=#' + examId_checkbox + ']');
        var questionID_checkbox = $(this).find('.questionID_checkbox');
     
        var choice_checkbox = $(this).find('.choice_checkbox');
        if(answer_checkbox.val() == choice_checkbox.val()){
            score_checkbox = parseInt(score_checkbox);
            cardLi_checkbox.attr('class',"");
            cardLi_checkbox.addClass('right');

        }else{
            score_checkbox = 0;
            cardLi_checkbox.attr('class',"");
            cardLi_checkbox.addClass('wrong');
            arrquestion.push(questionID_checkbox.val());
        }
        totalscore_checkbox = totalscore_checkbox + score_checkbox;
        
        
    });
    
    
    totalscore3 = totalscore_checkbox + totalscore
    
    $('.score .num').html(totalscore3);
    
}

function recordtest(testID,score,time,answer){
    
}   

$('.collectbotton').click(function(){
    // var obj = $('.test_radio_div .test_content_nr_tt');
    
    
    var data  = {
        'userID':getusername(),
        'testID':consttestID,
        'arr':JSON.stringify(arrquestion),
        'amount':arrquestion.length
    } 
    ajax('collectquestion',data,function(res){
        alert('收集成功');
        $('.collectbotton').unbind('click');
        
    })
})