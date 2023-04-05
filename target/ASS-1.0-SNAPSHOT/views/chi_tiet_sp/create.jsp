<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 3/13/2023
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="/BaiTap_war/css/bootstrap.min.css"/>
</head>
<body>
<div class="col-8 offset-2">
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form method="POST"
          action="/BaiTap_war/chi-tiet-sp/store">
        <h1 class="offset-4"> Chi tiết sản phẩm </h1>
        <div class="row mt-3">

            <div class="col-6">
                <label>Sản phẩm</label>
                <select name="sanPham" class="form-select">
                    <c:forEach items="${listSP}" var="sp">
                        <option value="${sp.ma}">${sp.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-6">
                <label>NSX</label>
                <select name="nsx" class="form-select">
                    <c:forEach items="${listNSX}" var="nsx">
                        <option value="${nsx.ma}">${nsx.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-6">
                <label>Dòng sản phẩm</label>
                <select name="dongSp" class="form-select">
                    <c:forEach items="${listDSP}" var="dsp">
                        <option value="${dsp.ma}">${dsp.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-6">
                <label>Màu sắc </label>
                <select name="mauSac" class="form-select">
                    <c:forEach items="${listMS}" var="ms">
                        <option value="${ms.ma}">${ms.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-6">
                <label>Mã</label>
                <input type="text" name="ma" class="form-control" value="${not empty ma ? ma : ''}"/>
            </div>
            <div class="col-6">
                <label>Năm bảo hành </label>
                <input type="number" name="namBh" class="form-control" value="${not empty namBh ? namBh : ''}"/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Mô tả</label>
                <input type="text" name="moTa" class="form-control" value="${not empty moTa ? moTa : ''}"/>
            </div>
            <div class="col-6">
                <label> Số lượng tồn</label>
                <input type="number" name="soLuongTon" class="form-control"
                       value="${not empty soLuongTon ? soLuongTon : ''}"/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Giá nhập </label>
                <input type="number" name="giaNhap" class="form-control" value="${not empty giaNhap ? giaNhap : ''}"/>
            </div>
            <div class="col-6">
                <label>Giá bán </label>
                <input type="number" name="giaBan" class="form-control" value="${not empty giaBan ? giaBan : ''}"/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <div class="input-group mb-3">
                    <input type="file" class="form-control" id="inputGroupFile02" name="anh"
                           value="${not empty anh ? anh : ''}">
                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
                </div>
            </div>

        </div>
        <div class="row mt-3">
            <div class="col-6">
                <button class="btn btn-primary">Thêm mới</button>
            </div>
            <div class="col-6"></div>
        </div>
    </form>
</div>

<script src="/SP23B2_SOF3011_IT17321_war/js/bootstrap.min.js"></script>
</body>
</html>
