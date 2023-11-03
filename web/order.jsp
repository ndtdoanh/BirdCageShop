<%-- 
    Document   : order
    Created on : Oct 18, 2023, 2:10:07 AM
    Author     : HOANGDUC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="static/css/order.css"/>
        <link rel="stylesheet" href="static/css/root.css">
    </head>
    <body class="fade-in">
        <jsp:include page="header.jsp" />
        <% List<Order> listOrder = (List<Order>) request.getAttribute("listOrder"); %>
        <div class="mainOder" >
            <h2>Đơn hàng của bạn</h2>
            <div class="container padding-bottom-3x mb-1">
                <!-- Shopping Cart-->
                <div class="table-responsive shopping-cart">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="text-center">Mã đơn hàng</th>
                                <th class="text-center">Loại lồng</th>
                                <th class="text-center">Ngày đặt hàng</th>
                                <th class="text-center">Số điện thoại</th>
                                <th class="text-center">Địa chỉ</th>
                                <th class="text-center">Phí Ship</th>
                                <th class="text-center">Tổng Tiền</th>
                                <th class="text-center">Tình Trạng</th>
                                <th class="text-center">Chi tiết</th>
                                <th class="text-center">Chi tiết 2</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Order o : listOrder) {
                            %>
                            <tr>
                                <td class="text-center text-lg text-medium"><%=o.getOrderID()%></td>
                                <td class="text-center text-lg text-medium"><%=o.getCageName()%></td>
                                <td class="text-center text-lg text-medium"><%=o.getOrderDate()%></td>   
                                <td class="text-center text-lg text-medium"><%=o.getPhone()%></td>
                                <td class="text-center text-lg text-medium"><%=o.getAddress()%></td>
                                <td class="text-center text-lg text-medium"><fmt:formatNumber value="<%=o.getShipCost()%>" pattern="###,###"/> VNĐ</td>
                                <td class="text-center text-lg text-medium"><fmt:formatNumber value="<%=o.getTotal()%>" pattern="###,###"/> VNĐ</td>
                                <td class="text-center text-lg text-medium"><%=o.isStatus() ? "Chưa thanh toán" : "Đã hủy"%></td>
                                <td class="text-center text-lg text-medium"><a href="DetailOrder?orderId=<%=o.getOrderID()%>&cageId=<%=o.getCageID()%>"><i class="fa-solid fa-eye" style="color: red;"></i></a></td>
                                        <% if (o.isStatus() == true) {%>
                                <td class="text-center text-lg text-medium"><a href="OrderController?orderId=<%=o.getOrderID()%>">Hủy Đơn Hàng</a></td>
                                <% } %>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>