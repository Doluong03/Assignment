package controller;

import DomainModel.NhanVien;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import repositories.NhanVienRepository;

import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class LoginSerlet extends HttpServlet {
    private NhanVienRepository nvr = new NhanVienRepository();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("view", "login.jsp");
        request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ma = request.getParameter("ma");
        String matKhau = request.getParameter("matKhau");
        NhanVien nv = nvr.login(ma, matKhau);
        HttpSession session = request.getSession();
        if (nv == null) {
            session.setAttribute("errorMessage", "Sai tài khoản/mật khẩu");
            response.sendRedirect("/BaiTap_war/Login");
        } else {
            session.setAttribute("nv", nv);
            response.sendRedirect("/BaiTap_war/mua-hang/index");
        }

    }

}
