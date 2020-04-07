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
    <!-- 新增模态框 -->

    <!-- 修改模态框 -->
    <div class="modal fade" id="edit-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">账户信息修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit-form">
                        <div class="form-group">
                            <label for="edit-name" class="col-sm-2 control-label">公司名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="company_name"
                                       id="edit-name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-account" class="col-sm-2 control-label">公司账户</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="account"
                                       id="edit-account">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-type" class="col-sm-2 control-label">公司性质</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="type" id="edit-type">
                                    <option value="0">NRA账户</option>
                                    <option value="1">全行个人外汇结算账户</option>
                                    <option value="2">全行一般贸易企业外汇结算账户</option>
                                    <option value="3">各支行推荐的代理公司</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-status" class="col-sm-2 control-label">公司状态</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="status" id="edit-status">
                                    <option value="0">正常</option>
                                    <option value="1">久悬不动户</option>
                                    <option value="2">禁用</option>
                                    <option value="3">已销户</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开户日期</label>
                            <div class="col-sm-10 date form_datetime input-group">
                                <input class="form-control" type="text" value="" readonly id="edit-start_time"
                                       name="start_time">
                                <span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
								</span>
                                <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-business_scope" class="col-sm-2 control-label">经营范围</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="business_scope"
                                       id="edit-business_scope">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-manage_location" class="col-sm-2 control-label">经营场所</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="manage_location"
                                       id="edit-manage_location">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">注册日期</label>
                            <div class="col-sm-10 date form_datetime input-group">
                                <input class="form-control" type="text" value="" readonly id="edit-register_time"
                                       name="register_time">
                                <span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
								</span>
                                <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-register_place" class="col-sm-2 control-label">注册地址</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="register_place" id="edit-register_place">
                                    <option value="义乌">义乌</option>
                                    <option value="香港">香港</option>
                                    <option value="国内其他">国内其他</option>
                                    <option value="国外其他">国外其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-limit_money" class="col-sm-2 control-label">年度结汇金额</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="limit_money"
                                       id="edit-limit_money">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-branch_id" class="col-sm-2 control-label">所属单位</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="branch_id.id" id="edit-branch_id">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-user_id" class="col-sm-2 control-label">客户经理</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="user_id.id" id="edit-user_id">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="update-btn">更新</button>
                </div>
            </div>
        </div>
    </div>
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
                    <h4 class="modal-title">账户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="deatil-form">
                        <div class="form-group">
                            <label for="detail-business_scope" class="col-sm-2 control-label">经营范围</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="business_scope"
                                   id="detail-business_scope">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-manage_location" class="col-sm-2 control-label">经营场所</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="manage_location"
                                   id="detail-manage_location">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-register_time" class="col-sm-2 control-label">注册日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="register_time"
                                       id="detail-register_time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-register_place" class="col-sm-2 control-label">注册地点</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="register_place"
                                   id="detail-register_place">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-limit_money" class="col-sm-2 control-label">年结汇金额</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="limit_money"
                                   id="detail-limit_money">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-branch_id" class="col-sm-2 control-label">所属单位</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="branch_id.name"
                                   id="detail-branch_id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-user_id" class="col-sm-2 control-label">客户经理</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"name="user_id.name"
                                   id="detail-user_id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detail-legal_id" class="col-sm-2 control-label">法人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="legal_id.name"
                                   id="detail-legal_id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">股东信息</label>
                            <div class="col-sm-10">
                                <table class="clients-table" id="example-advanced1">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>姓名</th>
                                        <th>证件类型</th>
                                        <th>证件号码</th>
                                        <th>联系方式</th>
                                        <th>联系地址</th>
                                        <th>所属国别</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
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
    <!--移交模态框-->
    <div class="modal fade" id="change-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">账户移交</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="change-form">

                        <div class="form-group">
                            <label for="change-branch_id" class="col-sm-2 control-label">所属单位</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="company.branch_id.id" id="change-branch_id">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="change-user_id" class="col-sm-2 control-label">客户经理</label>
                            <div class="col-sm-10">
                                <select class="selectpicker show-tick form-control" data-live-search="true" name="company.user_id.id" id="change-user_id">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="change-btn">移交</button>
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
                <li><a href="#" title="Sample page 1">账户管理</a></li>
            </ul>

            <!-- END OF BREADCRUMB -->



            <!-- END OF BREADCRUMB -->
            <div class="content-wrap">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="nest" id="tabletreeClose">
                            <div class="title-alt">
                                <h6>账户列表</h6>
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
                                        <p class="form-control-static">公司名称</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="company_name" class="sr-only"></label> <input
                                            type="text" class="form-control" id="company_name"
                                            name="company_name">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">账号</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="account" class="sr-only"></label> <input
                                            type="text" class="form-control" id="account"
                                            name="account">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">客户经理</p>
                                    </div>
                                    <select class="select-width" name="user_id.id" id="select-user_id" >
                                    </select>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">类型</p>
                                    </div>
                                    <select class="select-width" name="type" id="select-type" >
                                        <option value=""></option>
                                        <option value="0">NRA账户</option>
                                        <option value="1">全行个人外汇结算账户</option>
                                        <option value="2">全行一般贸易企业外汇结算账户</option>
                                        <option value="3">代理公司</option>
                                    </select>
                                    <div class="form-group">
                                        <label class="sr-only"></label>
                                        <p class="form-control-static">状态</p>
                                    </div>
                                    <select class="select-width" name="status" id="select-status" >
                                        <option value="0">正常</option>
                                        <option value="1">久悬不动户</option>
                                        <option value="2">禁用</option>
                                        <option value="3">已销户</option>
                                        <option value="" selected></option>
                                    </select>



                                    <!--<button type="submit" class="btn btn-default">Confirm identity</button>-->
                                    <button type="button" class="btn btn-primary" id="search-btn">搜索</button>
                                    <button type="button" class="btn btn-info"
                                            id="reset-search-btn">取消
                                    </button>
                                    <button type="button" class="btn btn-primary kaoyou"
                                            id="change">批量移交
                                    </button>
                                </form>

                                <table id="example-advanced" class="company-table">


                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll"></th>
                                        <th>id</th>
                                        <th>账号</th>
                                        <th>公司名称</th>
                                        <th>账户类型</th>
                                        <th>开户日期</th>
                                        <th>账户状态</th>
                                        <th>下载</th>
                                        <th>管护网点</th>
                                        <th>详情</th>
                                        <th>操作</th>
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
        build_select();
        to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url: '${cp}/getCompanyList',
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
        $('.company-table tbody').empty();
        //console.log(list);
        $.each(list, function (index, item) {
            var changeTd=$('<td><input type="checkbox" name="id" value="'+item.id+'"></td>').attr('change-id',item.id);
            var idTd = $('<td scope="row"></td>').append(item.id);
            var accountTd=$('<td></td>').append(item.account);
            var nameTd = $('<td></td>').append(item.company_name);
            var typeTd = $('<td></td>').append(item.type == '0' ? 'NRA账户' : (item.type == '1'?'全行个人外汇结算账户':(item.type =='2'?'全行一般贸易企业外汇结算账户':'代理公司')));
            var stTd = $('<td></td>').append(getDate(item.start_time));
            var statusTd = $('<td></td>').append(
                item.status == '0' ? '正常' : (item.status == '1'?'久悬不动户':(item.status =='2'?'禁用':'已销户')));
            var branchTd = $('<td></td>').append(item.branch_id.name);
            var downloadTd = $('<td></td>').addClass(
                'btn btn-info btn-xs download-btn').append('开户资料').attr(
                    'download',item.account);
            var detailBtn = $('<button></button>').addClass(
                'btn btn-info btn-xs detail-btn').append('详情').attr(
                'detail-id', item.id);
            var editBtn = $('<button></button>').addClass(
                'btn btn-info btn-xs edit-btn').append('修改').attr(
                'edit-id', item.id);
            var delBtn = $('<button></button>').addClass(
                'btn btn-danger btn-xs del-btn').append('删除').attr(
                'del-id', item.id);
            var btnTd = $('<td></td>').append(editBtn).append(' ').append(
                delBtn);

            $('<tr></tr>').append(changeTd).append(idTd).append(accountTd).append(nameTd).append(typeTd).append(stTd).append(statusTd).append(downloadTd).append(branchTd).append(detailBtn).append(btnTd)
                .appendTo('.company-table tbody');
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
                url:'${cp}/getCompany/' + $(this).attr('detail-id'),
                method:'get',
                success:function (result) {
                    var companyData = result.info.company;
                    $('#detail-name').val(companyData.company_name);
                    $('#detail-account').val(companyData.account);
                    $('#detail-business_scope').val(companyData.business_scope);
                    $('#detail-manage_location').val(companyData.manage_location);
                    $('#detail-register_time').val(getDate(companyData.register_time));
                    $('#detail-register_place').val(companyData.register_place);
                    $('#detail-limit_money').val(companyData.limit_money);
                    $('#detail-branch_id').val(companyData.branch_id.name);
                    $('#detail-user_id').val(companyData.user_id.name);
                    $('#detail-legal_id').val(companyData.client.name);
                     $('.clients-table tbody').empty();
                    if (companyData.status == 2){
                        var downloadDisposeTd = $('<td></td>').addClass(
                            'btn btn-info btn-xs download_dispose-btn').append('处置资料').attr(
                            'download-dispose',companyData.account);
                        $('<tr></tr>').append('<td>'+companyData.client.id+'</td>').append('<td>'+companyData.client.name+'</td>').append('<td>'+companyData.client.id_type+'</td>').append('<td>'+companyData.client.id_code+'</td>').append('<td>'+companyData.client.cellphone+'</td>').append('<td>'+companyData.client.address+'</td>').append('<td>'+companyData.client.country_code.c_name+'</td>').append(downloadDisposeTd).appendTo('.clients-table tbody');
                    }
                    else
                     $('<tr></tr>').append('<td>'+companyData.client.id+'</td>').append('<td>'+companyData.client.name+'</td>').append('<td>'+companyData.client.id_type+'</td>').append('<td>'+companyData.client.id_code+'</td>').append('<td>'+companyData.client.cellphone+'</td>').append('<td>'+companyData.client.address+'</td>').append('<td>'+companyData.client.country_code.c_name+'</td>').appendTo('.clients-table tbody');
                     $.each(companyData.clients,function (i,item) {
                    var idTd = $('<td></td>').append(item.id);
                    var nameTd=$('<td></td>').append(item.name);
                    var typeTd=$('<td></td>').append(item.id_type);
                    var codeTd=$('<td></td>').append(item.id_code);
                    var cellphoneTd=$('<td></td>').append(item.cellphone);
                    var addressTd=$('<td></td>').append(item.address);
                    var countryTd=$('<td></td>').append(item.country_code.c_name);
                    $('<tr></tr>').append(idTd).append(nameTd).append(typeTd).append(codeTd).append(cellphoneTd).append(addressTd).append(countryTd).appendTo('.clients-table tbody');
            })


                }
            })

            $('#detail-modal').modal({
                backdrop: 'static'
            })

        }
    )

    //在创建按钮之前绑定click事件是不能绑定的，所以用on绑定
    $(document).on(
        "click",
        ".edit-btn",
        function () {
            $.ajax({
                url: '${cp}/getCompany/' + $(this).attr('edit-id'),
                method: 'get',
                success: function (result) {
                    var companyData = result.info.company;
                    $('#edit-name').val(companyData.company_name);
                    $('#edit-account').val(companyData.account);
                    $('#edit-type').val(companyData.type);
                    $('#edit-status').val(companyData.status);
                    $('#edit-start_time').val(getDate(companyData.start_time));
                    $('#edit-business_scope').val(companyData.business_scope);
                    $('#edit-manage_location').val(companyData.manage_location);
                    $('#edit-register_time').val(getDate(companyData.register_time));
                    $('#edit-register_place').val(companyData.register_place);
                    $('#edit-limit_money').val(companyData.limit_money);
                    $('#edit-branch_id').val(companyData.branch_id.id);
                    $('#edit-user_id').val(companyData.user_id.id);
                }
            })
            $('#edit-modal').modal({
                backdrop: 'static'
            })
            //为更新按钮绑定id
            $('#update-btn').attr('edit-id', $(this).attr('edit-id'));
        })

    //修改
    $('#update-btn').click(function () {
        $.ajax({
            url: '${cp}/updateCompany/' + $(this).attr('edit-id'),
            method: 'post',
            data: $('#edit-form').serialize(),
            async: false,
            success: function (result) {
            }
        })
        $('#edit-modal').modal('hide');
        to_page(currentPage);
    })
    
    //下载开户资料
    $(document).on(
        "click",
        ".download-btn",
        function () {
            var directory = $(this).attr('download');
            var sftpFileName = $(this).attr('download');
            alert("是否下载？");
            window.open('${cp}/download_company' +'?'+$.param({'company': directory})+'&'+$.param({'sftpFileName': sftpFileName}));
        }
    )
    //下载处置资料
    $(document).on(
        "click",
        ".download_dispose-btn",
        function () {
            var directory = $(this).attr('download-dispose');
            var sftpFileName = $(this).attr('download-dispose')+"dispose";
            alert("是否下载？");
            window.open('${cp}/download_company' +'?'+$.param({'company': directory})+'&'+$.param({'sftpFileName': sftpFileName}));
        }
    )
    //移交
    $('#change').click(function () {
        $('#change-modal').modal({
            backdrop: 'static'
        })
    })
    $('#change-btn').click(function () {
        var cids=[];
        $("input:checkbox[name= id]:checked").each(function (i) {
                    cids.push($(this).val());
        })
        var id = cids.join(',');
        $.ajax({
            url: '${cp}/updateCUsers',
            method: 'post',
            async: false,
            data:$('#change-form').serialize()+'&'+$.param({"ids":id}),
            success: function (result) {
                alert("移交成功！");
            }
        })
        $('#change-modal').modal('hide');
        to_page(1);
    })
    //删除
    $(document).on('click', '.del-btn', function () {
        var userName = $(this).parents('tr').find('td:eq(1)').text();
        var userId = $(this).attr('del-id');
        if (confirm('确定要删除用户[' + userName + ']吗?')) {
            $.ajax({
                url: '${cp}/delCompany/' + userId,
                method: 'delete',
                async: false,
                success: function (result) {
                    if (result.code == 200) {
                        alert(result.msg)
                    }
                }
            })
            to_page(currentPage);
        }
    })

    $('#add-modal').on('hidden.bs.modal', function (e) {
        $('#add-form')[0].reset();
    })

    $('#search-btn').click(function () {
        to_page(1);
    })
    $('#reset-search-btn').click(function () {
        $('#search-form')[0].reset();
        to_page(1);
    })

    function build_select() {

        $.ajax({
                url:'${cp}/getBranches',
                method:'get',
                success:function (result) {
                    $('#edit-branch_id').empty();
                    $.each(result.info.branches,function (i,item) {
                        $('#edit-branch_id').append('<option value="'+result.info.branches[i].id+'">'+result.info.branches[i].name+'</option>');
                        $('#change-branch_id').append('<option value="'+result.info.branches[i].id+'">'+result.info.branches[i].name+'</option>');
                    })
                }
            }
        )

        $.ajax({
            url:'${cp}/getAllUser',
            method:'get',
            success:function (result) {
                $('#edit-user_id').empty();
                $('#change-user_id').empty();
                $('#select-user_id').empty();
                $('#select-user_id').append('<option value="" selected></option>');
                $.each(result.info.users,function (i,item) {
                    $('#edit-user_id').append('<option value="'+result.info.users[i].id+'">'+result.info.users[i].name+'</option>');
                    $('#change-user_id').append('<option value="'+result.info.users[i].id+'">'+result.info.users[i].name+'</option>');
                    $('#select-user_id').append('<option value="'+result.info.users[i].id+'">'+result.info.users[i].name+'</option>');
                })
                $('#change-user_id').selectpicker('refresh');
                $('#change-user_id').selectpicker('render');
            }
        })
    }

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