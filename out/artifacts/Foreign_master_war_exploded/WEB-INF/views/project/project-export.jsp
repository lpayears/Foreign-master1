<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/3/25
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--假装我是代码，代码一定要对齐，对齐，对齐！-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>国际业务管理系统</title>

    <script type="text/javascript" src="${cp}/js/jquery.js"></script>

    <link href="${cp}/css/button.css" rel="stylesheet" >
    <link href="${cp}/css/style.css" rel="stylesheet">
    <link href="${cp}/css/loader-style.css" rel="stylesheet" >
    <link href="${cp}/css/bootstrap.css" rel="stylesheet" >
    <script src="${cp}/js/layer.js" type="text/javascript"></script>

    <link rel="stylesheet"
          href="${cp}/js/tree/treetable/stylesheets/jquery.treetable.css">
    <link rel="stylesheet"
          href="${cp}/js/tree/treetable/stylesheets/jquery.treetable.theme.default.css">

    <link href="${cp}/js/tree/tabelizer/tabelizer.min.css" media="all"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet"
          href="${cp}/js/datepicker/bootstrap-datetimepicker.css">
    <link href="${cp}/css/bootstrap-select.css" rel="stylesheet" >
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/js/respond.min.js"></script>


    <![endif]-->
</head>

<body>

<!-- 中间内容 -->

<!-- 控制栏 -->
<!--  PAPER WRAP -->
<div>

    <!-- 详情模态框 -->
    <div class="modal fade" id="detail-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">预付</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="deatil-form">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">联系地址</label>
                            <div class="col-sm-10">
                                <label type="text" class="form-control" name="address"
                                       id="detail-address"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">业务时间</label>
                            <div class="col-sm-10">
                                <label type="text" class="form-control" name="yw_time"
                                       id="detail-yw_time"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">所属国别</label>
                            <div class="col-sm-10">
                                <label type="text" class="form-control" name="country_code.c_name"
                                       id="detail-country_code"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">币种</label>
                            <div class="col-sm-10">
                                <label type="text" class="form-control" name="currency_code.c_name"
                                       id="detail-currency_code"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">经办人员</label>
                            <div class="col-sm-10">
                                <label type="text" class="form-control" name="user_id.name"
                                       id="detail-user_id"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">核查时间</label>
                            <div class="col-sm-10">
                                <label type="text" class="form-control" name="check_time"
                                       id="detail-check_time"></label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <div class="wrap-fluid">
        <div class="container-fluid paper-wrap bevel tlbr">


            <!-- CONTENT -->
            <!--TITLE -->
            <div class="row">
                <div id="paper-top">


                    <div class="col-sm-7">
                        <div class="devider-vertical visible-lg"></div>


                    </div>
                    <div class="col-sm-2">
                        <div class="devider-vertical visible-lg"></div>


                    </div>
                </div>
            </div>
            <!--/ TITLE -->

            <!-- BREADCRUMB -->
            <ul id="breadcrumb">
                <li><a href="#" title="Sample page 1">报表管理</a></li>
            </ul>

            <!-- END OF BREADCRUMB -->



            <!-- END OF BREADCRUMB -->
            <div class="content-wrap">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="nest" id="tabletreeClose">
                            <div class="title-alt">
                                <h6>预付列表</h6>
                                <div class="titleClose">
                                    <a class="gone" href="#tabletreeClose"> <span
                                            class="entypo-cancel"></span>
                                    </a>
                                    <div class="titleToggle">
                                        <a class="nav-toggle-alt" href="#tabletree"> <span
                                                class="entypo-up-open"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="body-nest" id="tabletree">


                                <form class="form-inline" id="search-form">
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">开始时间</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_time" class="sr-only"></label> <input
                                            type="text" class="form-control date form_datetime " id="start_time"
                                            name="start_time">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">结束时间</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="end_time" class="sr-only"></label> <input
                                            type="text" class="form-control date form_datetime" id="end_time"
                                            name="end_time">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">状态</p>
                                    </div>
                                    <select class="select-width" name="status" id="select-status" >
                                        <option value=""></option>
                                        <option value="1">已收回</option>
                                        <option value="0">未收回</option>
                                        <option value="2">已逾期</option>
                                        <option value="3">已处置</option>
                                    </select>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">类型</p>
                                    </div>
                                    <select class="select-width" name="type" id="select-type" >
                                        <option value=""></option>
                                        <option value="1">小于十五天</option>
                                        <option value="2">大于十五天</option>
                                    </select>

                                    <!--<button type="submit" class="btn btn-default">Confirm identity</button>-->
                                    <button type="button" class="btn btn-primary" id="search-btn">搜索</button>
                                    <button type="button" class="btn btn-info"
                                            id="reset-search-btn">取消
                                    </button>
                                    <button type="button" class="btn btn-primary kaoyou"
                                            id="export">导出
                                    </button>
                                </form>

                                <table id="example-advanced" class="project-table">


                                    <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>序号</th>
                                        <th>业务编号</th>
                                        <th>汇款公司</th>
                                        <th>承诺日期</th>
                                        <th>联系方式</th>
                                        <th>金额</th>
                                        <th>状态</th>
                                        <th>详细信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>

                            </div>
                            <div class="row">
                                <!-- 分页信息 -->
                                <div class="col-md-4" id="page-info"></div>
                                <!-- 分页条 -->
                                <div class="col-md-offset-9 col-md-5">
                                    <nav aria-label="Page navigation" id="page-nav"></nav>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
            </div>
            <!-- /END OF CONTENT -->


            <!-- FOOTER -->
            <div class="footer-space"></div>
            <div id="footer">
                <div class="devider-footer-left"></div>
                <div class="time">
                    <p id="spanDate">
                    <p id="clock">
                </div>


            </div>
            <!-- / END OF FOOTER -->

        </div>
    </div>
    <!--  END OF PAPER WRAP -->
