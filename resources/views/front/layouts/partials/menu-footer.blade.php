
@php

if (Voyager::translatable($items)) {
    $items = $items->load('translations');
}

@endphp
@foreach($items as $menu_item)
        @php

        $originalItem = $menu_item;
        if (Voyager::translatable($menu_item)) {
            $menu_item = $menu_item->translate($options->locale);
        }

        $isActive = null;
        $styles = null;
        $icon = null;

        // Background Color or Color
        if (isset($options->color) && $options->color == true) {
            $styles = 'color:'.$menu_item->color;
        }
        if (isset($options->background) && $options->background == true) {
            $styles = 'background-color:'.$menu_item->color;
        }

        // Check if link is current
        if(url($menu_item->link()) == url()->current()){
            $isActive = 'active';
        }

        // Set Icon
        if(isset($options->icon) && $options->icon == true){
            $icon = '<i class="' . $menu_item->icon_class . '"></i>';
        }

        @endphp
    <li class="{{ $isActive }} nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
        <a class="text-center nav-link px-2 nav-link"  href="{{ $menu_item->url }}">{{ $menu_item->title }}
        </a>
        @php
            $submenu = $menu_item->children;
        @endphp

        @if(isset($submenu))
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                @foreach($submenu as $item)
                    <li><a class="dropdown-item" href="{{$item->url}}">{{$item->title}} </a></li>
                @endforeach
            </ul>
        @endif
    </li>
@endforeach
