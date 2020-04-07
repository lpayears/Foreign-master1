<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/3/24
  Time: 8:56
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
    <link href="${cp}/css/bootstrap-select.css" rel="stylesheet" >
    <script src="${cp}/js/layer.js" type="text/javascript"></script>

    <link rel="stylesheet"
          href="${cp}/js/tree/treetable/stylesheets/jquery.treetable.css">
    <link rel="stylesheet"
          href="${cp}/js/tree/treetable/stylesheets/jquery.treetable.theme.default.css">

    <link href="${cp}/js/tree/tabelizer/tabelizer.min.css" media="all"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet"
          href="${cp}/js/datepicker/bootstrap-datetimepicker.css">
    <script type="text/javascript">

    </script>
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/js/respond.min.js"></script>


    <script type="text/javascript">
        $(function(){
            $(".selectpicker" ).selectpicker('refresh');
        })

    </script>
    <![endif]-->
</head>

<body>

<!-- 中间内容 -->

<!-- 控制栏 -->
<!--  PAPER WRAP -->
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


        <!-- END OF BREADCRUMB -->

        <div style="margin: -20px 15px;" class="nest"
             id="Blank_PageClose">
            <div class="title-alt">
                <h6>新增预付</h6>
                <div class="titleClose">
                    <a class="gone" href="#Blank_PageClose"> <span
                            class="entypo-cancel"></span>
                    </a>
                </div>
                <div class="titleToggle">
                    <a class="nav-toggle-alt" href="#Blank_Page_Content"> <span
                            class="entypo-up-open"></span>
                    </a>
                </div>

            </div>

            <div class="body-nest" id="Blank_Page_Content">


                <div class="row">

                    <!-- edit form column -->
                    <div class="col-md-9 personal-info">


                        <form class="form-horizontal" role="form" id="add-project">
                            <div class="form-group">
                                <label for="add-num" class="col-sm-2 control-label">业务编号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="num"
                                           id="add-num">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">业务日期</label>
                                <div class="col-sm-10 date form_datetime input-group">
                                    <input class="form-control" type="text" value="" readonly id="add-yw_time"
                                           name="yw_time">
                                    <span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
								</span>
                                    <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-company_id" class="col-sm-2 control-label">汇款公司</label>
                                <div class="col-sm-10">
                                    <select class="selectpicker show-tick form-control" data-live-search="true" name="company_id.id" id="add-company_id">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-user_id" class="col-sm-2 control-label">经办人</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="user_id.id" id="add-user_id">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-currency_code" class="col-sm-2 control-label">币种</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="currency_code.id" id="add-currency_code">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-country_code" class="col-sm-2 control-label">收款人国别</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="country_code.id" id="add-country_code">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-cellphone" class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="cellphone"
                                           id="add-cellphone">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-address" class="col-sm-2 control-label">邮寄地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address"
                                           id="add-address">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-money" class="col-sm-2 control-label">预付金额</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="money"
                                           id="add-money">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">承诺日期</label>
                                <div class="col-sm-10 date form_datetime input-group">
                                    <input class="form-control" type="text" value="" readonly id="add-book_time"
                                           name="book_time">
                                    <span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
                                        					</span>
                                    <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
								</span>
                                </div>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-info" id="add-reset-btn">重置</button>
                            <button type="button" class="btn btn-primary" id="save-btn">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- END OF BREADCRUMB -->

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
    });
    function build_select() {

        $.ajax({
                url:'${cp}/getCountries',
                method:'get',
                success:function (result) {
                    $('#add-country_code').empty();

                    $.each(result.info.countries,function (i,item) {
                        $('#add-country_code').append('<option value="'+result.info.countries[i].id+'">'+result.info.countries[i].c_name+'</option>');
                    })
                }
            }
        )
        $.ajax({
                url:'${cp}/getCurrencies',
                method:'get',
                success:function (result) {
                    $('#add-currency_code').empty();

                    $.each(result.info.currencies,function (i,item) {
                        $('#add-currency_code').append('<option value="'+result.info.currencies[i].id+'">'+result.info.currencies[i].c_name+'</option>');
                    })
                }
            }
        )
        $.ajax({
            url:'${cp}/getAllUser',
            method:'get',
            success:function (result) {
                $('#add-user_id').empty();
                $.each(result.info.users,function (i,item) {
                    $('#add-user_id').append('<option value="'+result.info.users[i].id+'">'+result.info.users[i].name+'</option>');
                })
            }
        })

        $.ajax({
            url:'${cp}/getAllCompany',
            method:'get',
            success:function (result) {
                $('#add-company_id').empty();
                $.each(result.info.companies,function (i,item) {
                    $('#add-company_id').append('<option value="'+result.info.companies[i].id+'">'+result.info.companies[i].company_name+'</option>');
                })
                $('#add-company_id').selectpicker('refresh');
                $('#add-company_id').selectpicker('render');
            }
        })
        /**
         $(function(){
            $(".selectpicker" ).selectpicker('refresh');
        })
         **/
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
    //保存
    $('#save-btn').click(function () {

        $.ajax({
            url: '${cp}/addProject',
            method: 'post',
            async: false,
            data:$('#add-project').serialize(),
            success: function (result) {
                alert("新增成功！");
            }
        })
        $('#add-project')[0].reset();
    })


</script>
</body>

