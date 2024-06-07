let crseq =  document.querySelectorAll('.reply input[name="crseq"]');
let cpseq =  document.querySelectorAll('.contest_pet_list input[name="cpseq"]');
//contest_pet_list
   
   function eventf(buttons, listcontainer){
	let count = 0;
		let spanbox =  listcontainer.querySelector(".allcheckbox span");
		listcontainer.querySelector('input[name="allcheck"]').addEventListener('change',(e)=>{
		   buttons.forEach((elem)=>{
			   if(e.target.checked == true) {
				   elem.checked = true;
			   }else elem.checked = false;
		   });
		   checked(buttons,spanbox , count);
		});
	   listcontainer.addEventListener("click",(e)=>{
		   checked(buttons,spanbox , count);
	   });
   		checked(buttons,spanbox);
   		
   		listcontainer.querySelector('.button-box input[type="button"]').addEventListener('click',(e)=>{
		   	if(listcontainer.querySelectorAll('input:checked').length == 0){
		   		alert("체크박스를 선택 후 "+e.target.value+"버튼을 눌러주세요!");
		   	}else{
				if(confirm("진짜 삭제하시겠습니까?")) listcontainer.querySelector('input[type="submit"]').click();
			}
		   
		});
   }
   
if(crseq.length > 0) eventf(crseq, document.querySelector(".reply"));
	 
if(cpseq.length > 0) eventf(cpseq,document.querySelector(".contest_pet_list"));
 
 
 
   function checked(button , spanbox ){
	let count = 0;
	   button.forEach((elem)=>{
		   if(elem.checked == true) {
			   count++;
		   }
	   });
	   spanbox.innerHTML = count+"/"+button.length;
   	}
   	
   	
   	
   	
   	
	
	
	
