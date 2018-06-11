<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.gint.app.bisis.web.Messages" %>
<jsp:useBean id="user" class="com.gint.app.bisis.web.beans.WebUser" scope="session"/>
<jsp:useBean id="errorInfo" class="com.gint.app.bisis.web.beans.ErrorInfo" scope="session"/>
<jsp:include page="header.jsp" flush="true"/>

<h4><%=Messages.get("SEARCH_BY_ADVANCED", user.getLocale())%></h4>

<form name="searchform" action="MultiQuery" method="post" accept-charset="utf-8">
<select name="prefix1">
	<option value="AU" selected><%=Messages.get("AU", user.getLocale())%></option>
  <option value="AX"><%=Messages.get("AX", user.getLocale())%></option>
	<option value="TI"><%=Messages.get("TI", user.getLocale())%></option>
	<option value="KW"><%=Messages.get("KW", user.getLocale())%></option>
	<option value="PU"><%=Messages.get("PU", user.getLocale())%></option>
	<option value="PY"><%=Messages.get("PY", user.getLocale())%></option>
	<option value="LA"><%=Messages.get("LA", user.getLocale())%></option>
	<option value="AB"><%=Messages.get("AB", user.getLocale())%></option>
	<option value="AM"><%=Messages.get("AM", user.getLocale())%></option>
	<option value="AP"><%=Messages.get("AP", user.getLocale())%></option>
	<option value="AT"><%=Messages.get("AT", user.getLocale())%></option>
	<option value="BI"><%=Messages.get("BI", user.getLocale())%></option>
	<option value="BN"><%=Messages.get("BN", user.getLocale())%></option>
	<option value="CB"><%=Messages.get("CB", user.getLocale())%></option>
	<option value="CC"><%=Messages.get("CC", user.getLocale())%></option>
	<option value="CD"><%=Messages.get("CD", user.getLocale())%></option>
	<option value="CH"><%=Messages.get("CH", user.getLocale())%></option>
	<option value="CL"><%=Messages.get("CL", user.getLocale())%></option>
	<option value="CN"><%=Messages.get("CN", user.getLocale())%></option>
	<option value="CO"><%=Messages.get("CO", user.getLocale())%></option>
	<option value="CP"><%=Messages.get("CP", user.getLocale())%></option>
	<option value="CR"><%=Messages.get("CR", user.getLocale())%></option>
	<option value="CS"><%=Messages.get("CS", user.getLocale())%></option>
	<option value="CY"><%=Messages.get("CY", user.getLocale())%></option>
	<option value="DA"><%=Messages.get("DA", user.getLocale())%></option>
	<option value="DC"><%=Messages.get("DC", user.getLocale())%></option>
	<option value="DE"><%=Messages.get("DE", user.getLocale())%></option>
	<option value="DR"><%=Messages.get("DR", user.getLocale())%></option>
	<option value="DT"><%=Messages.get("DT", user.getLocale())%></option>
	<option value="ES"><%=Messages.get("ES", user.getLocale())%></option>
	<option value="FC"><%=Messages.get("FC", user.getLocale())%></option>
	<option value="FD"><%=Messages.get("FD", user.getLocale())%></option>
	<option value="FI"><%=Messages.get("FI", user.getLocale())%></option>
	<option value="FN"><%=Messages.get("FN", user.getLocale())%></option>
	<option value="FQ"><%=Messages.get("FQ", user.getLocale())%></option>
	<option value="FS"><%=Messages.get("FS", user.getLocale())%></option>
	<option value="GE"><%=Messages.get("GE", user.getLocale())%></option>
	<option value="GM"><%=Messages.get("GM", user.getLocale())%></option>
	<option value="GN"><%=Messages.get("GN", user.getLocale())%></option>
	<option value="GS"><%=Messages.get("GS", user.getLocale())%></option>
	<option value="HI"><%=Messages.get("HI", user.getLocale())%></option>
	<option value="IC"><%=Messages.get("IC", user.getLocale())%></option>
	<option value="II"><%=Messages.get("II", user.getLocale())%></option>
	<option value="IN"><%=Messages.get("IN", user.getLocale())%></option>
	<option value="IR"><%=Messages.get("IR", user.getLocale())%></option>
	<option value="KT"><%=Messages.get("KT", user.getLocale())%></option>
	<option value="LC"><%=Messages.get("LC", user.getLocale())%></option>
	<option value="LI"><%=Messages.get("LI", user.getLocale())%></option>
	<option value="LN"><%=Messages.get("LN", user.getLocale())%></option>
	<option value="LO"><%=Messages.get("LO", user.getLocale())%></option>
	<option value="ND"><%=Messages.get("ND", user.getLocale())%></option>
	<option value="NM"><%=Messages.get("NM", user.getLocale())%></option>
	<option value="NT"><%=Messages.get("NT", user.getLocale())%></option>
	<option value="P2"><%=Messages.get("P2", user.getLocale())%></option>
	<option value="PA"><%=Messages.get("PA", user.getLocale())%></option>
	<option value="PM"><%=Messages.get("PM", user.getLocale())%></option>
	<option value="PN"><%=Messages.get("PN", user.getLocale())%></option>
	<option value="PP"><%=Messages.get("PP", user.getLocale())%></option>
	<option value="PR"><%=Messages.get("PR", user.getLocale())%></option>
	<option value="RE"><%=Messages.get("RE", user.getLocale())%></option>
	<option value="RJ"><%=Messages.get("RJ", user.getLocale())%></option>
	<option value="RS"><%=Messages.get("RS", user.getLocale())%></option>
	<option value="RT"><%=Messages.get("RT", user.getLocale())%></option>
	<option value="SC"><%=Messages.get("SC", user.getLocale())%></option>
	<option value="SG"><%=Messages.get("SG", user.getLocale())%></option>
	<option value="SI"><%=Messages.get("SI", user.getLocale())%></option>
	<option value="SK"><%=Messages.get("SK", user.getLocale())%></option>
	<option value="SN"><%=Messages.get("SN", user.getLocale())%></option>
	<option value="SP"><%=Messages.get("SP", user.getLocale())%></option>
	<option value="SR"><%=Messages.get("SR", user.getLocale())%></option>
	<option value="SS"><%=Messages.get("SS", user.getLocale())%></option>
	<option value="ST"><%=Messages.get("ST", user.getLocale())%></option>
	<option value="SU"><%=Messages.get("SU", user.getLocale())%></option>
	<option value="TN"><%=Messages.get("TN", user.getLocale())%></option>
	<option value="TP"><%=Messages.get("TP", user.getLocale())%></option>
	<option value="TS"><%=Messages.get("TS", user.getLocale())%></option>
	<option value="TY"><%=Messages.get("TY", user.getLocale())%></option>
	<option value="UG"><%=Messages.get("UG", user.getLocale())%></option>
	<option value="US"><%=Messages.get("US", user.getLocale())%></option>
	<option value="UT"><%=Messages.get("UT", user.getLocale())%></option>
	<option value="Y1"><%=Messages.get("Y1", user.getLocale())%></option>
	<option value="Y2"><%=Messages.get("Y2", user.getLocale())%></option>
	<option value="ID"><%=Messages.get("ID", user.getLocale())%></option>
