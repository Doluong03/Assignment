<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 3/21/2023
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="/BaiTap_war/css/bootstrap.min.css" />
</head>
<body>
<form method="POST"
      action="/BaiTap_war/mua-hang/update?ma=${hd.ma}">
    <h1 class="offset-4"> Thanh toán</h1>
    <div class="row mt-3">
        <div class="col-6">
            <label>Khách hàng </label>
            <select name="khachHang" class="form-select">
                <option value="KH1" ${ hd.khachHang.Ma == "KH1" ? "selected" : "" }>KH_A</option>
                <option value="KH2" ${ hd.khachHang.Ma == "KH2" ? "selected" : "" }>KH_B</option>
            </select>
        </div>
        <div class="col-6">
            <label>Nhân viên  </label>
            <select name="nhanVien" class="form-select">
                <option value="NV1" ${ hd.nhanVien.ma == "NV1" ? "selected" : "" }>NV_A</option>
                <option value="NV2" ${ hd.nhanVien.ma == "NV2" ? "selected" : "" }>NV_B</option>
            </select>
        </div>
    </div>
    <div class="row mt-3">

        <div class="col-6">
            <label>Mã</label>
            <input type="text" name="ma" class="form-control" value="${hd.ma}" />
        </div>
        <div class="col-6">
            <label>Ngày tạo </label>
            <input type="date" name="ngayTao" class="form-control" value="${hd.ngayTao}" />
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Ngày thanh toán </label>
            <input type="date" name="ngayThanhToan" class="form-control" value="${hd.ngayThanhToan}" />
        </div>
        <div class="col-6">
            <label>Ngày ship  </label>
            <input type="date" name="ngayShip" class="form-control" value="${hd.ngayShip}" />
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Ngày nhận  </label>
            <input type="date" name="ngayNhan" class="form-control" value="${hd.ngayNhan}" />
        </div>
        <div class="col-6">
            <label>Tình trạng </label>
            <select name="tinhTrang" class="form-select">
                <option value="0" ${ hd.tinhTrang == "1" ? "selected" : "" }>Đang giao </option>
                <option value="1" ${ hd.tinhTrang == "2" ? "selected" : "" }>Đã giao </option>
            </select>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Tên người nhận</label>
            <input type="text" name="tenNguoiNhan" class="form-control" value="${hd.tenNguoiNhan}" />
        </div>
        <div class="col-6">
            <label>SDT</label>
            <input type="tel" name="sdt" class="form-control" value="${hd.sdt}"/>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <label>Địa chỉ</label>
            <input type="text" name="diaChi" class="form-control"  value="${hd.diaChi}"/>
        </div>
        <div class="col-6">
            <label>Tổng tiền</label>
            <input type="text" name="tongTien" class="form-control"  value="${hd.tongTien}"/>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-6">
            <button class="btn btn-primary" >Thanh toán</button>
        </div>
        <div class="col-6"></div>
    </div>
</form>
<script src="/BaiTap_war/js/bootstrap.min.js"></script>
</body>
</html>



