<?php

namespace App\Http\Controllers\Front;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Page;
use Illuminate\Routing\Controller;

class PagesController extends Controller
{
    //
	public function index()
	{
		$page = Page::where('slug', '/')->where('active', 1)->first();
		return view('front.pages.page')->with('page', $page);
	}

	public function getPage($slug = null)
	{
		$page = Page::where('slug', $slug)->where('status', 'active');
		$page = $page->firstOrFail();

		// return view($page->template)->with('page', $page);
		return view('front.pages.page')->with('page', $page);
	}
}
