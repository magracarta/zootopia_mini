let category =location.href.split("category=")[1].split("&")[0];
 let count = 0;
 document.querySelector("."+category).classList.add("select");
   setTimeout(()=>{
	   var swiper = new Swiper(".mySwiper", {
		   slidesPerView: 'auto',
		      freeMode: true,
		    });
   },500);
	let buttons =  document.querySelectorAll('input[name="cseq"]');
   document.querySelector('input[name="allcheck"]').addEventListener('change',(e)=>{
	   buttons.forEach((elem)=>{
		   if(e.target.checked == true) {
			   elem.checked = true;
		   }else elem.checked = false;
	   });
	   checked(buttons);
	});
   
   
   
   document.querySelector(".contest_container").addEventListener("click",(e)=>{
	   checked(buttons);
   });
   checked(buttons);
 
   function checked(button){
	   count = 0;
	   button.forEach((elem)=>{
		   if(elem.checked == true) {
			   count++;
		   }
	   });
	   document.querySelector(".allcheckbox span").innerHTML = count+"/"+buttons.length;
   	}
   
   document.querySelector(".button-box").addEventListener('click',(e)=>{
	   	if(count==0){
	   		alert("체크박스를 선택 후 "+e.target.value+"버튼을 눌러주세요!");
	   		return false;
	   	}
	   
	    let commandText = "";
	    if(e.target.value == "삭제") commandText = "delete";
	    else if(e.target.value == "수락") commandText = "permit";
	    else if(e.target.value == "거절") commandText = "reject";
	    else if(e.target.value == "대기") commandText = "waiting";
	    document.querySelector(".contest_command_name").value = (commandText);
	    document.querySelector('.contestlistForm input[type="submit"]').click();
	    
	    
	});