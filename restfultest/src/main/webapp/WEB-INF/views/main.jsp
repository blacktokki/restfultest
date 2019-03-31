<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jsp page sample</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<script type="text/javascript">

var selectAll=function(){
	$.ajax({
        url: "demo",
        cache:false,
        type: "GET",
        success: function(data){
        	var index=Number($('input[name="idx"]:checked').val());
        	var result="";
        	$.each(data,function(key,value) {
        		result+="<input type='radio' name='idx' value='"+value.idx+"' ";
        		if (!isNaN(index)&& index==value.idx)
        			result+="checked";
				result+="/>"+value.idx+" "+value.name+" "+value.password+"<br>";
        	});
        	$('#result').html(result);
        	if(!isNaN(index))
        		selectOne(index);
        },
        error: function(){
            alert("err");
        }
    });
}

var selectOne=function(var_idx){
	$.ajax({
        url: "demo/"+var_idx,
        type: "GET",
        cache:false,
        success: function(data){
        	var result="index : "+data.idx+"<br>name:"+data.name+"<br>password"+data.password+"<br>";
        	$('#result2').html(result);
        },
        error: function(){
            alert("err");
        }
    });
}


var insertOne=function(var_data){
	$.ajax({
        url: "demo",
        type: "POST",
        cache:false,
        data: var_data,
        success: function(data){
        	 selectAll();
        },
        error: function(){
            alert("err");
        }
    });
}
var updateOne=function(var_data,var_idx){
	$.ajax({
        url: "demo/"+var_idx,
        type: "PUT",
        cache:false,
        data: var_data,
        success: function(data){
        	 selectAll();
        },
        error: function(){
            alert("err");
        }
    });
}

var deleteOne=function(var_idx){
	$.ajax({
        url: "demo/"+var_idx,
        type: "DELETE",
        cache:false,
        success: function(data){
        	 selectAll();
        },
        error: function(){
            alert("err");
        }
    });
}

$(function(){
	selectAll();
	$('#insert').on('click', function(){
		var form = {
                name: $('#name').val(),
                password: $('#password').val()
        };
		insertOne(form);
    });
	$('#update').on('click', function(){
		var index=Number($('input[name="idx"]:checked').val());
		var form = {
                name: $('#name').val(),
                password: $('#password').val()
        };
		if (!isNaN(index)){
			updateOne(form,index);
		}
    });
	$('#delete').on('click', function(){
		var index=Number($('input[name="idx"]:checked').val());
		if (!isNaN(index)){
			deleteOne(index);
		}
    });
	$('#result').delegate('input[name="idx"]','change',function(){
		var index=$(this).val();
		if (!isNaN(index)){
			selectOne(index);
		}
	});
});

</script>
</head>
<body>
	name:<input type="text" id="name" /><br>
	password:<input type="text" id="password" /><br>
	<input type="button" value="insert" id="insert" />
	<input type="button" value="update" id="update" />
	<input type="button" value="delete" id="delete" /><br>
	<div id="result"></div>
	<div id="result2"></div>
</body>
</html>
