<%@ page language="java" import="java.util.*,com.biyeseng.db.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的订单</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/tab.js">
</script>

		<script type="">
function phonecheck(s) {
	var str = s;

	if (!(/^1[3|5|7|8][0-9]\d{4,8}$/.test(s))) {

		alert("您的电话输入不正确");
		return false;
	} else {

		return true;
	}
}
</script>
	</head>

	<body>

		<div class="page">
			<div class="page_con">
				<jsp:include flush="true" page="/inc/top.jsp"></jsp:include>
				<!----------------内容区开始-------------------->
				<div class="sub_main">
					<div class="sub_maincon">
						<div class="sub_mainbox clearfix">


							<div class="m_border">
								<div class="m_title2">
									<h3>
										场地预订
									</h3>
								</div>
								<div class="m_content message_con">
									<table width="98%" border="0" cellpadding="2" cellspacing="1"
										bgcolor="#3333FF" align="center" style="margin-top: 8px">
										
										<tr align="center" bgcolor="#FAFAF1" height="22">

											<td width="5%">
												用户名
											</td>
											<td width="15%">
												场馆
											</td>
											<td width="10%">
												场地
											</td>
											<td width="5%">
												人数
											</td>

											<td width="10%">
												电话
											</td>

											<td width="10%">
												开始时间
											</td>

											<td width="10%">
												离开时间
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
											<td width="5%">
												操作
											</td>

										</tr>
										<%
											Object user = session.getAttribute("user");
											DBManager dbm = new DBManager();
											Connection conn = dbm.getConnection();
											String queryName = request.getParameter("queryName");
											String sql = "select reserve.id,reserve.tel, re.name as names,re.starttime,re.endtime,fi.name,pr.name,re.mony,pr.name as kname,re.deposit,re.count from reserve reserve,fieldinfo fieldinfo,projectinfo projectinfo,userinfo userinfo where reserve.fieldid=fieldinfo.id and private.totalid=fi.id and userinfo.tel='"+user+"' and mtel='" + user + "'";

											PreparedStatement pstmt = conn.prepareStatement(sql);
											ResultSet rs = pstmt.executeQuery();

											while (rs.next()) {
												String id = rs.getString("id");
										%>
										<tr align="center" bgcolor="#FAFAF1" height="22">
											<td align="left">
												<div align="center">
													<%=rs.getString("names")%>

												</div>
											</td>

											<td align="left">
												<div align="center">
													<%=rs.getString("name")%>

												</div>
											</td>
											
											<td align="left">
												<div align="center">
													<%=rs.getString("kname")%>

												</div>
											</td>
											
											<td align="left">
												<div align="center">
													<%=rs.getString("count")%>

												</div>
											</td>

											<td align="left">
												<div align="center">
													<%=rs.getString("tel")%>

												</div>
											</td>

											<td align="left">
												<div align="center">
													<%=rs.getString("starttime")%>

												</div>
											</td>

											<td align="left">
												<div align="center">
													<%=rs.getString("endtime")%>

												</div>
											</td>
											<td align="left">
												<div align="center">
													<%=rs.getString("mony")%>

												</div>
											</td>
											<td align="left">
												<div align="center">
													<%=rs.getString("deposit")%>

												</div>
											</td>
											<td align="left">
												<div align="center">
													<a href="<%=path %>/DelJiuAction?id=<%=id%>&&type=front">退订</a>

												</div>
											</td>



										</tr>
										<%
											}
											
										%>
									</table>

								</div>
							</div>
							
							 

						</div>
					</div>
				</div>
				<!----------------内容区结束-------------------->
				<!---------------页脚开始---------------->
				<div class="bottom">
					<p>
						<a href="http://www.nxu.edu.cn" style="color:white" target="_blank">宁夏大学·陈李欢(nxu.edu.cn)</a>
					</p>
				</div>
				<!---------------页脚结束---------------->
			</div>
		</div>
	</body>
</html>
