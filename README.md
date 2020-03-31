# Blade Heroicons

<a href="https://github.com/driesvints/blade-heroicons/actions"><img src="https://github.com/driesvints/blade-heroicons/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/driesvints/blade-heroicons"><img src="https://poser.pugx.org/driesvints/blade-heroicons/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/driesvints/blade-heroicons"><img src="https://poser.pugx.org/driesvints/blade-heroicons/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/driesvints/blade-heroicons"><img src="https://poser.pugx.org/driesvints/blade-heroicons/license.svg" alt="License"></a>

A package to easily make use of Heroicons in your Laravel Blade views.

Heroicons originally made by [Steve Schoger](https://twitter.com/steveschoger) and [Adam Wathan](https://twitter.com/adamwathan). For a full list of icons, see [the original Heroicons repository](https://github.com/refactoringui/heroicons).

## Requirements

- PHP 7.4 or higher
- Laravel 7.0 or higher

## Installation

```bash
composer require driesvints/blade-heroicons
```

## Updating

When updating the package always remember to clear your views:

```bash
php artisan view:clear
```

## Usage

Icons can be used a self-closing Blade components which will be compiled to SVG icons:

```blade
<x:icon-o-adjustments/>
```

You can also pass classes to your icon components:

```blade
<x:icon-o-adjustments class="w-6 h-6 text-gray-500"/>
```

The solid icons can be referenced like this:

```blade
<x:icon-s-adjustments/>
```

## Changelog

Check out the [CHANGELOG](CHANGELOG.md) in this repository for all the recent changes.

## License

Blade Heroicons is open-sourced software licensed under [the MIT license](LICENSE.md).
