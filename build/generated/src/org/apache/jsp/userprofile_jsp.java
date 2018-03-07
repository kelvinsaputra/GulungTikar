package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("        <title>GulungTikar Register</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap core CSS -->\r\n");
      out.write("        <link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\r\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Custom styles for this template -->\r\n");
      out.write("        <link type=\"text/css\" href=\"css/shop-homepage.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <!-- Navigation -->\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "nav.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Page Content -->\r\n");
      out.write("        <div class=\"container\" style=\"padding-top: 5%\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-md-4\">\r\n");
      out.write("                    <form action=\"\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("                        <img alt=\"User picture\" src=\"css/Bikesgray.jpg\" class=\"img-fluid rounded\"/>    \r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"file\" name=\"file\" id=\"file\" required>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button class=\"btn btn-primary\" id=\"upload-button\" type=\"submit\">Upload image</button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-6 mx-auto\">\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <h2>Your Profile</h2>\r\n");
      out.write("                        Email\r\n");
      out.write("                        Rekening\r\n");
      out.write("                        Saldo\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <h2>Edit Your Profile</h2>\r\n");
      out.write("                        <form action=\"\" method=\"post\">\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <input type=\"password\" class=\"form-control\" id=\"editPassword\" placeholder=\"New Password\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <input type=\"password\" class=\"form-control\" id=\"editPasswordRetype\" placeholder=\"Retype New Password\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"editName\" placeholder=\"New Display Name\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"editAddress\" placeholder=\"New Address\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <button class=\"btn btn-danger\">Cancel</button>\r\n");
      out.write("                            <button class=\"btn btn-success\">Save</button>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <br>\r\n");
      out.write("\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap core JavaScript -->\r\n");
      out.write("        <script src=\"vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
