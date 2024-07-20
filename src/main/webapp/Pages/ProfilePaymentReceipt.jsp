<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 19-07-2024
  Time: 08:38 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Eduport - Payment invoice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #484b51;
            background-color: #f8f9fa;
        }
        .page-content {
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            padding: 20px;
            background-color: #fff;
        }
        .text-secondary-d1 {
            color: #728299!important;
        }
        .page-header {
            margin: 0 0 1rem;
            padding-bottom: 1rem;
            padding-top: .5rem;
            border-bottom: 1px dotted #e2e2e2;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .page-title {
            padding: 0;
            margin: 0;
            font-size: 1.75rem;
            font-weight: 300;
        }
        .brc-default-l1 {
            border-color: #dce9f0!important;
        }
        hr {
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: 0;
            border-top: 1px solid rgba(0,0,0,.1);
        }
        .text-grey-m2 {
            color: #888a8d!important;
        }
        .text-success-m2 {
            color: #86bd68!important;
        }
        .font-bolder, .text-600 {
            font-weight: 600!important;
        }
        .text-110 {
            font-size: 110%!important;
        }
        .text-blue {
            color: #478fcc!important;
        }
        .pb-25, .py-25 {
            padding-bottom: .75rem!important;
        }
        .pt-25, .py-25 {
            padding-top: .75rem!important;
        }
        .bgc-default-tp1 {
            background-color: rgba(121,169,197,.92)!important;
        }
        .bgc-default-l4, .bgc-h-default-l4:hover {
            background-color: #f3f8fa!important;
        }
        .btn-light {
            color: #757984;
            background-color: #f5f6f9;
            border-color: #dddfe4;
        }
        .w-2 {
            width: 1rem;
        }
        .text-120 {
            font-size: 120%!important;
        }
        .text-primary-m1 {
            color: #4087d4!important;
        }
        .text-danger-m1 {
            color: #dd4949!important;
        }
        .text-blue-m2 {
            color: #68a3d5!important;
        }
        .text-150 {
            font-size: 150%!important;
        }
        .text-60 {
            font-size: 60%!important;
        }
        .text-grey-m1 {
            color: #7b7d81!important;
        }
        .align-bottom {
            vertical-align: bottom!important;
        }
    </style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<div class="container page-content">
    <div class="page-header text-blue-d2">
        <h1 class="page-title text-secondary-d1">
            Invoice
            <small class="page-info">
                <i class="fa fa-angle-double-right text-80"></i>
                ID: #111-222
            </small>
        </h1>
        <div class="page-tools">
            <div class="action-buttons">
                <a class="btn bg-white btn-light mx-1px text-95" href="#" data-title="Print" onclick="printInvoice()">
                    <i class="mr-1 fa fa-print text-primary-m1 text-120 w-2"></i>
                    Print
                </a>
                <a class="btn bg-white btn-light mx-1px text-95" href="<%= request.getContextPath()%>/?sp_name=ph" data-title="PDF">
                    <i class="mr-1 fa fa-times text-danger-m1 text-120 w-2"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <div class="row mt-4">
            <div class="col-12 col-lg-12">
                <div class="row">
                    <div class="col-12 text-center">
                        <img src="../assets/images/logo.svg" alt="Eduport" height="50px">
                    </div>
                </div>

                <hr class="row brc-default-l1 mx-n1 mb-4" />
                <div class="row">
                    <div class="col-sm-6">
                        <div>
                            <span class="text-sm text-grey-m2 align-middle">To :</span>
                        </div>
                        <div class="text-600 text-110 text-blue my-1">
                            Shivam Menpara
                        </div>
                        <div class="text-grey-m2">
                            <div class="my-1">
                                <b class="text-600">shivampatel635272@gmail.com</b>
                            </div>
                            <div class="my-1">
                                <i class="fa fa-phone fa-flip-horizontal text-secondary"></i>
                                <b class="text-600">+91-6352725171</b>
                            </div>
                        </div>
                    </div>

                    <div class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                        <hr class="d-sm-none" />
                        <div class="text-grey-m2">
                            <div class="mt-1 mb-2 text-secondary-m1 text-600 text-125">
                                Invoice
                            </div>
                            <div class="my-2">
                                <i class="fa fa-circle text-blue-m2 text-xs mr-1"></i>
                                <span class="text-600 text-90">ID :</span> #111-222
                            </div>
                            <div class="my-2">
                                <i class="fa fa-circle text-blue-m2 text-xs mr-1"></i>
                                <span class="text-600 text-90">Issue Date :</span> Oct 12, 2019
                            </div>
                            <div class="my-2">
                                <i class="fa fa-circle text-blue-m2 text-xs mr-1"></i>
                                <span class="text-600 text-90">Status :</span>
                                <span class="badge badge-success badge-pill px-25">Paid</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-4">
                    <div class="row text-600 text-white bgc-default-tp1 py-25">
                        <div class="d-none d-sm-block col-1">#</div>
                        <div class="col-9 col-sm-5">Description</div>
                        <div class="d-none d-sm-block col-4 col-sm-2">Qty</div>
                        <div class="d-none d-sm-block col-sm-2">Unit Price</div>
                        <div class="col-2">Amount</div>
                    </div>
                    <div class="text-95 text-secondary-d3">
                        <div class="row mb-2 mb-sm-0 py-25">
                            <div class="d-none d-sm-block col-1">1</div>
                            <div class="col-9 col-sm-5">Domain registration</div>
                            <div class="d-none d-sm-block col-2">2</div>
                            <div class="d-none d-sm-block col-2 text-95">Rs.6000</div>
                            <div class="col-2 text-secondary-d2">Rs.6000</div>
                        </div>
                    </div>
                    <div class="row border-b-2 brc-default-l2"></div>

                    <div class="row mt-5">
                        <div class="col-12 col-sm-7 text-grey-d2 text-95 mt-2 mt-lg-0">
                            Thanks for working with us!
                        </div>
                        <div class="col-12 col-sm-5 text-grey text-90 order-first order-sm-last">
                            <div class="row">
                                <div class="col-7 text-right">
                                    Total
                                </div>
                                <div class="col-5">
                                    <span class="text-secondary-d1">Rs.6000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

<script type="text/javascript">
    function printInvoice() {
        window.print();
    }
</script>
</body>
</html>
