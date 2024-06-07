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
			if(idx == 0) elem2.click();
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
	