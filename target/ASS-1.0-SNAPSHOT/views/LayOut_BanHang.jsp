<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 4/2/2023
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<link rel="stylesheet"
      href="/BaiTap_war/css/bootstrap.min.css" />
<header class="bg-light">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Web bán hàng</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Tìm kiếm">
                    <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                </form>
            </div>
        </nav>
    </div>
</header>

<!-- Main content -->
<main>
    <div class="container my-5">
        <div class="row">
            <!-- Sidebar -->
            <aside class="col-lg-3">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-tags me-2"></i>Danh mục sản phẩm
                    </div>
                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#">Điện thoại</a></li>
                            <li class="list-group-item"><a href="#">Laptop</a></li>
                            <li class="list-group-item"><a href="#">Tablet</a></li>
                            <li class="list-group-item"><a href="#">Phụ kiện</a></li>
                        </ul>
                    </div>
                </div>
            </aside>			<!-- Main content -->
            <div class="col-lg-9">
                <h1 class="mb-4">Sản phẩm nổi bật</h1>
                <div class="row">
                    <!-- Product item -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="https://dummyimage.com/300x200/000/fff" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Product title</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra leo quis vestibulum iaculis. Ut vel hendrerit lectus, eu faucibus neque. Sed sit amet bibendum augue.</p>
                                <a href="#" class="btn btn-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>

                    <!-- Product item -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="https://dummyimage.com/300x200/000/fff" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Product title</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra leo quis vestibulum iaculis. Ut vel hendrerit lectus, eu faucibus neque. Sed sit amet bibendum augue.</p>
                                <a href="#" class="btn btn-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>

                    <!-- Product item -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="https://dummyimage.com/300x200/000/fff" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Product title</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra leo quis vestibulum iaculis. Ut vel hendrerit lectus, eu faucibus neque. Sed sit amet bibendum augue.</p>
                                <a href="#" class="btn btn-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</main>

<!-- Footer -->
<footer class="bg-light py-3">
    <div class="container">
        <p class="text-center">&copy; 2023 Web bán hàng. All rights reserved.</p>
    </div>
</footer>

<script src="/BaiTap_war/js/jquery.min.js" />"></script>
<script src="/BaiTap_war/js/bootstrap.min.js" />"></script>
<script src="/BaiTap_war/js/bootstrap.bundle.min.js" />"></script>
<script src="/BaiTap_war/js/popper.js" />"></script>
</body>
</html>
