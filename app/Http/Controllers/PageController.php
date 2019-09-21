<?php

namespace App\Http\Controllers;
use App\Slide;
use App\Product;
use App\ProductType;
use App\Cart;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\User;
use Session;
use Hash;
use Auth;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function getIndex() {
      $slide = Slide::all();
      $new_product = Product::where('new', 1)->paginate(4);
      $sanpham_khuyenmai = Product::where('promotion_price', '<>', 0)->paginate(4);
      return view('page.trangchu', compact('slide', 'new_product', 'sanpham_khuyenmai'));
    }

    public function getLoaiSp($type) {
      $sp_theoloai = Product::where('id_type', $type)->get();
      $sp_khac = Product::where('id_type', '<>', $type)->paginate(3);
      $loai = ProductType::all();
      $loai_sp = ProductType::where('id', $type)->first();
      return view('page.loai_sanpham', compact('sp_theoloai', 'sp_khac', 'loai', 'loai_sp'));
    }

    public function getChitiet(Request $req) {
      $sanpham = Product::where('id', $req->id)->first();
      $sp_tuongtu = Product::where('id_type', $sanpham->id_type)->paginate(3);
      return view('page.chitiet_sanpham', compact('sanpham', 'sp_tuongtu'));
    }

    public function getLienHe() {
      return view('page.lienhe');
    }

    public function getGioiThieu() {
      return view('page.gioithieu');
    }

    public function getAddToCart(Request $req, $id, $qty = 1) {
      $product = Product::find($id);
      $oldCart = Session('cart')?Session::get('cart'):null;
      $cart = new Cart($oldCart);
      $cart->add($product, $id);
      $req->session()->put('cart', $cart);

      return redirect()->back();
    }
    public function postAddToCart(Request $req) {
      $product = Product::find($req->id);
      $oldCart = Session('cart')?Session::get('cart'):null;
      $cart = new Cart($oldCart);

      for ($i = 1; $i <= $req->qty; $i++) {
        $cart->add($product, $req->id);
      }   
      $req->session()->put('cart', $cart);

      return redirect()->back();
    }



    public function getDelItemCart($id) {
      $oldCart = Session::has('cart')?Session::get('cart'):null;
      $cart = new Cart($oldCart);
      $cart->removeItem($id);
      if (count($cart->items) > 0) {
        Session::put('cart', $cart);
      } else {
        Session::forget('cart');
      }

      return redirect()->back();
    }

    public function getCheckout() {
      return view('page.dat_hang');
    }

    public function muahang(Request $req) {
      $cart = Session::get('cart');
      if (!$cart) {
        return redirect()->route('trang-chu');
      }

      $customer = new Customer();
      $customer->name = $req->name;
      $customer->gender = $req->gender;
      $customer->email = $req->email;
      $customer->address = $req->address;
      $customer->phone_number = $req->phone; 
      $customer->note = $req->notes; 
      $customer->save();

      $bill = new Bill();
      $bill->id_customer = $customer->id;
      $bill->date_order = date('Y-m-d');
      $bill->total = $cart->totalPrice;
      $bill->payment = $req->payment_method;
      if (isset($req->notes)) {
        $bill->note = $req->notes;
      }
      $bill->save();

      foreach($cart->items as $key=>$value) {
        $bill_detail =  new BillDetail();
        $bill_detail->id_bill = $bill->id;
        $bill_detail->id_product = $key;
        $bill_detail->quantity = $value['qty'];
        $bill_detail->unit_price = $value['price']/$value['qty'];
        $bill_detail->save();
      }

      Session::forget('cart');
      return redirect()->back()->with('thongbao', 'Đặt hàng thành công');

    }

    public function getLogin() {
      return view('page.dangnhap');
    }

    public function postLogin(Request $req) {
      $req->validate(
        [
          'email' => 'required|email',
          'password' => 'required'
        ], 
        [
          'email.required' => 'Vui lòng nhập email',
          'email.email' => 'Không đúng định dạng',
          'password.required' => 'Vui lòng nhập password'

        ]);

      $credentials = array('email' => $req->email, 'password' => $req->password);

      if (Auth::attempt($credentials)) {
        return redirect()->route('trang-chu');
      } else {
        return redirect()->back()->with(['flag' => 'danger' ,'message' => 'Đăng nhập thất bại']);
      }
    }

    public function getRegister() {
      return view('page.dangki');
    }

    public function postRegister(Request $req) {
      $req->validate(
      [
        'email'=>'required|email|unique:users,email',
        'password' => 'required|min:6|max:20',
        'confirm_password' => 'required|same:password|min:6|max:20',
        'phone' => 'required'
      ], 
      [
        'email.required' => 'Vui lòng điền email',
        'email.email' => 'Sai định dạng',
        'email.unique' => 'Email đã có người sử dụng',
        'phone.required' => 'Vui lòng điền phone',
        'password.required' => 'Vui lòng điền password',
        'password.min' => 'Ít nhất 6 kí tự',
        'password.max' => 'Tối đa 20 kí tự',
        'confirm_password.required' => 'Vui lòng điền re_enter password',
        'confirm_password.same' => 'Mật khẩu chưa khớp'
      ]);

      $user = new User();
      $user->full_name = $req->name;
      $user->email = $req->email;
      $user->phone = $req->phone;
      $user->address = $req->address;
      $user->password = Hash::make($req->password);
      $user->save();
      return redirect()->back()->with('thanhcong', 'Tạo tài khoản thành công');
    }

    public function postLogout() {
      Auth::logout();
      return redirect()->route('trang-chu');
    }

    public function search(Request $req) {
      $product = Product::where('name', 'like', '%' . $req->key . '%')->get();
      return view('page.search', compact('product'));
    }

    public function sendMess() {
      return redirect()->route('trang-chu');
    }
 }
