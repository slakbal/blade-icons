<?php

namespace Dries\Heroicons;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class BladeHeroiconsServiceProvider extends ServiceProvider
{
    private const ICONS = [
        'adjustments',
        'annotation',
    ];

    public function boot()
    {
        $this->loadViewsFrom(__DIR__.'/../views', 'heroicons');

        Blade::component('heroicons::components.outline-md.svg', 'icon-o-svg');
        Blade::component('heroicons::components.solid-sm.svg', 'icon-s-svg');

        collect(self::ICONS)->each(function (string $icon) {
            Blade::component("heroicons::components.outline-md.$icon", "icon-o-$icon");
            Blade::component("heroicons::components.solid-sm.$icon", "icon-s-$icon");
        });
    }
}
