<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert(`${alert}`);
	setTimeout(()=>{
		location.replace(`zootopia.do?command=admincontestlist&category=${category}&pagenum=${pagenum}&search=${search}`);
		//window.location.herf=`zootopia.do?command=admincontestlist&category=${category}&pagenum=${pagenum}&search=${search}`;
	});
</script>