</select>
<input type="text" name="content1" size="20">
<select name="operator1">
  <option value="AND" selected >AND</option>
  <option value="OR">OR</option>
  <option value="NOT">NOT</option>
</select>
<br/>
<select name="prefix2">
	<option value="AU"><%=Messages.get("AU", user.getLocale())%></option>
	<option value="TI" selected><%=Messages.get("TI", user.getLocale())%></option>
	<option value="KW"><%=Messages.get("KW", user.getLocale())%></option>
	<option value="PU"><%=Messages.get("PU", user.getLocale())%></option>
	<option value="PY"><%=Messages.get("PY", user.getLocale())%></option>
	<option value="LA"><%=Messages.get("LA", user.getLocale())%></option>
	<option value="AB"><%=Messages.get("AB", user.getLocale())%></option>
	<option value="AM"><%=Messages.get("AM", user.getLocale())%></option>
	<option value="AP"><%=Messages.get("AP", user.getLocale())%></option>
	<option value="AT"><%=Messages.get("AT", user.getLocale())%></option>
	<option value="BI"><%=Messages.get("BI", user.getLocale())%></option>
	<option value="BN"><%=Messages.get("BN", user.getLocale())%></option>
	<option value="CB"><%=Messages.get("CB", user.getLocale())%></option>
	<option value="CC"><%=Messages.get("CC", user.getLocale())%></option>
	<option value="CD"><%=Messages.get("CD", user.getLocale())%></option>
	<option value="CH"><%=Messages.get("CH", user.getLocale())%></option>
	<option value="CL"><%=Messages.get("CL", user.getLocale())%></option>
	<option value="CN"><%=Messages.get("CN", user.getLocale())%></option>
	<option value="CO"><%=Messages.get("CO", user.getLocale())%></option>
	<option value="CP"><%=Messages.get("CP", user.getLocale())%></option>
	<option value="CR"><%=Messages.get("CR", user.getLocale())%></option>
	<option value="CS"><%=Messages.get("CS", user.getLocale())%></option>
	<option value="CY"><%=Messages.get("CY", user.getLocale())%></option>
	<option value="DA"><%=Messages.get("DA", user.getLocale())%></option>
	<option value="DC"><%=Messages.get("DC", user.getLocale())%></option>
	<option value="DE"><%=Messages.get("DE", user.getLocale())%></option>
	<option value="DR"><%=Messages.get("DR", user.getLocale())%></option>
	<option value="DT"><%=Messages.get("DT", user.getLocale())%></option>
	<option value="ES"><%=Messages.get("ES", user.getLocale())%></option>
	<option value="FC"><%=Messages.get("FC", user.getLocale())%></option>
	<option value="FD"><%=Messages.get("FD", user.getLocale())%></option>
	<option value="FI"><%=Messages.get("FI", user.getLocale())%></option>
	<option value="FN"><%=Messages.get("FN", user.getLocale())%></option>
	<option value="FQ"><%=Messages.get("FQ", user.getLocale())%></option>
	<option value="FS"><%=Messages.get("FS", user.getLocale())%></option>
	<option value="GE"><%=Messages.get("GE", user.getLocale())%></option>
	<option value="GM"><%=Messages.get("GM", user.getLocale())%></option>
	<option value="GN"><%=Messages.get("GN", user.getLocale())%></option>
	<option value="GS"><%=Messages.get("GS", user.getLocale())%></option>
	<option value="HI"><%=Messages.get("HI", user.getLocale())%></option>
	<option value="IC"><%=Messages.get("IC", user.getLocale())%></option>
	<option value="II"><%=Messages.get("II", user.getLocale())%></option>
	<option value="IN"><%=Messages.get("IN", user.getLocale())%></option>
	<option value="IR"><%=Messages.get("IR", user.getLocale())%></option>
	<option value="KT"><%=Messages.get("KT", user.getLocale())%></option>
	<option value="LC"><%=Messages.get("LC", user.getLocale())%></option>
	<option value="LI"><%=Messages.get("LI", user.getLocale())%></option>
	<option value="LN"><%=Messages.get("LN", user.getLocale())%></option>
	<option value="LO"><%=Messages.get("LO", user.getLocale())%></option>
	<option value="ND"><%=Messages.get("ND", user.getLocale())%></option>
	<option value="NM"><%=Messages.get("NM", user.getLocale())%></option>
	<option value="NT"><%=Messages.get("NT", user.getLocale())%></option>
	<option value="P2"><%=Messages.get("P2", user.getLocale())%></option>
	<option value="PA"><%=Messages.get("PA", user.getLocale())%></option>
	<option value="PM"><%=Messages.get("PM", user.getLocale())%></option>
	<option value="PN"><%=Messages.get("PN", user.getLocale())%></option>
	<option value="PP"><%=Messages.get("PP", user.getLocale())%></option>
	<option value="PR"><%=Messages.get("PR", user.getLocale())%></option>
	<option value="RE"><%=Messages.get("RE", user.getLocale())%></option>
	<option value="RJ"><%=Messages.get("RJ", user.getLocale())%></option>
	<option value="RS"><%=Messages.get("RS", user.getLocale())%></option>
	<option value="RT"><%=Messages.get("RT", user.getLocale())%></option>
	<option value="SC"><%=Messages.get("SC", user.getLocale())%></option>
	<option value="SG"><%=Messages.get("SG", user.getLocale())%></option>
	<option value="SI"><%=Messages.get("SI", user.getLocale())%></option>
	<option value="SK"><%=Messages.get("SK", user.getLocale())%></option>
	<option value="SN"><%=Messages.get("SN", user.getLocale())%></option>
	<option value="SP"><%=Messages.get("SP", user.getLocale())%></option>
	<option value="SR"><%=Messages.get("SR", user.getLocale())%></option>
	<option value="SS"><%=Messages.get("SS", user.getLocale())%></option>
	<option value="ST"><%=Messages.get("ST", user.getLocale())%></option>
	<option value="SU"><%=Messages.get("SU", user.getLocale())%></option>
	<option value="TN"><%=Messages.get("TN", user.getLocale())%></option>
	<option value="TP"><%=Messages.get("TP", user.getLocale())%></option>
	<option value="TS"><%=Messages.get("TS", user.getLocale())%></option>
	<option value="TY"><%=Messages.get("TY", user.getLocale())%></option>
	<option value="UG"><%=Messages.get("UG", user.getLocale())%></option>
	<option value="US"><%=Messages.get("US", user.getLocale())%></option>
	<option value="UT"><%=Messages.get("UT", user.getLocale())%></option>
	<option value="Y1"><%=Messages.get("Y1", user.getLocale())%></option>
	<option value="Y2"><%=Messages.get("Y2", user.getLocale())%></option>
	<option value="ID"><%=Messages.get("ID", user.getLocale())%></option>
