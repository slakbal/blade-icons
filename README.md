# Blade Heroicons

A package to easily make use of [Heroicons](https://github.com/refactoringui/heroicons) in your Laravel Blade views.

## Requirements

- PHP 7.4 or higher
- Laravel 7.0 or higher

## Installation

```bash
composer require driesvints/blade-heroicons
```

### Usage

Icons can be used a self-closing Blade components which will be compiled to SVG icons:

```blade
<x:icon-o-adjustments/>
```

You can also pass classes to your icon components:

```blade
<x:icon-o-adjustments class="w-6 h-6 text-gray-500" />
```

The solid icons can be referenced like this:

```blade
<x:icon-s-adjustments/>
```

### License

The MIT License. Please see [the license file](LICENSE.md) for more information.
