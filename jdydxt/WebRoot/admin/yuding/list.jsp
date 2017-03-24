<%@ page language="java" import="java.util.*,java.sql.*,com.biyeseng.db.*"
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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>场地预订管理</title>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="Js/CheckActivX.js">
</script>
		<script charset="utf-8" src="kindeditor/kindeditor-min.js">
</script>
		<script language="javascript">

function doPrint() {

	LODOP.PRINT_INIT("打印");
	LODOP.ADD_PRINT_HTM(88, 20, 700, 600,
			document.getElementById("printTable").innerHTML);
	LODOP.PREVIEW();
};
</script>
		
	</head>
	<body leftmargin="8" topmargin="8"'>
		<!--  快速转换位置按钮  -->
		<!--  内容列表   -->
		<form name="form2">
			<div id="printTable">
				<table width="98%" border="0" cellpadding="2" cellspacing="1"
					bgcolor="#3333FF" align="center" style="margin-top: 8px">
					<tr bgcolor="#E7E7E7">
						<td height="24" colspan="11" background="admin/images/tbg.gif">
							&nbsp;场地预订信息列表&nbsp;
						</td>
					</tr>
					<tr align="center" bgcolor="#FAFAF1" height="22">

						<td width="5%">
							账户
						</td>
						<td width="5%">
							场馆
						</td>
						<td width="5%">
							场地
						</td>
						<td width="2%">
							人数
						</td>
						<td width="5%">
							电话
						</td>
						<td width="5%">
							开始时间
						</td>
						<td width="5%">
							结束时间
						</td>
						<td width="5%">
							单价/小时
						</td>
						<td width="5%">
							金额
						</td>
						<td width="5%">
							定金
						</td>
						<td width="5%">
							级别
						</td>

						<td width="3%">
							操作
						</td>
					</tr>


					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						//String sql = "select re.id,re.tel, re.name as names,re.starttime,re.endtime,fi.name,pr.name,re.mony,pr.name as kname,re.deposit,re.count from reserve re,fieldinfo fi,projectinfo pr where re.fieldid=fi.id and pr.totalid=fi.id and mtel='" + user + "'";
						String sql = "select reserve.id,userinfo.name as username,fieldinfo.name as venuename,projectinfo.name as fieldname,reserve.count,reserve.tel,reserve.starttime,reserve.endtime,reserve.unitprice,reserve.mony,reserve.deposit,reserve.type from reserve reserve,fieldinfo fieldinfo,projectinfo projectinfo,userinfo userinfo where reserve.prnameid=projectinfo.id and reserve.fieldid=fieldinfo.id and reserve.tel=userinfo.tel";
						if (queryName != null) {
							sql = sql+" and reserve.tel like '%" + queryName
									+ "%'";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
							System.out.println("场地查询：" + rs.getString("venuename"));
					%>

					<tr align='center' bgcolor="#FFFFFF"
						onMouseMove="javascript:this.bgColor='#FCFDEE';"
						onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						
						<td><%=rs.getString("username")%>

						</td>
						<td><%=rs.getString("venuename")%>

						</td>
						<td>
							<%=rs.getString("fieldname")%>
						</td>

						<td>
							<%=rs.getString("count")%>
						</td>
						<td>

							<%=rs.getString("tel")%>


						</td>

						<td>

							<%=rs.getString("starttime")%>


						</td>

						<td>

							<%=rs.getString("endtime")%>


						</td>
						<td>

							<%=rs.getString("unitprice")%>


						</td>
						<td>

							<%=rs.getString("mony")%>


						</td>
						
						<td >

							<%=rs.getString("deposit")%>

						</td>
						
						<td>
							<%
							   String type=rs.getString("type");
							   if(type.equals("7")){
							     out.print("银卡");
							   }
							   if(type.equals("8")){
							     out.print("金卡");
							   }
							   if(type.equals("9")){
							   out.print("钻卡");
							   }
							   if(type.equals("6")){
							   out.print("非会员");
							   }
							 %>
						</td>

						<td>

							<a href="DelJiuAction?id=<%=id%>">删除</a>
						</td>
					</tr>

					<%
						}
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					%>

					<tr bgcolor="#FAFAF1">
						<td height="28" colspan="11">
							&nbsp;
							
						</td>
					</tr>

				</table>
			</div>
		</form>

		<!--  搜索表单  -->
		<form action="admin/yuding/list.jsp" method="post">

			<table width='98%' border='0' cellpadding='1' cellspacing='1'
				bgcolor='#CBD8AC' align="center" style="margin-top: 8px">
				<tr bgcolor='#EEF4EA'>
					<td align='center'>

						<table width="469" border='0' cellpadding='0' cellspacing='0'>
							<tr>
								<td width='129'>
									请输入电话：
								</td>
								<td width='170'>
									<input type='text' name='queryName' value=''
										style='width: 150px' />
								</td>
								<td width='86'>
									<input name="imageField" type="submit" border="0" class="np"
										value='查询' />
								</td>
								<td width="84">
									&nbsp;

								</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</form>
	</body>
</html>