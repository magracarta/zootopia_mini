<style>

span{
	font-family:  "Noto Sans KR", sans-serif; font-size:80%; font-weight:normal; color:red;
}

.container{
   	margin:0 auto;
   	margin-top:50px;
   	width:471px;
   	height:auto;
   	border: 1px solid #E5E5E5;
   	border-radius: 5px;
   	display:flex;
   	justify-content:center;
   	align-items:center;
   	box-sizing:border-box;
}
.container h2{
	margin-top: 50px;
	font-size:30px;
	font-weight:bold;
	text-align:center;
	margin-bottom:50px;
}
.container form{
	width:300px;
	height:auto;
	box-sizing:border-box;
	margin-bottom:30px;
	
}
.container .field input[type='text'],input[type='password']{
	border-top:0;
	border-left:0;
	border-right:0;
	border-bottom:1px solid #D6D6D6;
	padding:0px;
	margin-bottom:5px;
}
input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
}
.container .field_idcheck input[type='text']{
	border-top:0;
	border-left:0;
	border-right:0;
	border-bottom:1px solid #D6D6D6;
	padding:0px;
	margin-bottom:5px;
}
.container .field_idcheck input[type='button']{
	border:1px solid black;
	background:black;
	color:white;
	text-align:center;
	margin-bottom:5px;
	margin-left:10px;
	border-radius:7px 7px 7px 7px;
	padding-top:10px;
	padding-bottom:10px;
	height:37px;
	margin-top:10px;
}
.container .field_nicknamecheck input[type='text']{
	border-top:0;
	border-left:0;
	border-right:0;
	border-bottom:1px solid #D6D6D6;
	padding:0px;
	margin-bottom:5px;
}
.container .field_nicknamecheck input[type='button']{
	border:1px solid black;
	background:black;
	color:white;
	text-align:center;
	margin-bottom:5px;
	margin-left:10px;
	border-radius:7px 7px 7px 7px;
	padding-top:10px;
	padding-bottom:10px;
	height:37px;
	margin-top:10px;
}
.btn{
   	display:flex;
   	flex-direction:column;
   	width:300px;
   	height:100px;
}
.btn input[type='button'], input[type='submit'] {
	border-radius:30px 30px 30px 30px;
	padding:10px 0;
	box-sizing:border-box;
	margin-top:10px;
	color:white;
	background:black;
	border:1px solid black;
	
}
.btn input[type='button']{
	margin-bottom:50px;
	box-sizing:border-box;
	background:white;
	border:1.5px solid black;
	color:black;
}
.field_idcheck{
	display:flex;
	flex-direction:row;
}
.field_nicknamecheck{
	display:flex;
	flex-direction:row;
}

.container .field_pet{
	display:flex;
	justify-content:space-between;
	margin-top:50px;
}
.container .field_pet .field_left{
	display:flex;
	flex-direction:column;
}
.container .field_pet .field_right{
	display:flex;
	flex-direction:column;
	margin-left:20px;
	margin-bottom:30px;
	justify-content:space-between;
	
}
.container .field_pet .field_right select{
	border-top:0;
	border-left:0;
	border-right:0;
	border-bottom:1px solid #D6D6D6;
	padding:0px;
	margin-bottom:5px;
}

img{
	width:138px;
	height:138px;
}
.container .field_pet .field_left input[type='file']{
	display:none;
}
.custom_photo_upload {
	display: inline-block;
	background:white;
	color: black;
	border: 1px solid black;
	padding: 5px 5px;
	cursor: pointer;
	text-align:center;
}
.custom_photo_upload:hover {
	background-color: none;
}
.file_name{
	margin-left:10px;
}
.id_check_form {
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	font-family: 'Roboto', sans-serif;
}
.id_check_form input[type='submit'],input[type='button']{
	background:black;
	color:white;
	border:1px solid black;
	border-radius:10px 10px 10px 10px;
	padding:3px 5px;
}
.nickname_check_form {
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	font-family: 'Roboto', sans-serif;
}
.nickname_check_form input[type='submit'],input[type='button']{
	background:black;
	color:white;
	border:1px solid black;
	border-radius:10px 10px 10px 10px;
	padding:3px 5px;
}
</style>

<script>
if(document.getElementById('photoinput')){
	document.getElementById('photoinput').addEventListener('change', function() {
    	var fileName = this.value.split('\\').pop(); 
    	document.getElementById('photoinput').textContent = fileName;
	});
	
}
</script>