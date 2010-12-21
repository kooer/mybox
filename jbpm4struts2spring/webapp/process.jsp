<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:iterator value="processDefinitions">
  ${id}, ${name}, ${key}, ${version}<br>
</s:iterator>