</select>
<input type="text" name="content2" size="20">
<select name="operator2">
  <option value="AND" selected >AND</option>
  <option value="OR">OR</option>
  <option value="NOT">NOT</option>
</select>
<br/>
<select name="prefix3">
	<option value="AU"><%=Messages.get("AU", user.getLocale())%></option>
	<option value="TI"><%=Messages.get("TI", user.getLocale())%></option>
	<option value="KW" selected><%=Messages.get("KW", user.getLocale())%></option>
	<option value="PU"><%=Messages.get("PU", user.getLocale())%></option>
	<option value="PY"><%=Messages.get("PY", user.getLocale())%></option>
	<option value="LA"><%=Messages.get("LA", user.getLocale())%></option>
	<option value="AB"><%=Messages.get("AB", user.getLocale())%></option>
	<option value="AM"><%=Messages.get("AM", user.getLocale())%></option>
	<option value="AP"><%=Messages.get("AP", user.getLocale())%></option>
	<option value="AT"><%=Messages.get("AT", user.getLocale())%></option>
	<option value="BI"><%=Messages.get("BI", user.getLocale())%></option>
	<option value="BN"><%=Messages.get("BN", user.getLocale())%></option>
	<option value="CB"><%=Messages.get("CB", user.getLocale())%></option>
	<option value="CC"><%=Messages.get("CC", user.getLocale())%></option>
	<option value="CD"><%=Messages.get("CD", user.getLocale())%></option>
	<option value="CH"><%=Messages.get("CH", user.getLocale())%></option>
	<option value="CL"><%=Messages.get("CL", user.getLocale())%></option>
	<option value="CN"><%=Messages.get("CN", user.getLocale())%></option>
	<option value="CO"><%=Messages.get("CO", user.getLocale())%></option>
	<option value="CP"><%=Messages.get("CP", user.getLocale())%></option>
	<option value="CR"><%=Messages.get("CR", user.getLocale())%></option>
	<option value="CS"><%=Messages.get("CS", user.getLocale())%></option>
	<option value="CY"><%=Messages.get("CY", user.getLocale())%></option>
	<option value="DA"><%=Messages.get("DA", user.getLocale())%></option>
	<option value="DC"><%=Messages.get("DC", user.getLocale())%></option>
	<option value="DE"><%=Messages.get("DE", user.getLocale())%></option>
	<option value="DR"><%=Messages.get("DR", user.getLocale())%></option>
	<option value="DT"><%=Messages.get("DT", user.getLocale())%></option>
	<option value="ES"><%=Messages.get("ES", user.getLocale())%></option>
	<option value="FC"><%=Messages.get("FC", user.getLocale())%></option>
	<option value="FD"><%=Messages.get("FD", user.getLocale())%></option>
	<option value="FI"><%=Messages.get("FI", user.getLocale())%></option>
	<option value="FN"><%=Messages.get("FN", user.getLocale())%></option>
	<option value="FQ"><%=Messages.get("FQ", user.getLocale())%></option>
	<option value="FS"><%=Messages.get("FS", user.getLocale())%></option>
	<option value="GE"><%=Messages.get("GE", user.getLocale())%></option>
	<option value="GM"><%=Messages.get("GM", user.getLocale())%></option>
	<option value="GN"><%=Messages.get("GN", user.getLocale())%></option>
	<option value="GS"><%=Messages.get("GS", user.getLocale())%></option>
	<option value="HI"><%=Messages.get("HI", user.getLocale())%></option>
	<option value="IC"><%=Messages.get("IC", user.getLocale())%></option>
	<option value="II"><%=Messages.get("II", user.getLocale())%></option>
	<option value="IN"><%=Messages.get("IN", user.getLocale())%></option>
	<option value="IR"><%=Messages.get("IR", user.getLocale())%></option>
	<option value="KT"><%=Messages.get("KT", user.getLocale())%></option>
	<option value="LC"><%=Messages.get("LC", user.getLocale())%></option>
	<option value="LI"><%=Messages.get("LI", user.getLocale())%></option>
	<option value="LN"><%=Messages.get("LN", user.getLocale())%></option>
	<option value="LO"><%=Messages.get("LO", user.getLocale())%></option>
	<option value="ND"><%=Messages.get("ND", user.getLocale())%></option>
	<option value="NM"><%=Messages.get("NM", user.getLocale())%></option>
	<option value="NT"><%=Messages.get("NT", user.getLocale())%></option>
	<option value="P2"><%=Messages.get("P2", user.getLocale())%></option>
	<option value="PA"><%=Messages.get("PA", user.getLocale())%></option>
	<option value="PM"><%=Messages.get("PM", user.getLocale())%></option>
	<option value="PN"><%=Messages.get("PN", user.getLocale())%></option>
	<option value="PP"><%=Messages.get("PP", user.getLocale())%></option>
	<option value="PR"><%=Messages.get("PR", user.getLocale())%></option>
	<option value="RE"><%=Messages.get("RE", user.getLocale())%></option>
	<option value="RJ"><%=Messages.get("RJ", user.getLocale())%></option>
	<option value="RS"><%=Messages.get("RS", user.getLocale())%></option>
	<option value="RT"><%=Messages.get("RT", user.getLocale())%></option>
	<option value="SC"><%=Messages.get("SC", user.getLocale())%></option>
	<option value="SG"><%=Messages.get("SG", user.getLocale())%></option>
	<option value="SI"><%=Messages.get("SI", user.getLocale())%></option>
	<option value="SK"><%=Messages.get("SK", user.getLocale())%></option>
	<option value="SN"><%=Messages.get("SN", user.getLocale())%></option>
	<option value="SP"><%=Messages.get("SP", user.getLocale())%></option>
	<option value="SR"><%=Messages.get("SR", user.getLocale())%></option>
	<option value="SS"><%=Messages.get("SS", user.getLocale())%></option>
	<option value="ST"><%=Messages.get("ST", user.getLocale())%></option>
	<option value="SU"><%=Messages.get("SU", user.getLocale())%></option>
	<option value="TN"><%=Messages.get("TN", user.getLocale())%></option>
	<option value="TP"><%=Messages.get("TP", user.getLocale())%></option>
	<option value="TS"><%=Messages.get("TS", user.getLocale())%></option>
	<option value="TY"><%=Messages.get("TY", user.getLocale())%></option>
	<option value="UG"><%=Messages.get("UG", user.getLocale())%></option>
	<option value="US"><%=Messages.get("US", user.getLocale())%></option>
	<option value="UT"><%=Messages.get("UT", user.getLocale())%></option>
	<option value="Y1"><%=Messages.get("Y1", user.getLocale())%></option>
	<option value="Y2"><%=Messages.get("Y2", user.getLocale())%></option>
	<option value="ID"><%=Messages.get("ID", user.getLocale())%></option>
