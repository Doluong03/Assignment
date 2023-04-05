package controller.admin;

import DomainModel.*;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import repositories.*;
import viewModel.QLHoaDonCT;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//import repositories.MuaHangRepository;

@WebServlet({
        "/mua-hang/index",    // GET
        "/mua-hang/index2",    // GET
        "/mua-hang/create",   // GET
        "/mua-hang/edit",     // GET
        "/mua-hang/delete",   // GET
        "/mua-hang/thanhToan",    // POST
        "/mua-hang/update",   // POST
})
public class MuaHangServlet extends HttpServlet {
    private ChiTietSpRepository ctsr = new ChiTietSpRepository();
    private HoaDonRepository hdr = new HoaDonRepository();
    ArrayList<HoaDonChiTiet> ListOut = new ArrayList<>();
    ArrayList<HoaDon> ListHD = (ArrayList<HoaDon>) hdr.findAll();
    private MuaHangRepository mhr = new MuaHangRepository();
    private KhachHangRepository khr = new KhachHangRepository();
    private NhanVienRepository nvr = new NhanVienRepository();
    private HoaDonChiTietRepository hdctr = new HoaDonChiTietRepository();

    public MuaHangServlet() {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("index2")) {
            this.index2(request, response);
        } else if (uri.contains("edit")) {
            this.edit(request, response);
        } else if (uri.contains("delete")) {
            this.delete(request, response);
        } else if (uri.contains("thanhToan")) {
            this.thanhToan(request, response);
        } else {
            this.index(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.update(request, response);
    }

    protected void index(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        request.setAttribute("listCt", ctsr.findAll());
        request.setAttribute("view", "/views/muaHang.jsp");
        request.getRequestDispatcher("/views/layout.jsp")
                .forward(request, response);
    }


    protected void edit(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String ma = request.getParameter("ma");
        ChiTietSP qlct = this.ctsr.findByMa(ma);
//        System.out.println(ListHD.size());
        if (ListOut.isEmpty()) {
            HoaDon hd = mhr.taoHD(ListHD, new HoaDon());
            mhr.addHD(hd);
            HoaDonChiTiet qlhd = new HoaDonChiTiet(hd, qlct, 1);
            ctsr.addCart(qlhd, ListOut, qlct);
            for (HoaDonChiTiet x : ListOut) {
                hdctr.insert(x);
            }
        } else {
            HoaDon hd = hdr.findByMa((ListOut.get(0).getHoaDon().getMa()));
            HoaDonChiTiet qlhd = new HoaDonChiTiet(hd, qlct, 1);
            ctsr.addCart(qlhd, ListOut, qlct);
            for (HoaDonChiTiet x : ListOut) {
                hdctr.insert(x);
            }
        }
        request.setAttribute("ct", qlct);
        response.sendRedirect("/BaiTap_war/mua-hang/index2");
//
    }

    protected void index2(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        request.setAttribute("listCt2", ListOut);
        request.setAttribute("view", "/views/thanhToan.jsp");
        request.getRequestDispatcher("/views/layout.jsp")
                .forward(request, response);
    }

    //
    protected void delete(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String ma = request.getParameter("ma");
        HoaDonChiTiet qlct = this.ctsr.findByMa2(ma, ListOut);
        ListOut.remove(qlct);
        hdctr.delete(qlct);
        response.sendRedirect("/BaiTap_war/mua-hang/index2");
    }

    protected void thanhToan(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String ma = request.getParameter("ma");
        double total = Double.parseDouble(request.getParameter("total"));
        System.out.println(total);
        System.out.println(ma);
        HoaDon hd = hdr.findByMa(ma);
        request.setAttribute("hd", hd);
        hd.setTongTien(total);
        request.setAttribute("view", "/views/tt.jsp");
        request.getRequestDispatcher("/views/layout.jsp")
                .forward(request, response);
    }

    public static KhachHang convertToKhachHang(String khachHangString) {
        KhachHang khachHang = null;
        try {
            // Chuyển đổi chuỗi JSON thành đối tượng KhachHang
            Gson gson = new Gson();
            khachHang = gson.fromJson(khachHangString, KhachHang.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return khachHang;
    }

    protected void update(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String ma = request.getParameter("ma");
        HoaDon hd = hdr.findByMa(ma);
        String maNv = request.getParameter("nhanVien");
        String maKh = request.getParameter("khachHang");
        KhachHang khachHang =khr.findByMa(maKh);
        if (khachHang != null) {
            hd.setKhachHang(khachHang);
        }
        NhanVien nhanVien = nvr.findByMa(maNv);
        if (nhanVien != null) {
            hd.setNhanVien(nhanVien);
        }
        Map<String, String[]> paramMap = new HashMap<>(request.getParameterMap());
        paramMap.remove("khachHang");
        paramMap.remove("nhanVien");
        try {
            ConvertUtils.register( new DateConverter(null), Date.class);
            Date ngayTao = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayTao"));
            Date ngayThanhToan = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayThanhToan"));
            Date ngayShip = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayShip"));
            Date ngayNhan = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayNhan"));
            hd.setNgayTao(ngayTao);
            hd.setNgayThanhToan(ngayThanhToan);
            hd.setNgayShip(ngayShip);
            hd.setNgayNhan(ngayNhan);
            BeanUtils.populate(hd, paramMap);
            hdr.update(hd);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // Tạo ArrayList & thêm vào
        response.sendRedirect("/BaiTap_war/hoa-don/index");
    }
}
