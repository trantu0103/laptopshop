@extends('master')
@section('content')
<div class="inner-header">
    <div class="container">
      <div class="pull-left">
        <h6 class="inner-title">Đăng nhập</h6>
      </div>
      <div class="pull-right">
        <div class="beta-breadcrumb">
          <a href="{{ route('trang-chu') }}">Trang chủ</a> / <span>Đăng nhập</span>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
  
  <div class="container">
    <div id="content">
      
      <form action="{{ route('postLogin') }}" method="post" class="beta-form-checkout">
        @csrf
        <div class="row">
          <div class="col-sm-3"></div>
          <div class="col-sm-6">
            <h4>Đăng nhập</h4>
            <div class="space20">&nbsp;</div>
            @if(Session::has('message'))
            <div class="alert alert-{{ Session::get('flag') }}">{{ Session::get('message') }}</div>
            @endif
           
            <div class="form-block">
              <label for="email">Email address*</label>
              <input type="email" id="email" name="email">
            </div>
            <div class="form-block">
              <label for="password">Password*</label>
              <input type="password" id="password" name="password">
            </div>
            <div class="form-block">
              <button type="submit" class="btn btn-primary">Đăng nhập</button>
            </div>
          </div>
          <div class="col-sm-3"></div>
        </div>
      </form>
    </div> <!-- #content -->
  </div> <!-- .container -->
  @endsection
