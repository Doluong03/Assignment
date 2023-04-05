<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 3/21/2023
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .product {
        display: inline-block;
        margin: 10px;
        margin-left: 0px;
        padding: 10px;
        border: 1px solid #ccc;
        width: 230px;
        height: 350px;
        text-align: center;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        position: relative;
        display: inline-block;
        background-color: #ffffff;
    }

    .product img {
        max-width: 100%;
        height: 150px;
        margin: 10px 0;
        transition: transform 0.2s ease-in-out;

    }

    .product img:hover {
        transform: scale(1.1);
        cursor: pointer;
        z-index: 1;
    }
</style>

<div class="col-11 mt-5 table-responsive" >
    <div class="ms-4 mb-5">
        <a class="btn btn-outline-primary me-4" type="submit" ><img  style="width: 270px ; height: 280px" src="/BaiTap_war/Anh/501_ID0101_1.jpg" alt=""> </a>
        <a class="btn btn-outline-primary me-4" type="submit" ><img  style="width: 270px ; height: 280px" src="/BaiTap_war/Anh/501_ID0101_1.jpg" alt=""></a>
        <a class="btn btn-outline-primary me-4" type="submit" ><img  style="width: 270px ; height: 280px" src="/BaiTap_war/Anh/501_ID0101_1.jpg" alt=""></a>
        <a class="btn btn-outline-primary me-4" type="submit" ><img  style="width: 270px ; height: 280px" src="/BaiTap_war/Anh/501_ID0101_1.jpg" alt=""></a>
    </div>
   
    <div class="offset-4 me-5 ps-2">
        <h1 class="offset-3 mb-5 ms-5 ">Sản phẩm</h1>
    </div>
    <c:if test="${ f:length(listCt) == 0 }">
        <h3>Không có dữ liệu</h3>
    </c:if>
    <c:if test="${ f:length(listCt) != 0 }">
        <div class="row me-2">
            <c:forEach var="sp" items="${listCt}">
                <div class="col-sm-2 ms-4 mb-3">
                    <div class="product">
                        <img src="/BaiTap_war/Anh/${sp.anh}" alt="${sp.sanPham.ten}">
                        <h5>${sp.sanPham.ten}</h5>
                                                    <p class="">${sp.moTa}</p>
                        <div class="text-danger fw-bolder">
                            <fmt:formatNumber type="number" value="${sp.giaBan}" pattern="#,##0 ₫" />
                        </div>
                        <a href="/BaiTap_war/mua-hang/edit?ma=${sp.ma}" class="btn btn-outline-primary mt-1">Thêm vào giỏ hàng</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div>
            <h1 class="offset-4 me-5 mb-5 mt-5">Sản phẩm bán chạy</h1>
        </div>
        <div class="row">
            <c:forEach var="sp" items="${listCt}">
                <c:if test="${sp.giaBan<500000}">
                <div class="col-sm-2 ms-4 mb-3">
                    <div class="product">
                        <img src="/BaiTap_war/Anh/${sp.anh}" alt="${sp.sanPham.ten}">
                        <h5>${sp.sanPham.ten}</h5>
                                                    <p class="">${sp.moTa}</p>
                        <div class="text-danger fw-bolder">
                            <fmt:formatNumber type="number" value="${sp.giaBan}" pattern="#,##0 ₫" />
                        </div>
                        <a href="/BaiTap_war/mua-hang/edit?ma=${sp.ma}" class="btn btn-outline-primary mt-1">Thêm vào giỏ hàng</a>
                    </div>
                </div>
                </c:if>
            </c:forEach>
        </div>

    </c:if>
</div>


