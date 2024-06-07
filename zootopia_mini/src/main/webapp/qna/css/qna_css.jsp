<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

@charset "UTF-8";

.qna-header {
        font-size: xx-large;
        text-align:center;
    }
    .tb {
        width: 100%;
        margin-top: 20px;
   }
    .row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #ccc;
    }
    .tb .row {
    display: flex;
    align-items: center;
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
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    .form-container h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    .form-container .field {
        margin-bottom: 15px;
    }
    .form-container .field label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
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
    .form-container .btn button, 
    .form-container .btn input[type="submit"] {
        padding: 10px 20px;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        background-color: gray; 
        text-align: center; 
        box-sizing: border-box; 
        width: 150px;
        height: 50px;
    }
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
    
   </style>