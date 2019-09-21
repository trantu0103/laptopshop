@extends('master')
@section('content')
<div class="inner-header">
    <div class="container">
      <div class="pull-left">
        <h6 class="inner-title">Giới thiệu</h6>
      </div>
      <div class="pull-right">
        <div class="beta-breadcrumb font-large">
          <a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Giới thiệu</span>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
</div>

<div class="container">
    <div id="content">

      <div class="space50">&nbsp;</div>
      <h2 class="text-center wow fadeInDown">Chúng Tôi Luôn Làm Việc Với Niềm Đam Mê</h2>
      <div class="space20">&nbsp;</div>
      <p class="text-center wow fadeInLeft">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br /> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
      <div class="space35">&nbsp;</div>

      <div class="row">
        <div class="col-sm-3 col-sm-push-2">
          <div class="beta-counter">
            <p class="beta-counter-icon"><i class="fa fa-user"></i></p>
            <p class="beta-counter-value timer numbers" data-to="19855" data-speed="2000">19855</p>
            <p class="beta-counter-title">Sự hài lòng của khách hàng</p>
          </div>
        </div>


        <div class="col-sm-3 col-sm-push-2">
          <div class="beta-counter">
            <p class="beta-counter-icon"><i class="fa fa-clock-o"></i></p>
            <p class="beta-counter-value timer numbers" data-to="258934" data-speed="2000">258934</p>
            <p class="beta-counter-title">Hỗ trợ</p>
          </div>
        </div>

        <div class="col-sm-3 col-sm-push-2">
          <div class="beta-counter">
            <p class="beta-counter-icon"><i class="fa fa-pencil"></i></p>
            <p class="beta-counter-value timer numbers" data-to="150" data-speed="2000">150</p>
            <p class="beta-counter-title">Sản phẩm mới</p>
          </div>
        </div>
      </div> <!-- .beta-counter block end -->

      <div class="space50">&nbsp;</div>
 
      
    </div> <!-- #content -->
</div> <!-- .container -->
@endsection
