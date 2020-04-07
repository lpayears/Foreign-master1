<%--
  Created by IntelliJ IDEA.
  User: LPA
  Date: 2020/2/28
  Time: 15:59
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
    <div class="modal fade" id="add-modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">新增用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="add-form">
                        <div class="form-group">
                            <label for="add-name" class="col-sm-2 control-label">用户姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name"
                                       id="add-name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-id_code" class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="id_code"
                                       id="add-id_code">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-cellphone" class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="cellphone"
                                       id="add-cellphone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-branch_id" class="col-sm-2 control-label">所属单位</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="branch_id.id" id="add-branch_id">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-role_id" class="col-sm-2 control-label">所属岗位</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="role_id" id="add-role_id">
                                        <option value="1">国际部员工</option>
                                        <option value="2">网点负责人</option>
                                        <option value="3">客户经理</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-info" id="add-reset-btn">重置</button>
                    <button type="button" class="btn btn-primary" id="save-btn">保存</button>
                </div>
            </div>
        </div>
    </div>
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
                    <h4 class="modal-title">用户信息修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit-form">
                        <div class="form-group">
                            <label for="edit-name" class="col-sm-2 control-label">用户姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name"
                                       id="edit-name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-phone" class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="cellphone"
                                       id="edit-phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-id_code" class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="id_code"
                                       id="edit-id_code">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-branch_id" class="col-sm-2 control-label">所属单位</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="branch_id.id" id="edit-branch_id">
                                    <c:forEach items="${branches}" var="branch" varStatus="id">
                                        <option value="${branch.id}">${branch.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-role_id" class="col-sm-2 control-label">所属岗位</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="role_id" id="edit-role_id">
                                    <option value="0">国际部负责人</option>
                                    <option value="1">国际部员工</option>
                                    <option value="2">网点负责人</option>
                                    <option value="3">客户经理</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号状态</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"> <input type="radio"
                                                                    name="status" value="0"> 启用
                                </label> <label class="radio-inline"> <input type="radio"
                                                                             name="status" value="1"> 禁用
                            </label>
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
                <li><a href="#" title="Sample page 1">员工管理</a></li>
            </ul>

            <!-- END OF BREADCRUMB -->



            <!-- END OF BREADCRUMB -->
            <div class="content-wrap">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="nest" id="tabletreeClose">
                            <div class="title-alt">
                                <h6>员工列表</h6>
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
                                        <label class="sr-only">Name</label>
                                        <p class="form-control-static">用户姓名</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="name" class="sr-only">Password</label> <input
                                            type="text" class="form-control" id="name"
                                            name="name">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only">Branch_id</label>
                                        <p class="form-control-static">所属机构</p>
                                    </div>
                                    <select class="select-width" name="branch_id.id" id="select-branch" >
                                        <option value=""></option>

                                    </select>


                                    <!--<button type="submit" class="btn btn-default">Confirm identity</button>-->
                                    <button type="button" class="btn btn-primary" id="search-btn">搜索</button>
                                    <button type="button" class="btn btn-info"
                                            id="reset-search-btn">取消
                                    </button>
                                    <button type="button" class="btn btn-primary kaoyou"
                                            id="add-btn">新增
                                    </button>
                                </form>

                                <table id="example-advanced" class="user-table">


                                    <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>用户姓名</th>
                                        <th>身份证号</th>
                                        <th>所属单位</th>
                                        <th>联系方式</th>
                                        <th>用户角色</th>
                                        <th>状态</th>
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
       // build_select();
        selectBranch();
        to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url: '${cp}/getUserList',
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
        $('.user-table tbody').empty();
        //console.log(list);
        $.each(list, function (index, item) {
            var idTd = $('<td scope="row"></td>').append(item.id);
            var nameTd = $('<td></td>').append(item.name);
            var codeTd =$('<td></td>').append(item.id_code);
            var phoneTd = $('<td></td>').append(item.cellphone);
            var branchTd = $('<td></td>').append(item.branch_id.name);
            var roleTd = $('<td></td>').append(
                item.role_id == '0' ? '国际部经理' : (item.role_id == '1'?'国际部员工':(item.role_id =='2'?'网点负责人':'客户经理')));
            var statusTd = $('<td></td>').append(
                item.status == '0' ? '启用' : '禁用');

            var editBtn = $('<button></button>').addClass(
                'btn btn-info btn-xs edit-btn').append('编辑').attr(
                'edit-id', item.id);
            var delBtn = $('<button></button>').addClass(
                'btn btn-danger btn-xs del-btn').append('删除').attr(
                'del-id', item.id);
            var btnTd = $('<td></td>').append(editBtn).append(' ').append(
                delBtn);

            $('<tr></tr>').append(idTd).append(nameTd).append(codeTd).append(branchTd).append(phoneTd).append(roleTd).append(statusTd).append(btnTd)
                .appendTo('.user-table tbody');
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

    function selectBranch() {
        $('#select-branch').empty();
        $.ajax({
            url:'${cp}/getBranches',
            method:'get',
            anync:false,
            success:function (result) {
                $('#select-branch').append('<option value="" selected></option>');
                $.each(result.info.branches,function (i,item) {
                    $('#select-branch').append('<option value="'+result.info.branches[i].id+'">'+result.info.branches[i].name+'</option>');
                    $('#edit-branch_id').append('<option value="'+result.info.branches[i].id+'">'+result.info.branches[i].name+'</option>');
                    $('#add-branch_id').append('<option value="'+result.info.branches[i].id+'">'+result.info.branches[i].name+'</option>');
                })
            }
        })
    }
    //保存
    $('#save-btn').click(function () {
        $.ajax({
            url: '${cp}/addUser',
            method: 'post',
            async: false,
            data: $('#add-form').serialize(),
            success: function (result) {

            }
        })
        //关闭新增模态框
        $('#add-modal').modal('hide');
        console.info(totalRecord);
        to_page(1);
    })

    $('#add-btn').click(function () {
        $('#add-modal').modal({
            backdrop: 'static'
        })
    })

    $('#add-reset-btn').click(function () {
        $('#add-form')[0].reset();
    })

    //在创建按钮之前绑定click事件是不能绑定的，所以用on绑定
    $(document).on(
        "click",
        ".edit-btn",
        function () {
            $.ajax({
                url: '${cp}/getUser/' + $(this).attr('edit-id'),
                method: 'get',
                success: function (result) {
                    var userData = result.info.user;
                    $('#edit-name').val(userData.name);
                    $('#edit-phone').val(userData.cellphone);
                    $('#edit-id_code').val(userData.id_code);
                    $('#edit-branch_id').val(userData.branch_id.id);
                    $('#edit-role_id').val(userData.role_id);
                    $('#edit-modal input[name=status]').val([userData.status]);
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
            url: '${cp}/updateUser/' + $(this).attr('edit-id'),
            method: 'post',
            data: $('#edit-form').serialize(),
            async: false,
            success: function (result) {
            }
        })
        $('#edit-modal').modal('hide');
        to_page(currentPage);
    })

    //删除
    $(document).on('click', '.del-btn', function () {
        var userName = $(this).parents('tr').find('td:eq(1)').text();
        var userId = $(this).attr('del-id');
        if (confirm('确定要删除用户[' + userName + ']吗?')) {
            $.ajax({
                url: '${cp}/delUser/' + userId,
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

    // Highlight selected row
    $("#example-advanced tbody").on("mousedown", "tr", function () {
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