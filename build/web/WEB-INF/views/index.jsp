<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:url var="home" value="/" scope="request" />

<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>bioinformatic</title>
        <meta charset="UTF-8">
        <spring:url value="/resources/jquery/jquery-3.2.1.min.js" var="jquery"></spring:url>
        <spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapCss"></spring:url>
        <spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapJs"></spring:url>
        <spring:url value="/resources/mine/css/vertical_nav.css" var="verticalNavCss"></spring:url>
        <spring:url value="/resources/mine/js/vertical_nav.js" var="verticalNavJs"></spring:url>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="${bootstrapCss}">
        <script type="text/javascript" src="${jquery}"></script>
        <script type="text/javascript" src="${bootstrapJs}"></script>        

        <link rel="stylesheet" type="text/css" href="${verticalNavCss}">
        <script type="text/javascript" src="${verticalNavJs}"></script>        


        <style>
            #second-part, #third-part {
                display: none;
            }
            #mySidenav {
                direction: rtl;
            }

            .rec {
                margin-bottom: 20px;
            }


            body {background:cornsilk}

            .box h3{
                text-align:center;
                position:relative;
                top:80px;
            }
            .box {
                width:70%;
                /*height:200px;*/
                background:#FFF;
                margin:40px auto;
                padding: 30px;

            }
            .effect2
            {
                position: relative;
            }
            .effect2:before, .effect2:after
            {
                z-index: -1;
                position: absolute;
                content: "";
                bottom: 15px;
                left: 10px;
                width: 50%;
                top: 80%;
                max-width:300px;
                background: #777;
                -webkit-box-shadow: 0 15px 10px #777;
                -moz-box-shadow: 0 15px 10px #777;
                box-shadow: 0 15px 10px #777;
                -webkit-transform: rotate(-3deg);
                -moz-transform: rotate(-3deg);
                -o-transform: rotate(-3deg);
                -ms-transform: rotate(-3deg);
                transform: rotate(-3deg);
            }
            .effect2:after
            {
                -webkit-transform: rotate(3deg);
                -moz-transform: rotate(3deg);
                -o-transform: rotate(3deg);
                -ms-transform: rotate(3deg);
                transform: rotate(3deg);
                right: 10px;
                left: auto;
            }

            .effect7
            {
                position:relative;
                -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
                -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
                box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            }
            .effect7:before, .effect7:after
            {
                content:"";
                position:absolute;
                z-index:-1;
                -webkit-box-shadow:0 0 20px rgba(0,0,0,0.8);
                -moz-box-shadow:0 0 20px rgba(0,0,0,0.8);
                box-shadow:0 0 20px rgba(0,0,0,0.8);
                top:0;
                bottom:0;
                left:10px;
                right:10px;
                -moz-border-radius:100px / 10px;
                border-radius:100px / 10px;
            }
            .effect7:after
            {
                right:10px;
                left:auto;
                -webkit-transform:skew(8deg) rotate(3deg);
                -moz-transform:skew(8deg) rotate(3deg);
                -ms-transform:skew(8deg) rotate(3deg);
                -o-transform:skew(8deg) rotate(3deg);
                transform:skew(8deg) rotate(3deg);
            }
        </style>

    </head>
    <body>



        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="#" class="btn-nav" id="btn-first">تولید رشته</a>
            <a href="#" class="btn-nav" id="btn-second">تکه تکه کردن</a>
            <a href="#" class="btn-nav" id="btn-third">بازسازی رشته</a>
            <a href="#" class="btn-nav" id="btn-fourth">همه</a>

        </div>
        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
        <div id="main">
            <div class="container">

                <div class="box effect7 rec" id="first-part">
                    <div class="form-group">
                        <label for="txt-a">A</label>
                        <div><input type="text" placeholder="A" class="form-control" id="txt-a" value="25"/></div>  
                    </div>

                    <div class="form-group">
                        <label for="txt-c">C</label>
                        <div><input type="text" placeholder="C" class="form-control" id="txt-c" value="25"/></div>  
                    </div>
                    <div class="form-group">
                        <label for="txt-t">T</label>
                        <div><input type="text" placeholder="T" class="form-control" id="txt-t" value="25"/></div>  
                    </div>

                    <div class="form-group">
                        <label for="txt-g">G</label>
                        <div><input type="text" placeholder="G" class="form-control" id="txt-g" value="25"/></div>  
                    </div>

                    <div class="form-group">
                        <label for="txt-g">طول رشته</label>
                        <div><input type="text" placeholder="String Length" class="form-control"  id="txt-length" value="27"/></div>
                    </div>

                    <div><textarea cols="10" rows="10" class="form-control" id="txt-result-generate"></textarea></div>
                    <div><input type="button" value="تولید رشته" class="btn btn-success form-control" id="btn-generate"/></div>
                </div>

                <div class="box effect7 rec" id="second-part">
                    <div class="form-group">
                        <label for="txt-max-length">حداکثر طول</label>
                        <div><input type="text" placeholder="Max Length" class="form-control" id="txt-max-length" value="9"/></div>  
                    </div>
                    <div class="form-group">
                        <label for="txt-min-length">حداقل طول</label>
                        <div><input type="text" placeholder="Min Length" class="form-control" id="txt-min-length" value="5"/></div>  
                    </div>
                    <div class="form-group">
                        <label for="txt-number-of-copies">تعداد کپی</label>
                        <div><input type="text" placeholder="Number of Copies" class="form-control" id="txt-number-of-copies" value="6"/></div>  
                    </div>
                    <div><textarea cols="10" rows="10" class="form-control" id="txt-split-result"></textarea></div>
                    <div><input type="button" value="تکه تکه کردن" class="btn btn-success form-control" id="btn-Split"/></div>     
                </div>

                <div class="box effect7 rec" id="third-part">  
                    <div class="form-group">
                        <div><textarea cols="10" rows="5" class="form-control" id="txt-assemble-result"></textarea></div>
                    </div>
                    <div class="form-group">
                        <div><textarea cols="10" rows="10" class="form-control" id="txt-alignment-result"></textarea></div>
                    </div>
                    <div><input type="button" value="بازسازی رشته" class="btn btn-success form-control" id="btn-assemble"/></div>      
                </div>

            </div>
        </div>


        <div id="test"></div>
        <div id="mylog"></div>
        <div id="the-modal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content" style="direction:rtl">
                    لطفا عدد وارد کنید
                </div>
            </div>
        </div>
        <script>


            $(window).ready(function () {
                function ajax(data, url, onSuccess) {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: "${home}" + url,
                        data: JSON.stringify(data),
                        dataType: 'json',
                        timeout: 100000,
                        success: onSuccess,
                        error: function (e) {
                            console.log("ERROR: ", e);
                            //display(e);
                        },
                        done: function (e) {
                            console.log("DONE");
                        }
                    });
                }

                function validate(data) {
                    $.each(data, function (index, item) {
                        if (isNaN(item)) {
                            $('#the-modal').modal();
                        }
                    });
                }



                //    	/testObj.test();
                //$('#test').html(javaObject + '');
                //var javaObject = javaObject;
                function show_text(fname, lname) {
                    var result = document.getElementById('test');
                    result.innerHTML = '<p>' + fname + ' ' + lname + '</p>';
                }

                $('#btn-first').click(function () {
                    $('.rec').css('display', 'none');
                    $('#first-part').fadeIn();
                });
                $('#btn-second').click(function () {
                    $('.rec').css('display', 'none');
                    $('#second-part').fadeIn();
                });
                $('#btn-third').click(function () {
                    $('.rec').css('display', 'none');
                    $('#third-part').fadeIn();
                });
                $('#btn-fourth').click(function () {
                    $('.rec').css('display', 'none');
                    $('.rec').fadeIn();
                });
                $('#btn-generate').click(function () {
                    var data = {}
                    data["a"] = $('#txt-a').val();
                    data["c"] = $('#txt-c').val();
                    data["t"] = $('#txt-t').val();
                    data["g"] = $('#txt-g').val();
                    data["length"] = $('#txt-length').val();
                    validate(data);
                    var url = "api/generate";
                    var onSuccess = function (data) {
                        console.log("SUCCESS: ", data);
                        $('#txt-result-generate').html(data.result);
                    }
                    ajax(data, url, onSuccess);
                });
                $('#btn-Split').click(function () {
                    //app.btnSplitActionPerformed($('#txt-min-length').val(), $('#txt-max-length').val(), $('#txt-number-of-copies').val());

                    var data = {};
                    data["min"] = $('#txt-min-length').val();
                    data["max"] = $('#txt-max-length').val();
                    data["copy"] = $('#txt-number-of-copies').val();
                    validate(data);
                    var url = "api/split";
                    var onSuccess = function (data) {
                        console.log("SUCCESS: ", data);
                        $('#txt-split-result').html(data.result);
                    }
                    ajax(data, url, onSuccess);
                });
                $('#btn-assemble').click(function () {
                    var data = {};
                    var url = "api/assemble";
                    var onSuccess = function (data) {
                        console.log("SUCCESS: ", data);
                        $('#txt-assemble-result').html(data.result);
                        $('#txt-alignment-result').html(data.otherResult);
                    }
                    ajax(data, url, onSuccess);
                });
                function setTextTxtGenerate(str) {
                    test("generate");
                    test(str);
                    $('#txt-result-generate').html(str);
                }
                function appendTextTxtSplit(str) {
                    test("split");
                    test(str);
                    var splitTextArea = $('#txt-split-result').val();
                    $('#txt-split-result').html(splitTextArea + str);
                }
                function clearTextTxtSplit() {
                    $('#txt-split-result').html('');
                }

                function clearTextTxtGenerate() {
                    $('#txt-result-generate').html('');
                }

                function setTextTxtAssemble(str) {
                    test(str);
                    $('#txt-assemble-result').html(str);
                }

                function setTextTxtAlignment(str) {
                    test(str);
                    $('#txt-alignment-result').html(str);
                }
                function test(str) {
                    //$('#test').html(str);
                }

            });
        </script>
    </body>
</html>

