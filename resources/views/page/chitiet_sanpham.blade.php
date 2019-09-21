@extends('master')
@section('content')
<div class="inner-header">
    <div class="container"> 
        <div class="beta-breadcrumb font-large">
          <a href="{{ route('trang-chu') }}">Trang chủ</a> / <span>Thông tin chi tiết</span>
        </div>
      <div class="clearfix"></div>
    </div>
  </div>

  <div class="container">
    <div id="content">
      <div class="row">
        <div class="col-sm-8 col-sm-offset-2">

          <div class="row">
            <div class="col-sm-4">
              <img src="source/image/product/{{ $sanpham->image }}" alt="">
            </div>
            <div class="col-sm-8">
              <div class="single-item-body">
                <p class="single-item-title"><h2>{{ $sanpham->name }}</h2></p>
                <p class="single-item-price">
                  <span class="flash_sale">{{ number_format($sanpham->unit_price) }} VND</span>
                </p>
              </div>

              <div class="clearfix"></div>
              <div class="space20">&nbsp;</div>

              <p>Số lượng:</p>
              <form method="post" action="{{ route('themnhieugiohang') }}">
                @csrf
                <div class="single-item-options">
                <input type="number" min="1" max="5" name="qty" value="1" >
                <input type="hidden" value="{{ $sanpham->id }}" name="id">
                
                <button type="submit" class="btn btn-primary fa fa-shopping-cart"></button>
                <div class="clearfix"></div>
              </div>
              </form>
              
            </div>
          </div>

          <div class="space40">&nbsp;</div>
          <div class="woocommerce-tabs">
            <ul class="tabs">
              <li><a href="#tab-description">Mô tả</a></li>
            </ul>

            <div class="panel" id="tab-description">
              <p>{{ $sanpham->description }}.</p>
            </div>
          </div>
          <div class="space50">&nbsp;</div>
          <div class="beta-products-list">
            <h4>Có thể bạn thích</h4>

            <div class="row">
              @foreach($sp_tuongtu as $sp)
              <div class="col-sm-4">
                <div class="single-item">
                  <div class="single-item-header">
                    <a href="{{ route('chitietsanpham', $sp->id) }}"><img height="150px" src="source/image/product/{{ $sp->image }}" alt=""></a>
                  </div>
                  <div class="single-item-body">
                    <p class="single-item-title">{{ $sp->name }}</p>
                    <p class="single-item-price">
                      <span class="flash-sale">{{ number_format($sp->unit_price) }} VND</span>
                    </p>
                  </div>
                  <div class="single-item-caption">
                    <a class="add-to-cart pull-left" href="{{ route('themgiohang', $sp->id) }}"><i class="fa fa-shopping-cart"></i></a>
                    <a class="beta-btn primary" href="{{ route('chitietsanpham', $sp->id) }}">Chi tiết <i class="fa fa-chevron-right"></i></a>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
              @endforeach
            </div>
          </div> <!-- .beta-products-list -->
        </div>
        
      </div>
    </div> <!-- #content -->
  </div> <!-- .container -->
@endsection
