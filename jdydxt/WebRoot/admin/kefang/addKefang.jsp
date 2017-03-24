<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>	
<%	
	String path = request.getContextPath();	
	String basePath = request.getScheme() + "://"	
			+ request.getServerName() + ":" + request.getServerPort()	
			+ path + "/";	
%>	
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">	
<html>	
	<head>	
		<base href="<%=basePath%>">	
	
		<title>场地添加</title>	
	
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">	
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">	
		<script type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>	
		<style type="text/css">	
<!--	
.STYLE3 {	
	font-size: 16px	
}	
-->	
</style>	
	</head>	
	
	<body>	
		<p>	
			&nbsp;	
		</p>	
		<p>	
			&nbsp;	
		</p>	
		<form action="AddKefangAction" method="post">	
			<table width="39%" border="0" align="center" cellspacing="1"	
				bordercolor="#000000" bgcolor="#0000CC">	
				<tr>	
					<td width="28%" bgcolor="#FFFFFF">	
						<div align="right" class="STYLE3">	
							场地名称：	
						</div>	
					</td>	
					<td width="72%" bgcolor="#FFFFFF">	
						<label>	
							<input name="name" type="text" id="name">	
							<input name="jid" type="hidden" value="<%=request.getParameter("jid") %>" id="name">	
						</label>	
					</td>	
				</tr>	
				<tr>	
					<td bgcolor="#FFFFFF">	
						<div align="right" class="STYLE3">	
							价格：	
						</div>	
					</td>	
					<td bgcolor="#FFFFFF">	
						<input name="price" type="text" id="price"   >	
					</td>	
				</tr>
					
				<tr>	
					<td bgcolor="#FFFFFF">	
						<div align="right" class="STYLE3">	
							开始时间：	
						</div>	
					</td>	
					<td bgcolor="#FFFFFF">	
						<select name="starttime">
						  <option value="8:00">8:00</option>
						  <option value="9:00">9:00</option>
						  <option value="10:00">10:00</option>
						  <option value="11:00">11:00</option>
						  <option value="12:00">12:00</option>
						  <option value="13:00">13:00</option>
						  <option value="14:00">14:00</option>
						  <option value="15:00">15:00</option>
						  <option value="16:00">16:00</option>
						  <option value="17:00">17:00</option>
						  <option value="18:00">18:00</option>
						  <option value="19:00">19:00</option>
						  <option value="20:00">20:00</option>
						  <option value="21:00">21:00</option>
						  <option value="22:00">22:00</option>
						  
						</select>
					</td>	
				</tr>	
				
				<tr>	
					<td bgcolor="#FFFFFF">	
						<div align="right" class="STYLE3">	
							结束时间：	
						</div>	
					</td>	
					<td bgcolor="#FFFFFF">	
						<select name="endtime">
						  <option value="9:00">9:00</option>
						  <option value="10:00">10:00</option>
						  <option value="11:00">11:00</option>
						  <option value="12:00">12:00</option>
						  <option value="13:00">13:00</option>
						  <option value="14:00">14:00</option>
						  <option value="15:00">15:00</option>
						  <option value="16:00">16:00</option>
						  <option value="17:00">17:00</option>
						  <option value="18:00">18:00</option>
						  <option value="19:00">19:00</option>
						  <option value="20:00">20:00</option>
						  <option value="21:00">21:00</option>
						  <option value="22:00">22:00</option>
						  
						</select>
					</td>	
				</tr>	
				<tr>	
					<td bgcolor="#FFFFFF">	
						<div align="right" class="STYLE3">	
							状态：	
						</div>	
					</td>	
					<td bgcolor="#FFFFFF">	
						
						<select name="state">
						  <option value="已订满">已订满</option>
						  <option value="可预订">可预订</option>
						</select>		
					</td>	
				</tr>	
				<tr>	
					<td colspan="2" bgcolor="#FFFFFF">	
						<label>	
							<div align="center">	
								<input type="submit" name="Submit" value="提交">	
								<input type="reset" name="Submit2" value="重置">	
							</div>	
						</label>	
					</td>	
				</tr>	
			</table>	
		</form>	
	</body>	
</html>	
