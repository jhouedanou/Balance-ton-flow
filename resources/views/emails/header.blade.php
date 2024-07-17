<tr>
<td class="header text-center" style="text-align:center;">
<a href="{{ route('home') }}" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none text-center">
      <?php $logo_site = Voyager::setting('site.logo', ''); ?>
                 <img src="{{ Voyager::image($logo_site) }}" alt="" srcset="">
      </a> 
</td>
</tr>
