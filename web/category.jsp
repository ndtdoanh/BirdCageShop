<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/index.css">
        <link rel="stylesheet" href="static/css/root.css">
    </head>
    <body class="fade-in">
        <!-- header -->

        <div class="content">
            <!-- Sử dụng thẻ jsp:include để bao gồm header và footer -->
            <jsp:include page="header.jsp" />
            <!-- end header -->

            <!--start home section-->
            <!-- start hero -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="hero__categories">
                                <div class="hero__categories__all">
                                    <i class="fa fa-bars"></i>
                                    <span>PHÂN LOẠI SẢN PHẨM</span>
                                </div>
                                <ul>
                                    <c:forEach items ="${listCC}" var ="o">
                                        <li><a href="category?cid=${o.categoryID}">${o.categoryName}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            </br>
                            <div>
                                <div class="hero__categories">
                                    <i class="fa fa-bars"></i>
                                    <span>LỌC THEO KHOẢNG GIÁ</span>
                                </div>
                                <div> 
                                    <form method="post" action="category">

                                        <input type="checkbox" name="FilterPrice" value="0-500000" />Từ 0 - 500.000đ
                                        <br>
                                        <input type="checkbox" name="FilterPrice" value="500000-1000000" />Từ 500.000đ - 1.000.000đ
                                        <br>
                                        <input type="checkbox" name="FilterPrice" value="1000000-5000000" />1.000.000đ - 5.000.000đ
                                        <br>
                                        <input type="checkbox" name="FilterPrice" value="5000000-100000000" />Lớn hơn 5.000.000đ
                                        <br>
                                        <input type="submit" value="Tìm kiếm" />
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="hero__search">
                                <div class="hero__search__form">
                                    <form action="search" method="GET">
                                        <input type="text" name="search" placeholder="Tìm kiếm sản phẩm..." fdprocessedid="5py24">
                                        <button type="submit" class="site-btn" fdprocessedid="6hi3um">SEARCH</button>
                                    </form>
                                </div>
                                <div class="hero__search__phone">
                                    <div class="hero__search__phone__icon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <div class="hero__search__phone__text">
                                        <h5>+65 11.188.888</h5>
                                        <span>Hỗ trợ 24/7</span>
                                    </div>
                                </div>
                            </div>

                            <section class="">
                                <div class="container">
                                    <div class="row featured__filter">
                                        <c:set var="listS" value="${requestScope.listS}" />
                                        <c:forEach items="${listS}" var="x">
                                            <c:if test="${x.status eq '1'}">
                                                <div class="col-lg-3 col-md-4 col-sm-6">
                                                    <div class="featured__item " data-aos="fade-up">
                                                        <div class="featured__item__pic set-bg">
                                                            <img src="${x.image}" alt="">

                                                            <ul class="featured__item__pic__hover">
                                                                <!-- ảnh sản phẩm -->
                                                                <li><a href="WishlistServlet?id=${x.cageID}&type=home"><i class="fa fa-heart"></i></a></li>
                                                                <li><a href="CartController?id=${x.cageID}&quantity=1&type=home"><i class="fa fa-shopping-cart"></i></a></li>
                                                                <li><a href="ProductDetail?id=${x.cageID}"><i class="fa-solid fa-circle-info"></i></a></li>
                                                            </ul>
                                                        </div>

                                                        <div class="featured__item__text">
                                                            <h6><a href="#" title="View Product">${x.cageName}</a></h6>
                                                            <h5>${x.priceNew} VNĐ</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div> 
                            </section>
                        </div>

                    </div>
                </div>
                <!-- end hero -->

                <jsp:include page="footer.jsp" />
                <!-- end item -->

            </section>
            <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
            <script src="static/js/index.js"></script>

    </body>
</html>
