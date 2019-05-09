[1mdiff --cc MedelitesWeb/information/information3_1.html[m
[1mindex 1a7cb73,a9b1547..0000000[m
[1m--- a/MedelitesWeb/information/information3_1.html[m
[1m+++ b/MedelitesWeb/information/information3_1.html[m
[36m@@@ -117,16 -138,12 +137,20 @@@[m [mfunction gettestdata(page)[m
          // console.log(res)[m
          $.each(res.res,function(k,v){[m
              $('#pptDiv').append([m
[32m++<<<<<<< HEAD[m
[32m +                "<li class='item'><p data-index = '"+v.inform_ID+"' id = 'pptP"+k+"'>&#10084;</p><div class='pic'><a href='"+v.inform_info+"' target='_blank'><img class='lazy' style='float: left' src='"+v.titleUrl+"' width='240' height='180' alt='ppt' data-url='"+v.titleUrl+"'></a></div><div class='txt'><a href='"+v.inform_info+"' target='_blank'>"+v.inform_Name+"</a></div></li>"[m
[32m++=======[m
[32m+                 "<li class='item'><p data-index = '"+v.inform_ID+"'>&#10084;</p><div class='div'></div><div class='pic'><a href='"+v.inform_info+"' target='_blank'><img class='lazy' style='float: left' src='"+v.titleUrl+"' width='240' height='180' alt='ppt' data-url='"+v.titleUrl+"'></a></div><div class='txt'><a href='"+v.inform_info+"' target='_blank'>"+v.inform_Name+"</a></div></li>"[m
[32m++>>>>>>> 9d4f48082ce257af533ce51315faaca064a9c611[m
              )[m
[31m -            if(v.flag ==1){[m
[31m -                $('#pptDiv li p').attr('class','collect cs')[m
[32m +            console.log(12345665)[m
[32m +            if(v.flag == 1 ){[m
[32m +                [m
[32m +                $('#pptP'+k).attr('class','collect cs')[m
              }else{[m
[31m -                $('#pptDiv li p').attr('class','collect')[m
[32m +                [m
[32m +[m
[32m +                $('#pptP'+k).attr('class','collect')[m
              }[m
          })[m
          for(var i =0 ;i < res.res.length;i++){[m
