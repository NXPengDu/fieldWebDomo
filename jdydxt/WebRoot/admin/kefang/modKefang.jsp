<%@ page language="java"	
	import="java.util.*,java.sql.*,com.biyeseng.db.*"	
	pageEncoding="UTF-8"%>	
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
	
		<title>场地修改</title>	
	
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">	
		<script type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>	
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">	
		<style type="text/css">	
<!--	
.STYLE3 {	
	font-size: 16px	
}	
-->	
</style>	
	</head>	
	
	<body>	
		<p>r&nbsp;	 
		</p>	
		<p>	
			&nbsp;	
		</p>	
		<form action="ModKefangAction" method="post">	
			<%	
				DBManager dbm = new DBManager();	
				Connection conn = dbm.getConnection();	
				String id = request.getParameter("id");	
				String sql = "select * from projectinfo where id='" + id + "'";	
				PreparedStatement stat = conn.prepareStatement(sql);	
				ResultSet rs = stat.executeQuery();	
				rs.next();	
			%>	
			<table width="39%" border="0" align="center" cellspacing="1"	
				bordercolor="#000000" bgcolor="#0000CC">	
				<input name="id" type="hidden" id="name" value='<%=id%>'>	
				<tr>	
					<td width="28%" bgcolor="#FFFFFF">	
						<div align="right" class="STYLE3">	
							名称：	
						</div>	
					</td>	
					<td width="72%" bgcolor="#FFFFFF">	
						<label>	
							<input name="name" type="text" id="name" value="<%=rs.getString("name") %>">	
							<input name="totalid" type="hidden" value="<%=request.getParameter("jid") %>" id="name">	
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
						<input name="price" type="text" id="chuang"  value="<%=rs.getString("price") %>">	
						<td bgcolor="#FFFFFF">	
					</td>
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
			<%	
				if (rs != null)	
					rs.close();	
				if (stat != null)	
					stat.close();	
				if (conn != null)	
					conn.close();	
			%>	
		</form>	
	</body>	
</html>	
