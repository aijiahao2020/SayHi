
	var TS={
			  successAlert:function(str){ //调用成功的方法
			    var html='<div class="alert alert-success ts-alert" >'
			            +'<span class="ts-alert-text">'+str+'</span>'
			            +'<button type="button" class="close"><span>×</span></button></div>';
			             
			    var obj=$(html);
			    obj.appendTo(document.body);
			    var w=obj.width();
			    if(w>1) w=w/2;
			    //提示框居中显示
			    obj.css("margin-left", "-"+w+"px");
			    //延时自动关闭
			    setTimeout(function () {
			       obj.remove();
			    }, 3000);              
			     
			  },
			  errorAlert:function(str){ //调用失败的方法
			    var html='<div class="alert alert-danger ts-alert" >'
			            +'<span class="ts-alert-text">'+str+'</span>'
			            +'<button type="button" class="close"><span>×</span></button></div>';    
			             
			    var obj=$(html);
			    obj.appendTo(document.body);
			    var w=obj.width();
			    if(w>1) w=w/2;
			    obj.css("margin-left", "-"+w+"px");
			    setTimeout(function () {
			       obj.remove();
			    }, 3000);          
			  },
			  loadingAlert:function(str){
			     $('<div class="alert alert-info ts-alert" >'+str+'</div>').appendTo(document.body);
			  },
			  removeAlert:function(obj){
			    $(obj).remove();
			  }
			}
			 
			$(function(){
			   
			  $(document).on("click",".close",function(){
			    var obj=$(this).parents(".ts-alert");
			    obj.remove();
			  });
			   
			});