</select>
<input type="text" name="content3" size="20">
<select name="operator3">
  <option value="AND" selected >AND</option>
  <option value="OR">OR</option>
  <option value="NOT">NOT</option>
</select>
<br/>
<select name="prefix4">
	<option value="AU"><%=Messages.get("AU", user.getLocale())%></option>
	<option value="TI"><%=Messages.get("TI", user.getLocale())%></option>
	<option value="KW"><%=Messages.get("KW", user.getLocale())%></option>
	<option value="PU" selected><%=Messages.get("PU", user.getLocale())%></option>
	<option value="PY"><%=Messages.get("PY", user.getLocale())%></option>
	<option value="LA"><%=Messages.get("LA", user.getLocale())%></option>
	<option value="AB"><%=Messages.get("AB", user.getLocale())%></option>
	<option value="AM"><%=Messages.get("AM", user.getLocale())%></option>
	<option value="AP"><%=Messages.get("AP", user.getLocale())%></option>
	<option value="AT"><%=Messages.get("AT", user.getLocale())%></option>
	<option value="BI"><%=Messages.get("BI", user.getLocale())%></option>
	<option value="BN"><%=Messages.get("BN", user.getLocale())%></option>
	<option value="CB"><%=Messages.get("CB", user.getLocale())%></option>
	<option value="CC"><%=Messages.get("CC", user.getLocale())%></option>
	<option value="CD"><%=Messages.get("CD", user.getLocale())%></option>
	<option value="CH"><%=Messages.get("CH", user.getLocale())%></option>
	<option value="CL"><%=Messages.get("CL", user.getLocale())%></option>
	<option value="CN"><%=Messages.get("CN", user.getLocale())%></option>
	<option value="CO"><%=Messages.get("CO", user.getLocale())%></option>
	<option value="CP"><%=Messages.get("CP", user.getLocale())%></option>
	<option value="CR"><%=Messages.get("CR", user.getLocale())%></option>
	<option value="CS"><%=Messages.get("CS", user.getLocale())%></option>
	<option value="CY"><%=Messages.get("CY", user.getLocale())%></option>
	<option value="DA"><%=Messages.get("DA", user.getLocale())%></option>
	<option value="DC"><%=Messages.get("DC", user.getLocale())%></option>
	<option value="DE"><%=Messages.get("DE", user.getLocale())%></option>
	<option value="DR"><%=Messages.get("DR", user.getLocale())%></option>
	<option value="DT"><%=Messages.get("DT", user.getLocale())%></option>
	<option value="ES"><%=Messages.get("ES", user.getLocale())%></option>
	<option value="FC"><%=Messages.get("FC", user.getLocale())%></option>
	<option value="FD"><%=Messages.get("FD", user.getLocale())%></option>
	<option value="FI"><%=Messages.get("FI", user.getLocale())%></option>
	<option value="FN"><%=Messages.get("FN", user.getLocale())%></option>
	<option value="FQ"><%=Messages.get("FQ", user.getLocale())%></option>
	<option value="FS"><%=Messages.get("FS", user.getLocale())%></option>
	<option value="GE"><%=Messages.get("GE", user.getLocale())%></option>
	<option value="GM"><%=Messages.get("GM", user.getLocale())%></option>
	<option value="GN"><%=Messages.get("GN", user.getLocale())%></option>
	<option value="GS"><%=Messages.get("GS", user.getLocale())%></option>
	<option value="HI"><%=Messages.get("HI", user.getLocale())%></option>
	<option value="IC"><%=Messages.get("IC", user.getLocale())%></option>
	<option value="II"><%=Messages.get("II", user.getLocale())%></option>
	<option value="IN"><%=Messages.get("IN", user.getLocale())%></option>
	<option value="IR"><%=Messages.get("IR", user.getLocale())%></option>
	<option value="KT"><%=Messages.get("KT", user.getLocale())%></option>
	<option value="LC"><%=Messages.get("LC", user.getLocale())%></option>
	<option value="LI"><%=Messages.get("LI", user.getLocale())%></option>
	<option value="LN"><%=Messages.get("LN", user.getLocale())%></option>
	<option value="LO"><%=Messages.get("LO", user.getLocale())%></option>
	<option value="ND"><%=Messages.get("ND", user.getLocale())%></option>
	<option value="NM"><%=Messages.get("NM", user.getLocale())%></option>
	<option value="NT"><%=Messages.get("NT", user.getLocale())%></option>
	<option value="P2"><%=Messages.get("P2", user.getLocale())%></option>
	<option value="PA"><%=Messages.get("PA", user.getLocale())%></option>
	<option value="PM"><%=Messages.get("PM", user.getLocale())%></option>
	<option value="PN"><%=Messages.get("PN", user.getLocale())%></option>
	<option value="PP"><%=Messages.get("PP", user.getLocale())%></option>
	<option value="PR"><%=Messages.get("PR", user.getLocale())%></option>
	<option value="RE"><%=Messages.get("RE", user.getLocale())%></option>
	<option value="RJ"><%=Messages.get("RJ", user.getLocale())%></option>
	<option value="RS"><%=Messages.get("RS", user.getLocale())%></option>
	<option value="RT"><%=Messages.get("RT", user.getLocale())%></option>
	<option value="SC"><%=Messages.get("SC", user.getLocale())%></option>
	<option value="SG"><%=Messages.get("SG", user.getLocale())%></option>
	<option value="SI"><%=Messages.get("SI", user.getLocale())%></option>
	<option value="SK"><%=Messages.get("SK", user.getLocale())%></option>
	<option value="SN"><%=Messages.get("SN", user.getLocale())%></option>
	<option value="SP"><%=Messages.get("SP", user.getLocale())%></option>
	<option value="SR"><%=Messages.get("SR", user.getLocale())%></option>
	<option value="SS"><%=Messages.get("SS", user.getLocale())%></option>
	<option value="ST"><%=Messages.get("ST", user.getLocale())%></option>
	<option value="SU"><%=Messages.get("SU", user.getLocale())%></option>
	<option value="TN"><%=Messages.get("TN", user.getLocale())%></option>
	<option value="TP"><%=Messages.get("TP", user.getLocale())%></option>
	<option value="TS"><%=Messages.get("TS", user.getLocale())%></option>
	<option value="TY"><%=Messages.get("TY", user.getLocale())%></option>
	<option value="UG"><%=Messages.get("UG", user.getLocale())%></option>
	<option value="US"><%=Messages.get("US", user.getLocale())%></option>
	<option value="UT"><%=Messages.get("UT", user.getLocale())%></option>
	<option value="Y1"><%=Messages.get("Y1", user.getLocale())%></option>
	<option value="Y2"><%=Messages.get("Y2", user.getLocale())%></option>
	<option value="ID"><%=Messages.get("ID", user.getLocale())%></option>