</div>
<script type="text/javascript" src="${cp}/js/preloader.js"></script>
<script type="text/javascript" src="${cp}/js/bootstrap.js"></script>
<script type="text/javascript" src="${cp}/js/app.js"></script>
<script type="text/javascript" src="${cp}/js/load.js"></script>
<script type="text/javascript" src="${cp}/js/main.js"></script>
<script src="${cp}/js/tree/jquery.treeview.js" type="text/javascript"></script>


<script src="${cp}/js/tree/lib/jquery.cookie.js"
        type="text/javascript"></script>

<script src="${cp}/js/tree/tabelizer/jquery-ui-1.10.4.custom.min.js"></script>
<script src="${cp}/js/tree/tabelizer/jquery.tabelizer.js"></script>

<script src="${cp}/js/tree/treetable/vendor/jquery-ui.js"></script>
<script
        src="${cp}/js/tree/treetable/javascripts/src/jquery.treetable.js"></script>
<script type="text/javascript"
        src="${cp}/js/datepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="${cp}/js/datepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${cp}/js/myplugin.js"></script>
<script type="text/javascript" src="${cp}/js/bootstrap-select.js"></script>

<script type="text/javascript">
    var totalRecord,currentPage;
    $(function () {
        $("#browser,#browser2").treeview({
            animated:"fast",
            collapsed:false,
            unique:true,
            persist:"cookie",
            toggle:function () {
                window.console&& console.log("%o was toggled", this);
            }
        });
        to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url: '${cp}/getProjectList',
            method: 'get',
            data: $.param({
                'pn': pn
            }) +'&'+$('#search-form').serialize(),
            async: false,
            success: function (result) {
                if (result.code == 200) {
                    alert('出现错误')
                    return;
                }
                //console.info(result.info.branches);
                build_table(result.info.pageInfo.list);
                build_page_info(result.info.pageInfo);
                build_nav(result.info.pageInfo);
            }
        })
    }
    function build_table(list) {
        //清空表格
        $('.project-table tbody').empty();
        //console.log(list);
        $.each(list, function (index, item) {
            var idTd = $('<td scope="row"></td>').append(item.id);
            var orderTd=$('<td></td>').append(item.order_no);
            var numTd = $('<td></td>').append(item.num);
            var companyTd = $('<td></td>').append(item.company_id.company_name);
            var bookTd = $('<td></td>').append(getDate(item.book_time));
            var phoneTd = $('<td></td>').append(item.cellphone);
            var moneyTd = $('<td></td>').append(item.money);
            var statusTd = $('<td></td>').append(
                item.status == '0' ? '待销账' : (item.status == '1'?'已销账':(item.status == '2'?'已逾期':'已处置')));

            var detailBtn = $('<button></button>').addClass(
                'btn btn-info btn-xs detail-btn').append('详情').attr(
                'detail-id', item.id);
            $('<tr></tr>').append(idTd).append(orderTd).append(numTd).append(companyTd).append(bookTd).append(phoneTd).append(moneyTd).append(statusTd).append(detailBtn)
                .appendTo('.project-table tbody');
        })
    }

    //解析显示分页信想
    function build_page_info(info) {
        $('#page-info').empty();
        $('#page-info').append(
            '&nbsp;&nbsp;&nbsp;当前第' + info.pageNum + '页，共' + info.pages
            + '页，共' + info.total + '条记录');
        totalRecord = info.total;
        currentPage = info.pageNum;
    }

    function build_nav(info) {
        $('#page-nav').empty();
        var ul = $('<ul></ul>').addClass('pagination');
        var firstPageLi = $('<li></li>').append($('<a></a>').append('首页'))
            .attr('href', '#');
        var prePageLi = $('<li></li>').append(
            $('<a></a>').append('&laquo;'));
        if (info.hasPreviousPage == false) {
            firstPageLi.addClass('disabled');
            prePageLi.addClass('disabled');
        } else {
            firstPageLi.click(function () {
                to_page(1);
            })
            prePageLi.click(function () {
                to_page(info.prePage);
            })
        }
        ul.append(firstPageLi).append(prePageLi);

        $.each(info.navigatepageNums, function (index, item) {
            var li = $('<li></li>').append($('<a></a>').append(item));
            if (info.pageNum == item) {
                li.addClass('active');
            }
            li.click(function () {
                to_page(item);
            })
            ul.append(li);
        })

        var lastPageLi = $('<li></li>').append($('<a></a>').append('末页'))
            .attr('href', '#');
        var nextPageLi = $('<li></li>').append(
            $('<a></a>').append('&raquo;'));
        if (info.hasNextPage == false) {
            lastPageLi.addClass('disabled');
            nextPageLi.addClass('disabled');
        } else {
            lastPageLi.click(function () {
                to_page(info.pages);
            })
            nextPageLi.click(function () {
                to_page(info.nextPage);
            })
        }
        ul.append(nextPageLi).append(lastPageLi);
        $('#page-nav').append(ul);
    }
    $(document).on(
        "click",
        ".detail-btn",
        function () {
            $.ajax({
                url:'${cp}/getProject/' + $(this).attr('detail-id'),
                method:'get',
                success:function (result) {
                    var projectDate = result.info.project;
                    $('#detail-address').text(projectDate.address);
                    $('#detail-yw_time').text(getDate(projectDate.yw_time));
                    $('#detail-country_code').text(projectDate.country_code.c_name);
                    $('#detail-currency_code').text(projectDate.currency_code.c_name);
                    $('#detail-user_id').text(projectDate.user_id.name);
                    $('#detail-check_time').text(getDate(projectDate.check_time));
                }
            })

            $('#detail-modal').modal({
                backdrop: 'static'
            })
        }

    )


    $('#search-btn').click(function () {
        to_page(1);
    })
    $('#reset-search-btn').click(function () {
        $('#search-form')[0].reset();
        to_page(1);
    })
    $('#export').click(function () {
        alert("是否导出？");
        window.open('${cp}/exportProject' +'?'+ $('#search-form').serialize());

    })

    $('.form_datetime').datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView:2,
        forceParse: 0,
    })
