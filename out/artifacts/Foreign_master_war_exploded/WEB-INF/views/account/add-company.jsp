<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/3/12
  Time: 16:54
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
<div>
    <!--上传模态框-->
    <div class="modal fade" id="port-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">开户资料</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="upload-form" enctype="multipart/form-data">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">上传资料</label>
                            <!-- <input type="text" id="material" name="company.material" hidden=""> -->
                            <input type="file" class="form-control" name="multipartFile"
                                   id="add-material" >
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="port-btn">上传</button>
                </div>
            </div>
        </div>
    </div>
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
                    <h6>新增账户</h6>
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


                            <form class="form-horizontal" role="form" id="add-company">
                                <div class="form-group">
                                    <label for="add-name" class="col-sm-2 control-label">公司名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="company.company_name"
                                               id="add-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-account" class="col-sm-2 control-label">公司账户</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="company.account"
                                               id="add-account">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-type" class="col-sm-2 control-label">公司性质</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="company.type" id="add-type">
                                            <option value="0">NRA账户</option>
                                            <option value="1">全行个人外汇结算账户</option>
                                            <option value="2">全行一般贸易企业外汇结算账户</option>
                                            <option value="3">各支行推荐的代理公司</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-status" class="col-sm-2 control-label">公司状态</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="company.status" id="add-status">
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
                                        <input class="form-control" type="text" value="" readonly id="add-start_time"
                                               name="company.start_time">
                                        <span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
								</span>
                                        <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-business_scope" class="col-sm-2 control-label">经营范围</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="company.business_scope"
                                               id="add-business_scope">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-manage_location" class="col-sm-2 control-label">经营场所</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="company.manage_location"
                                               id="add-manage_location">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">注册日期</label>
                                    <div class="col-sm-10 date form_datetime input-group">
                                        <input class="form-control" type="text" value="" readonly id="add-register_time"
                                               name="company.register_time">
                                        <span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
								</span>
                                        <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-register_place" class="col-sm-2 control-label">注册地址</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="company.register_place" id="add-register_place">
                                            <option value="义乌">义乌</option>
                                            <option value="香港">香港</option>
                                            <option value="国内其他">国内其他</option>
                                            <option value="国外其他">国外其他</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-limit_money" class="col-sm-2 control-label">年度结汇金额</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="company.limit_money"
                                               id="add-limit_money">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-branch_id" class="col-sm-2 control-label">所属单位</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="company.branch_id.id" id="add-branch_id">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-user_id" class="col-sm-2 control-label">客户经理</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="company.user_id.id" id="add-user_id">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-legal_id" class="col-sm-2 control-label">法人</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="company.client.id" id="add-legal_id">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="add-clients" class="col-sm-2 control-label">股东</label>
                                    <div class="col-sm-10">
                                        <select class="selectpicker show-tick form-control" data-live-search="true" name="clients.id" id="add-clients" multiple="multiple">
                                        </select>
                                    </div>
                                </div>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info" id="add-reset-btn">重置</button>
                                <button type="button" class="btn btn-primary "
                                        id="port">上传资料</button>
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
                url:'${cp}/getBranches',
                method:'get',
                success:function (result) {
                    $('#add-branch_id').empty();

                    $.each(result.info.branches,function (i,item) {
                        $('#add-branch_id').append('<option value="'+result.info.branches[i].id+'">'+result.info.branches[i].name+'</option>');
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
            url:'${cp}/getClients',
            method:'get',
            success:function (result) {
                $('#add-legal_id').empty();
                $('#add-clients').empty();
                $.each(result.info.clients,function (i,item) {
                    $('#add-legal_id').append('<option value="'+result.info.clients[i].id+'">'+result.info.clients[i].name+'</option>');
                    $('#add-clients').append('<option value="'+result.info.clients[i].id+'">'+result.info.clients[i].name+'</option>');
                })
                $('#add-clients').selectpicker('refresh');
                $('#add-clients').selectpicker('render');
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
        //获取所有下拉选中项
        var checkParam = $('#add-clients').find('option:selected');
        //选中id的集合
        var checkId=[];
        var client = new Array();
        for (var i = 0;i<checkParam.length;i++){
            checkId.push(checkParam[i].value);
            client[i]=checkParam[i].value;
        }
        var ids = checkId.join(',');

        $.ajax({
            url: '${cp}/addCompany',
            method: 'post',
            async: false,
            data:$('#add-company').serialize()+'&'+$.param({"ids":ids}),
            success: function (result) {
                alert("新增成功！");
            }
        })
        $('#add-company')[0].reset();
    })
    $('#port').click(function () {
        $('#port-modal').modal({
            backdrop: 'static'
        })
    })
    $('#port-btn').click(function () {
        var formDate =new FormData();

        console.log($('#add-account').val());
        formDate.append("directory",$('#add-account').val());
        formDate.append("sftpFileName",$('#add-account').val());
        formDate.append('company',$('#add-material')[0].files[0]);
        console.log($('#add-material').file);
        $.ajax({
            url: '${cp}/upload_company',
            method: 'post',
            async:false,
            cache:false,
            processData:false,
            contentType:false,
            data:formDate,
            dataType:'JSON',
            success: function (result) {
                alert("上传成功！");
            }
        })
        $('#port-modal').modal('hide');
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
