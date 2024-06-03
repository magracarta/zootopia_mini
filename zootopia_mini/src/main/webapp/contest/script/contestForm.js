function go_createcontest(){
	let formdate = document.contestform;
	if(formdate.subject.value == ""){
		no_text(formdate.subject,"제목을 입력해주세요!");
		return false;
	}else if(formdate.content.value == ""){
		no_text(formdate.content,"내용을 입력해주세요!");
		return false;
	}else if(formdate.lastdate.value == ""){
		no_text(formdate.lastdate,"마감기한을 선택해주세요!");
		return false;
	}else if(formdate.length.value == ""){
		no_text(formdate.length,"참가 수를 선택해주세요!");
		return false;
	}
	return true;
}

function goDelete(cseq){
	if(confirm("이 콘테스트를 정말 삭제하시겠습니까?")) location.href="zootopia.do?command=contestDelete&cseq="+cseq;
}



function no_text( formvalue ,text ){
	alert(text);
	formvalue.focus();
}


if(location.href.indexOf("contestDetail") > 0 && document.querySelector(".morePetBtn")){
	document.querySelector(".morePetBtn").addEventListener('click',()=>{
	    document.querySelector(".createForm_contaienr").style.display = 'flex';
	});
	
	document.querySelectorAll(".createForm_contaienr .closeBtn , .createForm_contaienr .overay").forEach((elem)=>{
		elem.addEventListener('click',()=>{
		    document.querySelector(".createForm_contaienr").style.display = 'none';
		});
	});
	document.querySelector(".createForm_contaienr .left img").addEventListener('click',()=>{
		document.querySelector(".createForm_contaienr .left input").click();
	});
	document.querySelector(".createForm_contaienr .left input").addEventListener('change',(e)=>{
		imgPreview(document.querySelector(".createForm_contaienr .left input"));
	});
	
	function imgPreview(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
	
			reader.onload = function (e) {
				document.querySelector(".createForm_contaienr .left img").src=(e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function createpetform(userid){
		let formdate = document.contestAddPet;
		if(formdate.userid.value != userid){
			no_text(formdate.subject,"해당 정보가 일치하지 않습니다. 다시 로그인해주세요!");
			return false;
		}else if(formdate.imagefile.value == ""){
			no_text(formdate.imagefile,"이미지를 등록해주세요.");
			return false;
		}else if(formdate.content.value == ""){
			no_text(formdate.content,"내용을 입력해주세요.");
			return false;
		}
		return true;
	}
	
	
}



if(location.href.indexOf("contestDetail") > 0 && document.querySelector(".petUpdate")){
	let beforeimage;
	document.querySelectorAll("a.petUpdate").forEach((elem, index)=>{
		elem.addEventListener('click',(e)=>{
			document.contestUpdatePet.imagefile.value = "";
			 beforeimage = (e.target.dataset.img);
			 document.querySelector(".updateForm_contaienr").style.display = 'flex';
			 document.querySelector(".updateForm_contaienr .left img").src = 'images/'+(beforeimage);
			 document.contestUpdatePet.content.innerText = (e.target.dataset.content);
			 document.contestUpdatePet.cpseq.value = (e.target.dataset.cpseq);
		});
		
		
	});
	
	
	document.querySelectorAll(".updateForm_contaienr .closeBtn , .updateForm_contaienr .overay").forEach((elem)=>{
		elem.addEventListener('click',()=>{
		    document.querySelector(".updateForm_contaienr").style.display = 'none';
		});
	});
	document.querySelector(".updateForm_contaienr .change_btn").addEventListener('click',(e)=>{
		
		document.querySelector(".updateForm_contaienr .left input").click();
		
	});
	document.querySelector(".updateForm_contaienr .left input").addEventListener('change',(e)=>{
		imgPreview(document.querySelector(".updateForm_contaienr .left input"));
	});
	
	function imgPreview(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
	
			reader.onload = function (e) {
				document.querySelector(".updateForm_contaienr .left img").src=(e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function petUpdateform(userid){
		let formdate = document.contestUpdatePet;
		if(formdate.userid.value != userid){
			no_text(formdate.subject,"해당 정보가 일치하지 않습니다. 다시 로그인해주세요!");
			return false;
		}else if(formdate.content.value == ""){
			no_text(formdate.content,"내용을 입력해주세요.");
			return false;
		}
		return true;
	}
	document.querySelector(".before_btn").addEventListener('click',(e)=>{
		document.contestUpdatePet.imagefile.value = "";
		document.querySelector(".updateForm_contaienr .left img").src = 'images/'+beforeimage;
	});

document.querySelectorAll(".petDelete").forEach((elem)=>{
	elem.addEventListener('click',(e)=>{
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="zootopia.do?command=contestpetDelete&cpseq="+elem.dataset.cpseq+"&cseq="
			+elem.dataset.cseq+"&index="+elem.dataset.index;
		}
	});
	
});
	
}

if(location.href.indexOf("contestForm") > 0 || location.href.indexOf("contestUpdateForm") > 0){
	let open = [false , false];
	let selectAll=document.querySelectorAll(".selectcontainer");
	
	selectAll.forEach((elem, index)=>{
		elem.querySelector(".button-wrap a").addEventListener('click', ()=>{
			selectopen(index,elem);
			if(index == 1 ){
				open[0] = false;
				closeSelection(selectAll[0]);
			}else{
				open[1] = false;
				closeSelection(selectAll[1]);
			}
		});
		
		elem.querySelectorAll(".selectcontainer li").forEach((elem2, idx)=>{
			elem2.addEventListener('click',()=>{
				elem.querySelector("input").value= (elem2.dataset.value);
				elem.querySelector(".button-wrap a").style.color="#000";
				let text = elem2.dataset.value+'일';
				if(index == 1)text = elem2.dataset.value+'마리';
				if(elem2.innerText =="변경하지 않기" ) text ="변경하지 않기";
				elem.querySelector(".button-wrap a").innerHTML =text+' <img src="images/arrow.svg">';
				open[0] = false;
				open[1] = false;
				closeSelection(selectAll[1]);
				closeSelection(selectAll[0]);
			});
		});
	});
	
	
	function selectopen(idx , elem){
		open[idx] = !open[idx];
		if(open[idx]) openSelection(elem);
		else closeSelection(elem);
	}
	
	function openSelection(elem){
		elem.querySelector("a").classList.add("open");
		elem.querySelector(".select-container ul").classList.add("open");
	}
	
	function closeSelection(elem){
		elem.querySelector("a").classList.remove("open");
		elem.querySelector(".select-container ul").classList.remove("open");
	}
	
	
	
}