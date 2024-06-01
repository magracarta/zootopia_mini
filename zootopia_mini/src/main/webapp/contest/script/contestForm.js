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