</select>
<input type="text" name="content4" size="20">
<select name="operator4">
  <option value="AND" selected >AND</option>
  <option value="OR">OR</option>
  <option value="NOT">NOT</option>
</select>
<br/>
<select name="prefix5">
	<option value="AU"><%=Messages.get("AU", user.getLocale())%></option>
	<option value="TI"><%=Messages.get("TI", user.getLocale())%></option>
	<option value="KW"><%=Messages.get("KW", user.getLocale())%></option>
	<option value="PU"><%=Messages.get("PU", user.getLocale())%></option>
	<option value="PY" selected><%=Messages.get("PY", user.getLocale())%></option>
	<option value="LA"><%=Messages.get("LA", user.getLocale())%></option>
	<option value="AB"><%=Messages.get("AB", user.getLocale())%></option>
	<option value="AM"><%=Messages.get("AM", user.getLocale())%></option>
	<option value="AP"><%=Messages.get("AP", user.getLocale())%></option>
	<option value="AT"><%=Messages.get("AT", user.getLocale())%></option>
	<option value="BI"><%=Messages.get("BI", user.getLocale())%></option>
	<option value="BN"><%=Messages.get("BN", user.getLocale())%></option>
	<option value="CB"><%=Messages.get("CB", user.getLocale())%></option>
	<option value="CC"><%=Messages.get("CC", user.getLocale())%></option>
	<option value="CD"><%=Messages.get("CD", user.getLocale())%></option>
	<option value="CH"><%=Messages.get("CH", user.getLocale())%></option>
	<option value="CL"><%=Messages.get("CL", user.getLocale())%></option>
	<option value="CN"><%=Messages.get("CN", user.getLocale())%></option>
	<option value="CO"><%=Messages.get("CO", user.getLocale())%></option>
	<option value="CP"><%=Messages.get("CP", user.getLocale())%></option>
	<option value="CR"><%=Messages.get("CR", user.getLocale())%></option>
	<option value="CS"><%=Messages.get("CS", user.getLocale())%></option>
	<option value="CY"><%=Messages.get("CY", user.getLocale())%></option>
	<option value="DA"><%=Messages.get("DA", user.getLocale())%></option>
	<option value="DC"><%=Messages.get("DC", user.getLocale())%></option>
	<option value="DE"><%=Messages.get("DE", user.getLocale())%></option>
	<option value="DR"><%=Messages.get("DR", user.getLocale())%></option>
	<option value="DT"><%=Messages.get("DT", user.getLocale())%></option>
	<option value="ES"><%=Messages.get("ES", user.getLocale())%></option>
	<option value="FC"><%=Messages.get("FC", user.getLocale())%></option>
	<option value="FD"><%=Messages.get("FD", user.getLocale())%></option>
	<option value="FI"><%=Messages.get("FI", user.getLocale())%></option>
	<option value="FN"><%=Messages.get("FN", user.getLocale())%></option>
	<option value="FQ"><%=Messages.get("FQ", user.getLocale())%></option>
	<option value="FS"><%=Messages.get("FS", user.getLocale())%></option>
	<option value="GE"><%=Messages.get("GE", user.getLocale())%></option>
	<option value="GM"><%=Messages.get("GM", user.getLocale())%></option>
	<option value="GN"><%=Messages.get("GN", user.getLocale())%></option>
	<option value="GS"><%=Messages.get("GS", user.getLocale())%></option>
	<option value="HI"><%=Messages.get("HI", user.getLocale())%></option>
	<option value="IC"><%=Messages.get("IC", user.getLocale())%></option>
	<option value="II"><%=Messages.get("II", user.getLocale())%></option>
	<option value="IN"><%=Messages.get("IN", user.getLocale())%></option>
	<option value="IR"><%=Messages.get("IR", user.getLocale())%></option>
	<option value="KT"><%=Messages.get("KT", user.getLocale())%></option>
	<option value="LC"><%=Messages.get("LC", user.getLocale())%></option>
	<option value="LI"><%=Messages.get("LI", user.getLocale())%></option>
	<option value="LN"><%=Messages.get("LN", user.getLocale())%></option>
	<option value="LO"><%=Messages.get("LO", user.getLocale())%></option>
	<option value="ND"><%=Messages.get("ND", user.getLocale())%></option>
	<option value="NM"><%=Messages.get("NM", user.getLocale())%></option>
	<option value="NT"><%=Messages.get("NT", user.getLocale())%></option>
	<option value="P2"><%=Messages.get("P2", user.getLocale())%></option>
	<option value="PA"><%=Messages.get("PA", user.getLocale())%></option>
	<option value="PM"><%=Messages.get("PM", user.getLocale())%></option>
	<option value="PN"><%=Messages.get("PN", user.getLocale())%></option>
	<option value="PP"><%=Messages.get("PP", user.getLocale())%></option>
	<option value="PR"><%=Messages.get("PR", user.getLocale())%></option>
	<option value="RE"><%=Messages.get("RE", user.getLocale())%></option>
	<option value="RJ"><%=Messages.get("RJ", user.getLocale())%></option>
	<option value="RS"><%=Messages.get("RS", user.getLocale())%></option>
	<option value="RT"><%=Messages.get("RT", user.getLocale())%></option>
	<option value="SC"><%=Messages.get("SC", user.getLocale())%></option>
	<option value="SG"><%=Messages.get("SG", user.getLocale())%></option>
	<option value="SI"><%=Messages.get("SI", user.getLocale())%></option>
	<option value="SK"><%=Messages.get("SK", user.getLocale())%></option>
	<option value="SN"><%=Messages.get("SN", user.getLocale())%></option>
	<option value="SP"><%=Messages.get("SP", user.getLocale())%></option>
	<option value="SR"><%=Messages.get("SR", user.getLocale())%></option>
	<option value="SS"><%=Messages.get("SS", user.getLocale())%></option>
	<option value="ST"><%=Messages.get("ST", user.getLocale())%></option>
	<option value="SU"><%=Messages.get("SU", user.getLocale())%></option>
	<option value="TN"><%=Messages.get("TN", user.getLocale())%></option>
	<option value="TP"><%=Messages.get("TP", user.getLocale())%></option>
	<option value="TS"><%=Messages.get("TS", user.getLocale())%></option>
	<option value="TY"><%=Messages.get("TY", user.getLocale())%></option>
	<option value="UG"><%=Messages.get("UG", user.getLocale())%></option>
	<option value="US"><%=Messages.get("US", user.getLocale())%></option>
	<option value="UT"><%=Messages.get("UT", user.getLocale())%></option>
	<option value="Y1"><%=Messages.get("Y1", user.getLocale())%></option>
	<option value="Y2"><%=Messages.get("Y2", user.getLocale())%></option>
	<option value="ID"><%=Messages.get("ID", user.getLocale())%></option>
</select>
<input type="text" name="content5" size="20">
<br/>
<input type="submit" value=" <%=Messages.get("SUBMIT_BUTTON", user.getLocale())%> " name="submit">
</form>


<jsp:include page="footer.jsp" flush="true"/>
