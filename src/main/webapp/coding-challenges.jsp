<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />

    <title>Coding Challenges</title>

    <meta
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
            name="viewport"
    />

    <!-- Canonical SEO -->
    <link
            rel="canonical"
            href="https://www.creative-tim.com/product/fresh-bootstrap-table"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <link href="${pageContext.request.contextPath}/resources/assets/css/fresh-bootstrap-table.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet"/>

    <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
            integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
            crossorigin="anonymous"
    />
    <link
            href="http://fonts.googleapis.com/css?family=Roboto:400,700,300"
            rel="stylesheet"
            type="text/css"
    />

    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table/dist/bootstrap-table.min.js"></script>
</head>
<body style="background: #ffffff">
<iframe target="_top" src="navbar.jsp" frameborder="0" width="100%" style="border:none;"></iframe>
<div class="wrapper" style="margin-top: -50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="description">
                    <h2 style="color: #000000; font-weight: 600">
                        Coding Challenges
                    </h2>
                </div>
                <div class="fresh-table full-color-orange">
                    <table id="fresh-table" class="table">
                        <thead>
                        <th data-field="id" data-sortable="true">ID</th>
                        <th data-field="name" data-sortable="true">Title</th>
                        <th data-field="salary" data-sortable="true">Score</th>
                        <th data-field="country">Tags</th>
                        <th data-field="city" data-sortable="true">Difficulty</th>
                        <th>Link</th>
                        <th
                                data-field="actions"
                                data-formatter="operateFormatter"
                                data-events="operateEvents"
                        >
                        </th>
                        </thead>
                        <tbody>
                        <c:forEach var="challenge" items="${challenges}">
                            <tr>
                                <td><c:out value="${challenge.challengeId}"/></td>
                                <td><c:out value="${challenge.challengeTitle}"/></td>
                                <td><c:out value="${challenge.maxScore}"/></td>
                                <td><c:out value="DSA"/></td>
                                <td><c:out value="${challenge.difficultyLevel}"/></td>
                                <td><a href="/challenges/${challenge.challengeId}" target="_blank"><i
                                        class="fa-solid fa-arrow-up-right-from-square"></i></a></td>
                                <td style="display: none"><a href="#" target="_blank"></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var $table = $("#fresh-table");
    var $alertBtn = $("#alertBtn");

    window.operateEvents = {
        "click .like": function (e, value, row, index) {
            alert("You click like icon, row: " + JSON.stringify(row));
            console.log(value, row, index);
        },
        "click .edit": function (e, value, row, index) {
            alert("You click edit icon, row: " + JSON.stringify(row));
            console.log(value, row, index);
        },
        "click .remove": function (e, value, row, index) {
            $table.bootstrapTable("remove", {
                field: "id",
                values: [row.id],
            });
        },
    };

    function operateFormatter(value, row, index) {
        return [
            '<a href="/challenges/1"',
            '<i class="fa-solid fa-arrow-up-right-from-square"></i>',
            "</a>",
        ].join("");
    }

    $(function () {
        $table.bootstrapTable({
            classes: "table table-hover table-striped",
            toolbar: ".toolbar",

            search: true,
            showRefresh: false,
            showToggle: false,
            showColumns: false,
            pagination: true,
            striped: true,
            sortable: true,
            pageSize: 8,
            pageList: [8, 10, 25, 50, 100],

            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                return "";
            },
            formatRecordsPerPage: function (pageNumber) {
                return pageNumber;
            },
        });
    });
</script>

<script>
    (function (i, s, o, g, r, a, m) {
        i["GoogleAnalyticsObject"] = r;
        (i[r] =
            i[r] ||
            function () {
                (i[r].q = i[r].q || []).push(arguments);
            }),
            (i[r].l = 1 * new Date());
        (a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m);
    })(
        window,
        document,
        "script",
        "//www.google-analytics.com/analytics.js",
        "ga"
    );

    ga("create", "UA-46172202-1", "auto");
    ga("send", "pageview");
</script>
</html>