</script>

<script>
    $("#example-basic").treetable({
        expandable: true
    });

    $("#example-basic-static").treetable();

    $("#example-basic-expandable").treetable({
        expandable: true
    });

    $("#example-advanced").treetable({
        expandable: true
    });
    $("#example-advanced1").treetable({
        expandable: false
    });

    // Highlight selected row
    $("#example-advanced tbody").on("mousedown", "tr", function () {
        $(".selected").not(this).removeClass("selected");
        $(this).toggleClass("selected");
    });

    // Highlight selected row
    $("#example-advanced2 tbody").on("mousedown", "tr", function () {
        $(".selected").not(this).removeClass("selected");
        $(this).toggleClass("selected");
    });
    // Drag & Drop Example Code
    $("#example-advanced .file, #example-advanced .folder").draggable({
        helper: "clone",
        opacity: .75,
        refreshPositions: true, // Performance?
        revert: "invalid",
        revertDuration: 300,
        expandable: true,
        scroll: true
    });

    $("#example-advanced .folder").each(
        function () {
            $(this).parents("#example-advanced tr").droppable(
                {
                    accept: ".file, .folder",
                    drop: function (e, ui) {
                        var droppedEl = ui.draggable.parents("tr");
                        $("#example-advanced").treetable("move",
                            droppedEl.data("ttId"),
                            $(this).data("ttId"));
                    },
                    hoverClass: "accept",
                    over: function (e, ui) {
                        var droppedEl = ui.draggable.parents("tr");
                        if (this != droppedEl[0]
                            && !$(this).is(".expanded")) {
                            $("#example-advanced").treetable(
                                "expandNode",
                                $(this).data("ttId"));
                        }
                    }
                });
        });

    $("form#reveal").submit(function () {
        var nodeId = $("#revealNodeId").val()

        try {
            $("#example-advanced").treetable("reveal", nodeId);
        } catch (error) {
            alert(error.message);
        }

        return false;
    });
</script>

<script>
    $(document).ready(function () {
        var table1 = $('#table1').tabelize({
            /*onRowClick : function(){
            alert('test');
            }*/
            fullRowClickable: true,
            onReady: function () {
                console.log('ready');
            },
            onBeforeRowClick: function () {
                console.log('onBeforeRowClick');
            },
            onAfterRowClick: function () {
                console.log('onAfterRowClick');
            },
        });
    });

</script>
</body>
</html>