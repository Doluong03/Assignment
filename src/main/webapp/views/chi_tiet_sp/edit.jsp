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
          href="/BaiTap_war/css/bootstrap.min.css" />
</head>
<body>
<div class="col-8 offset-2">
    <form method="POST"
          action="/BaiTap_war/chi-tiet-sp/update?ma=${ct.ma}">
        <h1 class="offset-4"> Chi tiết sản phẩm </h1>
        <div class="row mt-3">

            <div class="col-6">
                <label>Sản phẩm</label>
                <select name="sanPham" class="form-select">
                    <c:forEach items="${listSP}" var="sp">
                        <option value="${sp.ma}" ${ ct.sanPham.ma == sp.ma ? "selected" : "" }>${sp.ten}</option>
                    </c:forEach>

                </select>
            </div>
            <div class="col-6">
                <label>NSX</label>
                <select name="nsx" class="form-select">
                    <c:forEach items="${listNSX}" var="nsx">
                        <option value="${nsx.ma}" ${ ct.nsx.ma == nsx.ma ? "selected" : "" }>${nsx.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-6">
                <label>Dòng sản phẩm</label>
                <select name="dongSP" class="form-select">
                    <c:forEach items="${listDSP}" var="dsp">
                        <option value="${dsp.ma}" ${ ct.dongSP.ma == dsp.ma ? "selected" : "" }>${dsp.ten}</option>
                    </c:forEach>

                </select>
            </div>
            <div class="col-6">
                <label>Màu sắc </label>
                <select name="mauSac" class="form-select">
                    <c:forEach items="${listMS}" var="ms">
                        <option value="${ms.ma}" ${ ct.mauSac.ma == ms.ma ? "selected" : "" }>${ms.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Mã</label>
                <input type="text" name="ma" class="form-control" value="${ct.ma}" />
            </div>
            <div class="col-6">
                <label>Năm bảo hành </label>
                <input type="number" name="namBh" class="form-control" value="${ct.namBh}" />
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Mô tả</label>
                <input type="text" name="moTa" class="form-control" value="${ct.moTa}" />
            </div>
            <div class="col-6">
                <label> Số lượng tồn</label>
                <input type="number" name="soLuongTon" class="form-control" value="${ct.soLuongTon}"/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Giá nhập   </label>
                <input type="number" name="giaNhap" class="form-control" value="${ct.giaNhap}"/>
            </div>
            <div class="col-6">
                <label>Giá bán </label>
                <input type="number" name="giaBan" class="form-control" value="${ct.giaBan}"/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <div class="input-group mb-3">
                    <input type="file" class="form-control" id="inputGroupFile02" name="anh"
                           value="${ct.anh}">
                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
                </div>
            </div>

        </div>
        <div class="row mt-3">
            <div class="col-6">
                <button class="btn btn-primary">Cập Nhật</button>
            </div>
            <div class="col-6"></div>
        </div>
    </form>
</div>

<script src="/SP23B2_SOF3011_IT17321_war/js/bootstrap.min.js"></script>
</body>
</html>

