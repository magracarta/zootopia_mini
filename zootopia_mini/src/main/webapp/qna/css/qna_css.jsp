<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

@charset "UTF-8";

.qna-header {
        font-size: 30px;
        font-weight:bold;
        text-align:center;
        margin-bottom:50px;
    }
    .tb {
        width: 100%;
        margin-top: 20px;
   }
    .row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        border-bottom: 1px solid #ccc;
        background-color: #f7f7f7;
        font-weight:bold;
    }
    .low{
    	display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 25px 15px;
        border-bottom: 1px solid #ccc;
    }
    .tb .low {
    display: flex;
    align-items: center;
    }
    .tb .low >div {
    flex: 1; 
    text-align: center;
    }
    .tb .row {
    display: flex;
    align-items: center;
   
    padding: 25px 15px;
    }
    .tb .row >div {
    flex: 1; 
    text-align: center;
    }
    .coltitle {
        text-align: center;
    }
    .col {
        flex: 1;
        text-align: center;
        display: flex;
        justify-content: space-between;
    }
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px 0;
    }

    .pagination span {
        margin: 0 5px;
        color: gray;
    }
     .btn {
        display: flex;
        justify-content: center;
        padding: 20px 0;
        
    }
	.tb .btn-container input[type="button"]{
	text-align:right;
	}
	.form-container {
        max-width: 800px;
        margin: auto;
        padding: 60px 30px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }
    .form-container h2 {
	   text-align: center;
	   margin-bottom: 50px;
	   font-size: 30px;
	   font-weight: bold;
    }
    .form-container .field {
        margin-bottom: 50px;
    }
    .form-container .field label {
       display: block;
	    margin-bottom: 20px;
	    font-weight: bold;
	    font-size: 16px;
    }
    .form-container .field input[type="text"],
    .form-container .field textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .form-container .btn form, 
    .form-container .btn button {
        display: inline-block;
        margin: 5px;
    }
    .btn input ,
    .form-container .btn button
   {
        padding: 10px 20px;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        background-color: black; 
        border:1px solid #000;
        text-align: center; 
        box-sizing: border-box; 
        width: 150px;
        height: 50px;
    }
    .btn input:last-child ,
   .form-container .btn button:last-child { 
    	background:#fff;
    	color:#000;
    	
    }
      .btn input:last-child { margin-left:10px; }
/*     .category{
     	display: block;
        font-weight: bold;
		margin-bottom: 15px;
    } */
    .content-box {
    white-space: pre-wrap;
    word-wrap: break-word;
/*     overflow: auto;  */
    max-height: 500px; 
}


.subject { flex: 4.5 !important; text-align: left !important; padding: 0 73px;}
.num { flex: 0.8 !important;  }
.category { text-align: left !important; }
.tb .low >div.subject {  }
.tb .row >div.subject {  }
.tb .row >div.author {  }
.tb .row >div.createDate {  }
.tb .row >div.answer {  }
    
   </style>