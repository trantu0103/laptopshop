@extends('master')
@section('content')
<div class="inner-header">
    <div class="container">
      <div class="pull-left">
        <h6 class="inner-title">Liên hệ</h6>
      </div>
      <div class="pull-right">
        <div class="beta-breadcrumb font-large">
          <a href="{{ route('trang-chu') }}">Trang chủ</a> / <span>Liên hệ</span>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
  <div class="beta-map">
    
    <div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.325717655614!2d106.66413881474902!3d10.786346192314811!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ed23ca5d8db%3A0x24d414f45e5a523!2zNTkwIEPDoWNoIE3huqFuZyBUaMOhbmcgOCwgUGjGsOG7nW5nIDExLCBRdeG6rW4gMywgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2sus!4v1568973267434!5m2!1svi!2sus" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div>
  </div>
  <div class="container">
    <div id="content" class="space-top-none">
      
      <div class="space50">&nbsp;</div>
      <div class="row">
        <div class="col-sm-8">
          <h2>Liên hệ</h2>
          <div class="space20">&nbsp;</div>
          <p>Bạn muốn liên hệ với chúng tôi về vấn đề ?</p>
          <div class="space20">&nbsp;</div>
          <form action="{{ route('sendMessage') }}" method="get" class="contact-form">
            @csrf
            <div class="form-block">
              <input name="your-name" type="text" placeholder="Tên (bắt buộc)" required>
            </div>
            <div class="form-block">
              <input name="your-email" type="email" placeholder="Email (bắt buộc)" required>
            </div>
            <div class="form-block">
              <input name="your-subject" type="text" placeholder="Chủ đề (bắt buộc)" required>
            </div>
            <div class="form-block">
              <textarea name="your-message" placeholder="Tin nhắn (bắt buộc)" required></textarea>
            </div>
            <div class="form-block">
              <button type="submit" class="beta-btn primary">Gửi <i class="fa fa-chevron-right"></i></button>
            </div>
          </form>
        </div>
        <div class="col-sm-4">
          <h2>Thông Tin Liên Hệ</h2>
          <div class="space20">&nbsp;</div>

          <h6 class="contact-title">Địa chỉ</h6>
          <p>
            590 CMT8,<br>
            Quận 3 <br>
            TP HCM
          </p>
          <div class="space20">&nbsp;</div>
          <h6 class="contact-title">Hợp tác doanh nghiệp</h6>
          <p>
            Thắc mắc về liên doanh doanh nghiệp. <br>
            <a href="mailto:biz@betadesign.com">show_your_hand@laptopshop.com</a>
          </p>
          <div class="space20">&nbsp;</div>
          <h6 class="contact-title">Tuyển dụng</h6>
          <p>
            Chúng tôi luôn tìm kiếm những tài năng. <br>
            <a href="hr@betadesign.com">hr@laptopshop.com</a>
          </p>
        </div>
      </div>
    </div> <!-- #content -->
  </div> <!-- .container -->
@endsection
