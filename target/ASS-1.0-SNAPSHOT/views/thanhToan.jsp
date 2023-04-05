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
<div class="col-10 offset-1 mt-5 table-responsive">
    <di v>
        <h1 class="offset-5 mb-5">Giỏ hàng</h1>
    </div>
    <c:if test="${ f:length(listCt2) == 0 }">
        <img class="offset-3" src="../Anh/empty_cart.png">
        <div>
            <a  class="btn btn-outline-danger btn-sm offset-5 px-5 mb-5" href="/BaiTap_war/mua-hang/index">Mua ngay</a>
        </div>

    </c:if>
    <c:if test="${ f:length(listCt2) != 0 }" var ="ma">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Sản phẩm </th>
                <th scope="col"> Tên Sản phẩm </th>
                <th scope="col">Số lượng</th>
                <th scope="col">Tổng tiền</th>
                <th colspan="2">Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <tbody>
        <c:set var="ma_hd" value="" />
        <c:set var="total" value="0" />
        <c:forEach items="${listCt2}" var="ct" >
                <tr>
                    <td> <img src="/BaiTap_war/Anh/${ct.chiTietSP.anh}" alt="${sp.sanPham.ten}"> </td>
                    <td>${ ct.chiTietSP.sanPham.ten }</td>
                    <td>${ ct.soLuong }</td>
                    <td>${ ct.tongTien }</td>
                    <td>
                        <a href="/BaiTap_war/mua-hang/delete?ma=${ct.chiTietSP.ma}" class="btn btn-primary">remove</a>
                    </td>
                </tr>
                <c:set var="ma_hd" value="${ct.hoaDon.ma}" />
                <c:set var="total" value="${total + ct.tongTien}" />
            </c:forEach>
            </tbody>
            </tbody>
        </table>
        <div class="row">
            <a class="btn btn-primary btn-sm col-1 offset-2" href="/BaiTap_war/mua-hang/index">Add more</a>
            <a class="btn btn-primary btn-sm col-1 offset-2"  href="/BaiTap_war/mua-hang/thanhToan?ma=${ma_hd}&total=${total}">Thanh toan</a>
        </div>

    </c:if>
</div>
<script src="/BaiTap_war/js/bootstrap.min.js"></script>
</body>
</html>



